package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import model.UserModel;

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao;

	public void init() {
		userDao = new UserDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		UserModel userModel = (session != null) ? (UserModel)session.getAttribute("userModel") : null;
		if (userModel == null) {  
			request.getRequestDispatcher("login/login.jsp").forward(request, response);
	    } else { 
	    	response.sendRedirect(request.getContextPath() + "/main");
	    } 
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		UserModel userModel = new UserModel();
		userModel.setUsername(username);
		userModel.setPassword(password);

		try {
			int id = userDao.getUserId(userModel);
			if (id > 0) {
				userModel.setId(id);
				userModel = userDao.getUserInfo(userModel);
				if (userModel.getThis_login() == null) {
					userModel.setLast_login(CommonController.getNow());
				} else {
					userModel.setLast_login(userModel.getThis_login());
				}
				userModel.setThis_login(CommonController.getNow());
				userDao.updateUserLogin(userModel);
				HttpSession session = request.getSession(false);
				if (session == null) {
					session = request.getSession(true);
				}
				/*
				 * session.setAttribute("id", userModel.getId());
				 * session.setAttribute("username", userModel.getUsername());
				 * session.setAttribute("password", userModel.getPassword());
				 * session.setAttribute("name", userModel.getName());
				 * session.setAttribute("email", userModel.getEmail());
				 * session.setAttribute("image_real_name", userModel.getImage_real_name());
				 * session.setAttribute("image_name", userModel.getImage_name());
				 */
				session.setAttribute("userModel", userModel);
				response.sendRedirect(request.getContextPath() + "/main");
			} else {
				request.setAttribute("msg", "ログインできませんでした。");
				request.getRequestDispatcher("login/fail.jsp").forward(request, response);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

}
