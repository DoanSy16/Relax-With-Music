package com.poly.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poly.dao.HistoryDAO;
import com.poly.dao.ShareDAO;
import com.poly.dao.VideoDAO;
import com.poly.entities.History;
import com.poly.entities.Share;
import com.poly.entities.User;
import com.poly.entities.Video;

/**
 * Servlet implementation class SearchByAjax
 */
@WebServlet({ "/searchAjax", "/searchByNameHistory", "/selectUserFavorite", "/selectUserShare" })
public class SearchByAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private VideoDAO videoDAO;
	private HistoryDAO historyDAO;
	private ShareDAO shareDAO;
	List<Video> list;
	List<History> listHistory;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchByAjax() {
		super();
		this.videoDAO = new VideoDAO();
		this.historyDAO = new HistoryDAO();
		this.shareDAO = new ShareDAO();
		try {
			listHistory = this.historyDAO.loadAllHistory();
			list = this.videoDAO.findAll();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated constructor stub
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String txtSearch = request.getParameter("txt");
		int check = 0;
		String click = "";
		String button = "";
		String edit = "";
		User user = (User) request.getSession().getAttribute("user");
		PrintWriter out = response.getWriter();
		for (Video video : list) {
			if ("".equals(txtSearch)) {
				check++;
				request.setAttribute("end", "1");
			} else {
				request.setAttribute("end", "6");
			}
			if (check == 7) {
				break;
			}
			if (video.getTitle().toLowerCase().contains(txtSearch.toLowerCase()) && video.isIsactive() == true) {
				if (user == null) {
					click = "<a onclick=\"checkLogin()\">\r\n"
							+ "										<div class=\"mask \"\r\n"
							+ "											style=\"background-color: rgba(62, 69, 81, .7); display: flex; justify-content: center; align-items: center;\">\r\n"
							+ "											<i class=\"fa fa-play fs-3 white-text \"></i>\r\n"
							+ "										</div>\r\n"
							+ "									</a>";
					button = "<button onclick=\"checkLogin()\"\r\n"
							+ "												class=\"btn btn-primary btn-rounded font-weight-bold w-72px \">\r\n"
							+ "												" + video.getLiked()
							+ " <i class=\"far fa-thumbs-up\"></i>\r\n"
							+ "											</button>\r\n"
							+ "											<button onclick=\"checkLogin()\"\r\n"
							+ "												class=\"btn btn-amber btn-rounded font-weight-bold w-72px\">\r\n"
							+ "												" + video.getShares()
							+ " <i class=\"fa fa-share\"></i>\r\n"
							+ "											</button>";
				} else {
					click = "<a href=\"./main?action=video&idVideo=" + video.getId() + "\">\r\n"
							+ "										<div class=\"mask \"\r\n"
							+ "											style=\"background-color: rgba(62, 69, 81, .7); display: flex; justify-content: center; align-items: center;\">\r\n"
							+ "											<i class=\"fa fa-play fs-3 white-text \"></i>\r\n"
							+ "										</div>\r\n"
							+ "									</a>";
					button = "<form class=\"d-inline\" action=\"./LikeShare\" method=\"post\">\r\n"
							+ "												<button formaction=\"./like?idVideo="
							+ video.getId() + "\"\r\n"
							+ "													class=\"btn btn-primary btn-rounded font-weight-bold w-72px \">\r\n"
							+ "													" + video.getLiked()
							+ " <i class=\"far fa-thumbs-up\"></i>\r\n"
							+ "												</button>\r\n"
							+ "											</form>\r\n"
							+ "											<a class=\"btn btn-amber btn-rounded font-weight-bold w-72px\"\r\n"
							+ "												data-toggle=\"modal\" data-target=\"#myModal"
							+ video.getId() + "\">\r\n" + "												"
							+ video.getShares() + " <i class=\"fa fa-share\"></i>\r\n"
							+ "											</a>\r\n"
							+ "											<a href=\"./main?action=video&idVideo="
							+ video.getId() + "\"\r\n"
							+ "												class=\"btn btn-green btn-rounded font-weight-bold w-72px\"><i\r\n"
							+ "												class=\"fa fa-play fs-1 white-text \"></i></a>";
					if (user.getPosition().equalsIgnoreCase("Admin")
							|| user.getPosition().equalsIgnoreCase("Nhân viên")) {
						edit = "<div\r\n" + "								\">\r\n"
								+ "									<form action=\"./main\" method=\"post\">\r\n"
								+ "										<button formaction=\"./editNewVideo?idEditVideo="
								+ video.getId() + "\"\r\n"
								+ "											class=\"btn btn-reddit btn-rounded font-weight-bold w-72px\">Sửa</button>\r\n"
								+ "									</form>\r\n"
								+ "								</div>";
					}
				}
				out.println("<div class=\"col-md-4 mt-5 \">\r\n"
						+ "						<div class=\"col-md-12 p-3 \"\r\n"
						+ "							style=\"min-height: 200px; border-radius: 20px; border: 2px solid darkgrey\">\r\n"
						+ "							<i class=\"fa fa-eye fs-1-5 \"\r\n"
						+ "								style=\"position: absolute; z-index: 200; left: 20px; top: 20px; color: ghostwhite;\">\r\n"
						+ video.getViews() + "</i>\r\n" + "							<div\r\n"
						+ "								class=\"view overlay z-depth-1 d-flex justify-content-center white \"\r\n"
						+ "								style=\"border-radius: 10px;\">\r\n" + "\r\n"
						+ "								<img src=\"views/images/" + video.getPoster() + "\"\r\n"
						+ "									alt=\"Sample project image\" style=\"height: 150px; width: 100%;\">\r\n"
						+ click + "							</div>\r\n" + "\r\n"
						+ "							<div class=\"px-3 pt-3 mx-1 mt-1 pb-0 \">\r\n"
						+ "								<h4 class=\"font-weight-bold mb-3\" id=\"content\">"
						+ video.getTitle() + "</h4>\r\n"
						+ "								<div class=\"row\" style=\"display: flex; justify-content: center;\">\r\n"
						+ "									<div>\r\n" + button
						+ "									</div>\r\n" + edit
						+ "								</div>\r\n" + "							</div>\r\n"
						+ "						</div>\r\n" + "					</div>");
			}

		}
	}

	protected void searchByNameHistory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		try {
			User user = (User) request.getSession().getAttribute("user");
			String txtSearch = request.getParameter("txt");
			PrintWriter out = response.getWriter();
			for (History history : listHistory) {
				if ((history.getVideo().getTitle()).toLowerCase().contains(txtSearch.toLowerCase())
						&& history.getUser().getUsername().equalsIgnoreCase(user.getUsername())) {
					out.println("				<a href=\"./main?action=video&idVideo=" + history.getVideo().getId()
							+ "\">\r\n" + "					<div class=\"col-sm-12 mt-5 history\">\r\n"
							+ "						<a\r\n"
							+ "							href=\"./deleteHistoryVideo?idVideo="
							+ history.getVideo().getId() + "&dateVideo=" + history.getViewsDate() + "\">\r\n"
							+ "							<h1 class=\"position-absolute x\">&times;</h1> <small\r\n"
							+ "							class=\"pop position-absolute\">Xóa video khỏi danh nhật ký</small>\r\n"
							+ "						</a> <a href=\"#\">\r\n"
							+ "							<li class=\"li\">\r\n"
							+ "								<h1 class=\"position-absolute bars \">&#9776;</h1>\r\n"
							+ "\r\n" + "								<ul class=\"position-absolute\">\r\n"
							+ "									<form class=\"d-inline\" action=\"./LikeShare\" method=\"post\">\r\n"
							+ "										<button\r\n"
							+ "											formaction=\"./like?action=watchedvideo&idVideo="
							+ history.getVideo().getId() + "\"\r\n"
							+ "											class=\"btn btn-primary btn-rounded font-weight-bold w-72px \">\r\n"
							+ "											" + history.getVideo().getLiked()
							+ " Like <i class=\"far fa-thumbs-up\"></i>\r\n"
							+ "										</button>\r\n"
							+ "									</form>\r\n"
							+ "									<button class=\"btn btn-amber btn-rounded font-weight-bold w-50\"\r\n"
							+ "										data-toggle=\"modal\" data-target=\"#myModal"
							+ history.getVideo().getId() + ">\r\n"
							+ "										Share <i class=\"fa fa-share\"></i>\r\n"
							+ "									</button>\r\n"
							+ "								</ul>\r\n" + "\r\n" + "						</li>\r\n"
							+ "						</a>\r\n" + "\r\n"
							+ "						<div class=\"col-sm-4 p-3 \" style=\"min-height: 100px\">\r\n"
							+ "							<div\r\n"
							+ "								class=\"view overlay z-depth-1 d-flex justify-content-center white \"\r\n"
							+ "								style=\"border-radius: 10px;\">\r\n"
							+ "								<img src=\"./views/images/" + history.getVideo().getPoster()
							+ "\"\r\n"
							+ "									alt=\"Sample project image\" style=\"height: 150px; width: 100%;\">\r\n"
							+ "								<a href=\"./main?action=video&idVideo="
							+ history.getVideo().getId() + "\">\r\n"
							+ "									<div class=\"mask \"\r\n"
							+ "										style=\"background-color: rgba(62, 69, 81, .7); display: flex; justify-content: center; align-items: center;\">\r\n"
							+ "										<i class=\"fa fa-play fs-3 white-text \"></i>\r\n"
							+ "									</div>\r\n" + "								</a>\r\n"
							+ "							</div>\r\n" + "						</div>\r\n"
							+ "						<div class=\"col-sm-8 text-left title\">\r\n"
							+ "							<h3 class=\"font-weight-500 mt-3\" style=\"width: 90%\">"
							+ history.getVideo().getTitle() + "</h3>\r\n"
							+ "							<i class=\"fa fa-eye fs-1-5 ml-5 mt-2 dark-grey-text mt-2\">\r\n"
							+ "								" + history.getVideo().getViews() + "</i> <i\r\n"
							+ "								class=\"fa fa-share fs-1-5 ml-5 mt-2 dark-grey-text mt-2\">\r\n"
							+ "								" + history.getVideo().getShares() + "</i> <i\r\n"
							+ "								class=\"fa fa-clock fs-1-5 ml-5 mt-2 dark-grey-text mt-2\">\r\n"
							+ "								" + history.getViewsDate() + "</i>\r\n"
							+ "							<h4 class=\"mt-3 dark-grey-text\" id=\"content\">${history.video.description}</h4>\r\n"
							+ "						</div>\r\n" + "					</div>\r\n" + "				</a>");
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	protected void selectUserFavorite(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int id = 0;
		id = Integer.valueOf(request.getParameter("select"));
		try {
			if (id != 0) {
				List<History> favorite = this.historyDAO.loadFavoriteVideo(id);
				PrintWriter out = response.getWriter();
				for (History fav : favorite) {
					out.println("<tr>\r\n" + "									<td data-label=\"Tên đăng nhập\">"
							+ fav.getUser().getUsername() + "</td>\r\n"
							+ "									<td data-label=\"Họ và tên\">"
							+ fav.getUser().getFullname() + "</td>\r\n"
							+ "									<td data-label=\"Email\">" + fav.getUser().getEmail()
							+ "</td>\r\n" + "									<td data-label=\"Ngày thích\">"
							+ fav.getLikedDate() + "</td>\r\n" + "								</tr>");
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	protected void selectUserShare(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int id = 0;
		id = Integer.valueOf(request.getParameter("selectShare"));
		try {
			if (id != 0) {
				List<Share> share = this.shareDAO.findAllIdVideo(id);
				PrintWriter out = response.getWriter();
				for (Share sh : share) {
					out.println("<tr>\r\n" + "									<td data-label=\"Tên đăng nhập\">"
							+ sh.getUser().getUsername() + "</td>\r\n"
							+ "									<td data-label=\"Họ và tên\">"
							+ sh.getUser().getFullname() + "</td>\r\n"
							+ "									<td data-label=\"Email\">" + sh.getUser().getEmail()
							+ "</td>\r\n" + "									<td data-label=\"Ngày thích\">"
							+ sh.getShareDate() + "</td>\r\n" + "								</tr>");
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uri = request.getRequestURI();
		if (uri.contains("searchAjax")) {
			this.processRequest(request, response);
		} else if (uri.contains("searchByNameHistory")) {
			this.searchByNameHistory(request, response);
		} else if (uri.contains("selectUserFavorite")) {
			this.selectUserFavorite(request, response);
		} else if (uri.contains("selectUserShare")) {
			this.selectUserShare(request, response);
		}

	}

}
