package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserModel;

public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		UserModel userModel = (session != null) ? (UserModel)session.getAttribute("userModel") : null;
		System.out.println("abac usercontroller doget");
		if (userModel == null) {
			resp.sendRedirect(req.getContextPath() + "/login");
		} else {
			req.setAttribute("userModel", userModel);
			req.getRequestDispatcher("/user/main.jsp").forward(req, resp);
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
