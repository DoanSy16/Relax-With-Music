package com.poly.controller;

import java.awt.Color;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.poly.dao.HistoryDAO;
import com.poly.dao.UserDAO;
import com.poly.dao.VideoDAO;
import com.poly.entities.User;
import com.poly.entities.Video;
import com.poly.utils.CookieUtils;
import com.poly.utils.SendEmailUtils;

/**
 * Servlet implementation class login
 */
@WebServlet({ "/login", "/register", "/sendcode", "/signup", "/forgotPass", "/sendMail", "/changePass" })
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	private VideoDAO videoDAO;
	private final String MAIL_REGEX = "^[\\w\\.=-]+@[\\w\\.-]+\\.[\\w]{2,3}$";
	private String codeMail = "";
	private User user;
	private int dem = 0;
	private String forgotEmail = "", newPassword = "", confrimPassword;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		this.userDAO = new UserDAO();
		this.videoDAO = new VideoDAO();
		this.user = new User();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		if (uri.contains("login")) {
			this.login(request, response);
			request.setAttribute("usernameLogin", this.user.getUsername());
			request.setAttribute("active2", "active");
		} else if (uri.contains("sendMail")) {
			this.forgotPass(request, response);
			request.setAttribute("codeMail", codeMail);
			request.setAttribute("active3", "active");
		} else if (uri.contains("changePass")) {
			this.checkCode(request, response);
			request.setAttribute("codeMail", codeMail);
			request.setAttribute("active3", "active");
		} else {
			this.register(request, response, uri);
			request.setAttribute("codeMail", codeMail);
			request.setAttribute("user", this.user);
			request.setAttribute("active1", "active");
		}
		request.setAttribute("forgotEmail", forgotEmail);
		request.setAttribute("newPassword", newPassword);
		request.setAttribute("confrimPassword", confrimPassword);
		String action = request.getParameter("action");
		request.setAttribute("action", "login");
		request.getRequestDispatcher("/views/index.jsp").forward(request, response);
	}

	protected void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("usernameLogin");
		String password = request.getParameter("passwordLogin");
		String remember = request.getParameter("rememberLogin");
		try {
			User entity = (User) this.userDAO.finduser(username, username);
			this.user = entity;
			if (entity.isActive() == false) {
				request.setAttribute("check", "Tài khoản của bạn đã bị khóa");
			} else if (!entity.getPassword().equals(password)) {
				request.setAttribute("check", "Sai mật khẩu");
			} else {
				request.setAttribute("check", null);
				request.getSession().setAttribute("user", entity);
				int hours = (remember == null) ? 0 : 30 * 24;
				CookieUtils.add("username", entity.getUsername(), hours, response);
				CookieUtils.add("password", entity.getPassword(), hours, response);
				System.out.println("Đăng nhập thành công");
			}
		} catch (Exception e) {
			// TODO: handle exception
			request.setAttribute("check", "Tài khoản không tồn tại");
			e.printStackTrace();
		}

	}

	protected void register(HttpServletRequest request, HttpServletResponse response, String uri)
			throws ServletException, IOException {
		try {
			if (dem == 3) {
				codeMail = null;
				request.setAttribute("codeMail", codeMail);
				request.setAttribute("checkLogout", "Vui lòng gửi lại mã đăng ký!");
			}
			User entity = new User();
			BeanUtils.populate(entity, request.getParameterMap());
			this.user = entity;
				if (uri.contains("sendcode")) {
					random();
					String subject = "Mã đăng nhập của bạn!";
					SendEmailUtils.sendMail(subject, entity.getEmail(), codeMail);
				} else

				if (uri.contains("signup")) {
					String code = request.getParameter("code");
					if (!codeMail.equals(code)) {
						request.setAttribute("checkLogout", "Mã không hợp lệ!");
						dem++;
					} else {
						entity.setImage("user.png");
						entity.setPosition("Khách hàng");
						entity.setActive(true);
						this.userDAO.create(entity);
						codeMail = null;
						request.setAttribute("codeMail", codeMail);
						System.out.println("Đăng ký thành công!");
						request.setAttribute("user", null);
						dem = 0;
					}
				}

		} catch (

		Exception e) {
			// TODO: handle exception
		}

	}

	protected void forgotPass(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("forgotEmail");
		forgotEmail = email;
		try {
			User entity = (User) this.userDAO.finduser(email, email);
			request.setAttribute("alert", "success");
			random();
			String subject = "Mã đăng nhập của bạn!";
			SendEmailUtils.sendMail(subject, entity.getEmail(), codeMail);
			request.setAttribute("message", "Gửi mã thành công!");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			request.setAttribute("alert", "error");
			request.setAttribute("message", "Email không tồn tại!");
			request.setAttribute("codeMail", null);
		}
	}

	protected void checkCode(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			if (dem == 3) {
				codeMail = "";
				request.setAttribute("codeMail", codeMail);
				request.setAttribute("alert", "error");
				request.setAttribute("message", "Vui lòng gửi lại mã!");
				dem = 0;
			} else {
				String code = request.getParameter("forgotCode");
				String newPass = request.getParameter("forgotNewPass");
				String confirmPass = request.getParameter("forgotConfirmPass");
				newPassword = newPass;
				confrimPassword = confirmPass;
				User user = (User) this.userDAO.finduser(forgotEmail, forgotEmail);
				if (!codeMail.equals(code)) {
					request.setAttribute("alert", "error");
					request.setAttribute("message", "Bạn đã nhập sai mã!");
					dem++;
				} else if (newPass.equals(user.getPassword())) {
					request.setAttribute("alert", "error");
					request.setAttribute("message", "Mật khẩu mới trùng với mật khẩu cũ!");
				} else if (!newPass.equals(confirmPass)) {
					request.setAttribute("alert", "error");
					request.setAttribute("message", "Nhập lại mật khẩu không đúng!");

				} else {
					user.setPassword(newPass);
					this.userDAO.update(user);
					request.setAttribute("alert", "success");
					request.setAttribute("message", "Cập nhật thành công!");
					codeMail = null;
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}

	}

	public void random() {
		for (int i = 0; i < 6; i++) {
			codeMail = codeMail + (int) (Math.floor(Math.random() * 9));
		}
	}

//	

}
