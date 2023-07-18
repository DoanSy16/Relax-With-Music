package com.poly.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.poly.dao.HistoryDAO;
import com.poly.dao.ShareDAO;
import com.poly.dao.UserDAO;
import com.poly.dao.VideoDAO;
import com.poly.entities.History;
import com.poly.entities.User;

/**
 * Servlet implementation class createuser
 */
@WebServlet({ "/createuser", "/new", "/insert", "/edit", "/loadData", "/active", "/delete" })
public class CreateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	private VideoDAO videoDAO;
	private HistoryDAO historyDAO;
	private ShareDAO shareDAO;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateUser() {
		super();
		this.userDAO = new UserDAO();
		this.videoDAO = new VideoDAO();
		this.historyDAO = new HistoryDAO();
		this.shareDAO = new ShareDAO();

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
		if (uri.contains("loadData")) {
			this.loadUser(request, response);
		} else if (uri.contains("insert")) {
			this.create(request, response);
		} else if (uri.contains("edit")) {
			this.update(request, response);
		} else if (uri.contains("delete")) {
			this.delete(request, response);
		} else if (uri.contains("active")) {
			this.setActive(request, response);
		} else {
			this.newUser(request, response);
		}
		try {
			request.setAttribute("managerVideo", this.videoDAO.loadVideoTrend());
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		request.setAttribute("active4", "active");
		request.setAttribute("action", "manager");
		request.getRequestDispatcher("/views/index.jsp").forward(request, response);

	}

	protected void loadUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			User user =(User) request.getSession().getAttribute("user");
			String id = request.getParameter("userAction");
			request.setAttribute("User", this.userDAO.finId(id));
			request.setAttribute("buttonNew", "new");
			if (this.historyDAO.findAll(id).size() > 0 || this.shareDAO.findIdUser(id).size() > 0 || user.getUsername().equalsIgnoreCase(id)) {
				request.setAttribute("buttonDelete", null);
			} else {
				request.setAttribute("buttonDelete", id);
			}
			request.setAttribute("createUser", this.userDAO.findAll());
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
	}

	protected void newUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setAttribute("createUser", this.userDAO.findAll());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	protected void create(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			User entity = new User();
			BeanUtils.populate(entity, request.getParameterMap());
			this.userDAO.create(entity);
			request.setAttribute("createUser", this.userDAO.findAll());
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("CreateUserManager: " + e);
			e.printStackTrace();
		}
	}

	protected void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			User entity = new User();
			BeanUtils.populate(entity, request.getParameterMap());
			entity.setImage(this.userDAO.finId(entity.getUsername()).getImage());
			entity.setLiked(this.userDAO.finId(entity.getUsername()).getLiked());
			entity.setShare(this.userDAO.finId(entity.getUsername()).getShare());
			entity.setActive(true);
			this.userDAO.update(entity);
			request.setAttribute("createUser", this.userDAO.findAll());
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
	}

	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			User entity = this.userDAO.finId(request.getParameter("username"));
			this.userDAO.delete(entity);
			request.setAttribute("createUser", this.userDAO.findAll());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	protected void setActive(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("userAction");
		try {
			User entity = this.userDAO.finId(username);
			if (entity.isActive() == true) {
				entity.setActive(false);
			} else {
				entity.setActive(true);
			}
			this.userDAO.update(entity);
			request.setAttribute("createUser", this.userDAO.findAll());
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
	}
//d
}
