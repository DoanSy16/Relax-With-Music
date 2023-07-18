package com.poly.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poly.dao.HistoryDAO;
import com.poly.entities.History;
import com.poly.entities.User;

/**
 * Servlet implementation class historyVideo
 */
@WebServlet({ "/historyVideo", "/deleteHistoryVideo", "/deleteFavoriteVideo", "/deleteAllHistory" })
public class HistoryVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HistoryDAO historyDAO;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HistoryVideo() {
		super();
		this.historyDAO = new HistoryDAO();
		// TODO Auto-generated constructor stub
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String uri = request.getRequestURI();
			int idVideo = 0;
			if (request.getParameter("idVideo") != null) {
				idVideo = Integer.valueOf(request.getParameter("idVideo"));
			}
			User user = (User) request.getSession().getAttribute("user");
			if (uri.contains("deleteHistoryVideo")) {
				Date date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dateVideo"));
				History h = this.historyDAO.findVideoDate(idVideo, user.getUsername(), date);
				this.historyDAO.delete(h);
			} else if (uri.contains("deleteFavoriteVideo")) {
				History favorite = this.historyDAO.findIdVideoAndUser(idVideo, user.getUsername(), "isLike");
				favorite.setLike(false);
				favorite.setLikedDate(null);
				this.historyDAO.update(favorite);
				request.setAttribute("favorites", this.historyDAO.loadVideoFavorite(user.getUsername()));
				request.setAttribute("action", "favorite");
			} else if (uri.contains("deleteAllHistory")) {
				List<History> history = this.historyDAO.findAll(user.getUsername());
				for (History h : history) {
					this.historyDAO.delete(h);
				}
			}
			if (this.historyDAO.loadVideoFavorite(user.getUsername()).size() > 0) {
				int i = MainServlet.randomVideo(this.historyDAO.loadVideoFavorite(user.getUsername()).size());
				request.setAttribute("topVideoHistory", this.historyDAO.topViews(user.getUsername(),
						this.historyDAO.loadVideoFavorite(user.getUsername()).get(i).getVideo().getId()));
			}
			if (!uri.contains("deleteFavoriteVideo")) {
				request.setAttribute("historyVideos", this.historyDAO.findAll(user.getUsername()));
				request.setAttribute("action", "watchedvideo");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
			e.printStackTrace();
		}
		request.getRequestDispatcher("/views/index.jsp").forward(request, response);
	}

}
