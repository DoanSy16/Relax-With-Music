package com.poly.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import com.poly.dao.UserDAO;
import com.poly.entities.User;

/**
 * Servlet implementation class updateuser
 */
@MultipartConfig
@WebServlet({ "/updateuser", "/changepassword" })
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateUser() {
		super();
		this.userDAO = new UserDAO();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		if (uri.contains("updateuser")) {
			this.update(request, response);
			request.setAttribute("active2", null);
			request.setAttribute("active1", "active");
		} else if (uri.contains("changepassword")) {
			this.changePassword(request, response);
		}
		request.setAttribute("action", "infor");
		request.getRequestDispatcher("/views/index.jsp").forward(request, response);
	}

	protected void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			User entity = new User();
//		User user =new User();
			BeanUtils.populate(entity, request.getParameterMap());
			entity.setPassword(this.userDAO.finId(entity.getUsername()).getPassword());
			entity.setPosition(this.userDAO.finId(entity.getUsername()).getPosition());
			if (request.getPart("image").getSubmittedFileName() == null) {
				entity.setImage(this.userDAO.finId(entity.getUsername()).getImage());
			} else {
				File dir = new File(request.getServletContext().getRealPath("/views/imgusers"));
				if (!dir.exists()) {
					dir.mkdirs();
				}
				Part photo = request.getPart("image");
				File photoFile = new File(dir,
						CreateVideo.renameFile(photo.getSubmittedFileName(), entity.getUsername()));
				photo.write(photoFile.getAbsolutePath());
				entity.setImage(CreateVideo.renameFile(photo.getSubmittedFileName(), entity.getUsername()));
			}
			entity.setLiked(this.userDAO.finId(entity.getUsername()).getLiked());
			entity.setShare(this.userDAO.finId(entity.getUsername()).getShare());
			entity.setActive(true);
			this.userDAO.update(entity);
			request.getSession().setAttribute("user", this.userDAO.finId(entity.getUsername()));
			System.out.println("Cập nhật thành công");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			e.printStackTrace();
		}
	}

	protected void changePassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String oldPass = request.getParameter("oldpass");
		String newPass = request.getParameter("newpass");
		String confirmPass = request.getParameter("confirmnewpass");
		User user = (User) request.getSession().getAttribute("user");
		try {
			if (!oldPass.equalsIgnoreCase(user.getPassword())) {
				request.setAttribute("check", "Mật khẩu cũ sai!");
			} else if (oldPass.equals(newPass)) {
				request.setAttribute("check", "Mật khẩu ,ới trùng với mật khẩu mới");
			} else if (!newPass.equals(confirmPass)) {
				request.setAttribute("check", "Mật khẩu nhập lại sai!");
			} else {
				user.setPassword(newPass);
				this.userDAO.update(user);
				System.out.println("Cập nhật thành công");
			}
			request.setAttribute("active2", "active");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}

	}

}
