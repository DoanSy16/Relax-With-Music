package com.poly.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.io.FilenameUtils;

import com.poly.dao.HistoryDAO;
import com.poly.dao.ShareDAO;
import com.poly.dao.VideoDAO;
import com.poly.entities.Video;

/**
 * Servlet implementation class createvideo
 */
@MultipartConfig
@WebServlet({ "/createvideo", "/newCreateVideo", "/insertNewVideo", "/updateNewVideo", "/editNewVideo",
		"/deleteNewVideo", "/deleteMainVideo", "/editVideoTurnoff" })
public class CreateVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	long millis = System.currentTimeMillis();
	java.sql.Date day = new java.sql.Date(millis);
	private VideoDAO videoDAO;
	private HistoryDAO historyDAO;
	private ShareDAO shareDAO;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateVideo() {
		super();
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
		try {
			String uri = request.getRequestURI();
			if (uri.contains("newCreateVideo")) {
				request.setAttribute("active1", "active");
			} else if (uri.contains("insertNewVideo")) {
				this.createVideo(request, response);
			} else if (uri.contains("editNewVideo")) {
				this.loadData(request, response);
			} else if (uri.contains("deleteNewVideo")) {
				this.delete(request, response, null);
			} else if (uri.contains("deleteMainVideo")) {
				this.delete(request, response, "deleteMainVideo");
			} else if (uri.contains("updateNewVideo")) {
				this.update(request, response);
				request.setAttribute("active2", "active");
			}
			request.setAttribute("videoEdit", this.videoDAO.loadEditVideo());
			request.setAttribute("videoHome", this.videoDAO.findAll());
			request.setAttribute("end", this.videoDAO.findAll().size());
			request.setAttribute("action", "addvideo");

			request.getRequestDispatcher("/views/index.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println(e);

//			
		}

	}

	protected void loadData(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.valueOf(request.getParameter("idEditVideo"));
		try {
			request.setAttribute("createVideo", this.videoDAO.findId(id));
			request.setAttribute("buttonNewVideo", id);
			request.setAttribute("videoHome", this.videoDAO.findAll());
			if (this.historyDAO.findAllIdVideo(id).size() > 0 || this.shareDAO.findAllIdVideo(id).size() > 0) {
				request.setAttribute("buttonDeleteVideo", null);
			} else {
				request.setAttribute("buttonDeleteVideo", id);
			}
			request.setAttribute("active1", "active");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	protected void createVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Video entity = new Video();
			BeanUtils.populate(entity, request.getParameterMap());
			if (!request.getPart("poster").getSubmittedFileName().equals("")) {
				File dir = new File(request.getServletContext().getRealPath("/views/images"));
				if (!dir.exists()) {
					dir.mkdirs();
				}
				String refreshId = String.valueOf(this.videoDAO.maxId().getId() + 1);
				Part photo = request.getPart("poster");
				File photoFile = new File(dir, CreateVideo.renameFile(photo.getSubmittedFileName(), refreshId));
				photo.write(photoFile.getAbsolutePath());
				entity.setPoster(CreateVideo.renameFile(photo.getSubmittedFileName(), refreshId));
			} else {
				entity.setPoster("main.png");
			}
			entity.setStartDate(day());
			entity.setEndDate(day());
			this.videoDAO.create(entity);
			request.setAttribute("active1", "active");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			e.printStackTrace();
		}
	}

	protected void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.valueOf(request.getParameter("idEditVideo"));
		String active = request.getParameter("activeCreateVideo");
		try {
			Video entity = new Video();
			Video video = this.videoDAO.findId(id);
			BeanUtils.populate(entity, request.getParameterMap());
			entity.setId(video.getId());
			if (!request.getPart("poster").getSubmittedFileName().equals("")) {
				File dir = new File(request.getServletContext().getRealPath("/views/images"));
				if (!dir.exists()) {
					dir.mkdirs();
				}
				Part photo = request.getPart("poster");
				File photoFile = new File(dir,
						CreateVideo.renameFile(photo.getSubmittedFileName(), String.valueOf(video.getId())));
				photo.write(photoFile.getAbsolutePath());
				entity.setPoster(CreateVideo.renameFile(photo.getSubmittedFileName(), String.valueOf(video.getId())));
			} else {
				entity.setPoster(video.getPoster());
			}
			entity.setStartDate(video.getStartDate());
			entity.setEndDate(video.getEndDate());
			if (active == null) {
				entity.setIsactive(false);
			}
			this.videoDAO.update(entity);
			request.setAttribute("videoHome", this.videoDAO.findAll());
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			e.printStackTrace();
		}
	}

	protected void delete(HttpServletRequest request, HttpServletResponse response, String action)
			throws ServletException, IOException {
		int id = Integer.valueOf(request.getParameter("idEditVideo"));
		try {
			Video entity = this.videoDAO.findId(id);
			this.videoDAO.delete(entity);
			if (action != null)
				request.setAttribute("videoHome", this.videoDAO.findAll());
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
	}

	public static String renameFile(String fileName, String id) {
		return FilenameUtils.getBaseName(id) + ".png";
	}

	public java.sql.Date day() {
		return day;
	}

}
