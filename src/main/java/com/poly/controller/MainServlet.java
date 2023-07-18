package com.poly.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poly.dao.HistoryDAO;
import com.poly.dao.ShareDAO;
import com.poly.dao.UserDAO;
import com.poly.dao.VideoDAO;
import com.poly.entities.History;
import com.poly.entities.User;
import com.poly.entities.Video;
import com.poly.utils.CookieUtils;

import net.bytebuddy.asm.Advice.This;

/**
 * Servlet implementation class main
 */
@WebServlet("/main")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	private VideoDAO videoDAO;
	private HistoryDAO historyDAO;
	long millis = System.currentTimeMillis();
	java.sql.Date day = new java.sql.Date(millis);
	private ShareDAO shareDAO;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MainServlet() {
		super();
		this.userDAO = new UserDAO();
		this.videoDAO = new VideoDAO();
		this.historyDAO = new HistoryDAO();
		this.shareDAO = new ShareDAO();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	// update lịch sử xem
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			request.setAttribute("createUser", this.userDAO.findAll());
			request.setAttribute("videoHome", this.videoDAO.findAll());
			request.setAttribute("end", this.videoDAO.findAll().size());
			request.setAttribute("videoTrend", this.videoDAO.loadVideoTrend());
			if (request.getSession().getAttribute("user") != null) {
				User user = (User) request.getSession().getAttribute("user");
				request.setAttribute("historyVideos", this.historyDAO.findAll(user.getUsername()));
				request.setAttribute("favorites", this.historyDAO.loadVideoFavorite(user.getUsername()));
				request.setAttribute("videoEdit", this.videoDAO.loadEditVideo());
				request.setAttribute("userFavorite", this.historyDAO.loadAllFavorite());
				request.setAttribute("shareVideos", this.shareDAO.findIdUser(user.getUsername()));
				if (this.historyDAO.loadVideoFavorite(user.getUsername()).size()>0) {
					int i = MainServlet.randomVideo(this.historyDAO.loadVideoFavorite(user.getUsername()).size());
					request.setAttribute("topVideoHistory", this.historyDAO.topViews(user.getUsername(),
							this.historyDAO.loadVideoFavorite(user.getUsername()).get(i).getVideo().getId()));
				}
					
				if (user.getPosition().equalsIgnoreCase("admin") || user.getPosition().equalsIgnoreCase("Nhân viên")) {
					request.setAttribute("managerVideo", this.videoDAO.loadVideoTrend());
				}
			}

		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		String username = CookieUtils.get("username", request);
		String password = CookieUtils.get("password", request);
		request.setAttribute("usernameLogin", username);
		request.setAttribute("passwordLogin", password);
		String action = request.getParameter("action");
		String button = request.getParameter("button");
		String uri = request.getRequestURI();
		String checkForm = request.getParameter("checkform");
		if ("logout".equals(action)) {
			request.getSession().removeAttribute("user");
		}
		if ("login".equals(checkForm)) {
			request.setAttribute("active2", "active");
		} else if ("forgotPassMenu".equals(checkForm)) {
			request.setAttribute("active3", "active");
		} else {
			request.setAttribute("active1", "active");
		}
		if (action != null) {
			if (action.equals("video")) {
				this.loadVideo(request, response);
			}
		}
		request.setAttribute("action", action);
		request.getRequestDispatcher("/views/index.jsp").forward(request, response);
	}

	protected void loadVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int idVideo = Integer.valueOf(request.getParameter("idVideo"));
		try {
			User user = (User) request.getSession().getAttribute("user");
			Video entity = this.videoDAO.findId(idVideo);
			entity.setViews(entity.getViews() + 1);
			this.videoDAO.update(entity);
			request.setAttribute("mainVideo", entity);
			request.setAttribute("listVideos", this.videoDAO.loadVideo(idVideo));
			History h = this.historyDAO.findVideoDate(idVideo, user.getUsername(), day());
			if (h == null) {
				this.historyVideo(request, response, idVideo);
			}
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}

	}

	protected void historyVideo(HttpServletRequest request, HttpServletResponse response, int id)
			throws ServletException, IOException {
		try {
			User user = (User) request.getSession().getAttribute("user");
			History historyEntity = new History();
			historyEntity.setUser(user);
			historyEntity.setVideo(this.videoDAO.findId(id));
			historyEntity.setViewsDate(day());
			historyEntity.setLikedDate(null);
			this.historyDAO.create(historyEntity);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public java.sql.Date day() {
		return day;
	}

	public static int randomVideo(int i) {
		return (int) Math.floor(Math.random() * i);
	}

}
