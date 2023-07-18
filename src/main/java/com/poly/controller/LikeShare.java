package com.poly.controller;

import java.io.IOException;
import java.util.Iterator;
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
import com.poly.entities.Share;
import com.poly.entities.User;
import com.poly.entities.Video;
import com.poly.utils.SendEmailUtils;

/**
 * Servlet implementation class LikeShare
 */
@WebServlet({ "/LikeShare", "/like", "/share", "/seeMore", "/sendmailContact" })
public class LikeShare extends HttpServlet {
	private static final long serialVersionUID = 1L;
	long millis = System.currentTimeMillis();
	java.sql.Date day = new java.sql.Date(millis);
	private UserDAO userDAO;
	private VideoDAO videoDAO;
	private HistoryDAO historyDAO;
	private ShareDAO shareDAO;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LikeShare() {
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

		if (uri.contains("like")) {
			this.likeVideo(request, response);
		} else if (uri.contains("share")) {
			this.shareVideo(request, response);
		} else if (uri.contains("sendmailContact")) {
			User user = (User) request.getSession().getAttribute("user");
			String subject = request.getParameter("subject");
			String body = request.getParameter("body");
			SendEmailUtils.sendMail(subject, user.getEmail(), body);
		} else if (uri.contains("seeMore")) {
			request.setAttribute("seemore", "seemore");
			return;
		}
		try {
			request.setAttribute("videoHome", this.videoDAO.findAll());
			String action = request.getParameter("action");
			request.setAttribute("action", action);
			request.getRequestDispatcher("/views/index.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
	}

	protected void likeVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int idVideo = Integer.valueOf(request.getParameter("idVideo"));
		try {
			User user = (User) request.getSession().getAttribute("user");
			Video video = this.videoDAO.findId(idVideo);
			History isLike = this.historyDAO.findIdVideoAndUser(idVideo, user.getUsername(), "isLike");
			History history = this.historyDAO.findIdVideoAndUser(idVideo, user.getUsername(), null);
			if (isLike == null && history == null) {
				History likes = new History();
				likes.setUser(user);
				likes.setVideo(video);
				likes.setViewsDate(day());
				likes.setLikedDate(day());
				likes.setLike(true);
				this.historyDAO.create(likes);
				video.setViews(video.getViews() + 1);
				video.setLiked(video.getLiked() + 1);
				video.setEndDate(day());
				this.videoDAO.update(video);
			}
			if (isLike == null && history != null) {
				history.setLikedDate(day());
				history.setLike(true);
				this.historyDAO.update(history);
				video.setViews(video.getViews() + 1);
				video.setLiked(video.getLiked() + 1);
				video.setEndDate(day());
				this.videoDAO.update(video);
			}
			request.setAttribute("historyVideos", this.historyDAO.findAll(user.getUsername()));
			request.setAttribute("videoHome", this.videoDAO.findAll());
			request.setAttribute("shareVideos", this.shareDAO.findIdUser(user.getUsername()));
			request.setAttribute("mainVideo", video);
			request.setAttribute("listVideos", this.videoDAO.loadVideo(idVideo));
			request.setAttribute("favorites", this.historyDAO.loadVideoFavorite(user.getUsername()));
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	protected void shareVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String toEmail = request.getParameter("toEmail");
		int idVideo = Integer.valueOf(request.getParameter("idVideo"));
		try {
			User user = (User) request.getSession().getAttribute("user");
			Video video = this.videoDAO.findId(idVideo);
			String subject = "Tài khoản " + user.getEmail() + " đã chia sẻ cho bạn!";
			String body = video.getTitle() + "\n" + video.getHref();
			Share entity = new Share();
			entity.setUser(user);
			entity.setVideo(video);
			entity.setEmails(toEmail);
			entity.setShareDate(day());
			this.shareDAO.create(entity);
			video.setShares(video.getShares() + 1);
			this.videoDAO.update(video);
			SendEmailUtils.sendMail(subject, toEmail, body);
			request.setAttribute("videoHome", this.videoDAO.findAll());
			request.setAttribute("mainVideo", video);
			request.setAttribute("listVideos", this.videoDAO.loadVideo(idVideo));
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public java.sql.Date day() {
		return day;
	}
}
