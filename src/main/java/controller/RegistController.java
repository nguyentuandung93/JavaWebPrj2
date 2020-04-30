package controller;

import java.io.File;
import java.io.IOException;
import java.util.Base64;
import java.util.List;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;

import dao.UserDao;
import model.UserModel;

public class RegistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao;
	private String uploadPath = "";
	private String uploadTempPath = "";
	private String uploadUserPath = "";
	public void init() {
		userDao = new UserDao();
		uploadPath = getServletContext().getRealPath(getServletContext().getInitParameter("upload-path"));
		uploadTempPath = uploadPath + "/" + "temp";
		uploadUserPath = uploadPath + "/"+ "user";
		File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
        	uploadDir.mkdir();
        }
        File uploadTempDir = new File(uploadTempPath);
        if (!uploadTempDir.exists()) {
        	uploadTempDir.mkdir();
        }
        File uploadUserDir = new File(uploadUserPath);
        if (!uploadUserDir.exists()) {
        	uploadUserDir.mkdir();
        }
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		request.getRequestDispatcher("register/register.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg = "";
		boolean status = true;
		
		String userName = "";
		String passWord = "";
		String fileName = "";
		String fileRealName = "";
		try {
	        List<FileItem> fileItems = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
	        if (fileItems != null && fileItems.size() > 0) {
	        	for (FileItem item : fileItems) {
		            if (item.isFormField()) { // ユーザー名、パスワード
		            	if (item.getFieldName().equals("username")) {
		                	userName = item.getString();
		                }
						if (item.getFieldName().equals("password")) {
							passWord = item.getString();           	
		                }
		            } else { // ファイル
		            	fileName = new File(item.getName()).getName();
		                // ファイルタイプをチェック
		                String mimetype= new MimetypesFileTypeMap().getContentType(new File(fileName));
		                String type = mimetype.split("/")[0];
		                if (type == null || !type.equals("image")) {
		                	status = false;
		        	    	msg = "画像ファイルではありません。";
		                } else {
		                	fileName = CommonController.getNow("yyyyMMddHHmmss") + "_" + fileName;
		                	int i = fileName.lastIndexOf('.');
		                    String fileE = fileName.substring(i+1);
		                    String fileN = fileName.substring(0, i);
			                fileRealName = Base64.getUrlEncoder().encodeToString(fileN.getBytes());
			                fileRealName = fileRealName + '.' + fileE;
			                item.write(new File(uploadTempPath + "/" + fileRealName));
		                }
		            }
		        }
	        }
	    } catch (Exception e) {
	    	status = false;
	    	msg = e.toString() + "のエラーが発生しました。";
	    }
		if (status) {
			try {
				if (userDao.issetUser(userName)) {
					status = false;
			    	msg = "このユーザー名が既に登録しました。";
				} else {
					UserModel userModel = new UserModel();
					userModel.setUsername(userName);
					userModel.setPassword(passWord);
					userModel.setImage_real_name(fileRealName);
					userModel.setImage_name(fileName);
					userModel.setRegist_date(CommonController.getNow());
					if (userDao.addUser(userModel) <= 0) {
						status = false;
				    	msg = "DBに登録できませんでした。";
					} else {
						//　ファイルを移動する
						File source = new File(uploadTempPath + "/" + fileRealName);
						File dest = new File(uploadUserPath + "/" + fileRealName);
						FileUtils.copyFile(source, dest);
					    source.delete();
					}
				}
			} catch (Exception e) {
				status = false;
		    	msg = e.toString() + "のエラーが発生しました。";
			}
		}
		if (status) {
			response.setContentType("text/html");
			request.getRequestDispatcher("register/success.jsp").forward(request, response);
		} else {
			response.setContentType("text/html");
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("register/fail.jsp").forward(request, response);
		}
	}
}
