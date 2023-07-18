package com.poly.dao;

import java.awt.Window.Type;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.StoredProcedureParameter;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.TypedQuery;

import com.poly.entities.Video;
import com.poly.utils.jpaUtils;

public class VideoDAO {
	private EntityManager em;

	public VideoDAO() {
		this.em = jpaUtils.getManager();
	}

	public List<Video> findAll() throws Exception {
		try {
			
			String jpql = "SELECT o FROM Video o where o.isactive=1";
			TypedQuery<Video> qurey = this.em.createQuery(jpql, Video.class);
			return qurey.getResultList();
			
//			TypedQuery<Video> query = this.em.createNamedQuery("Video.findAll", Video.class);
//			return query.getResultList();
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
	}

	public List<Video> loadVideo(int id) throws Exception {
		try {
			TypedQuery<Video> query = this.em.createNamedQuery("Video.loadVideo", Video.class);
			query.setParameter("id", id);
			return query.getResultList();
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
	}

	public List<Video> loadVideoTrend() throws Exception {
		try {
			StoredProcedureQuery query = this.em.createNamedStoredProcedureQuery("Video.Trend");
			return query.getResultList();
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
	}

	public Video findId(int id) {
		return this.em.find(Video.class, id);
	}

	public List<Video> findTitleVideo(String title) throws Exception {
		try {
			String jpql = "SELECT o FROM Video o WHERE o.title LIKE %:title% AND o.isactive = 1";
			TypedQuery<Video> qurey = this.em.createQuery(jpql, Video.class);
			qurey.setParameter("title", title);
			return qurey.getResultList();
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
	}

	public List<Video> loadEditVideo() throws Exception {
		try {
			String jpql = "SELECT o FROM Video o";
			TypedQuery<Video> qurey = this.em.createQuery(jpql, Video.class);
			return qurey.getResultList();
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
	}

	public Video maxId() throws Exception {
		try {
			String jpql = "SELECT o FROM Video o WHERE o.id=(SELECT MAX(o.id) FROM Video o)";
			TypedQuery<Video> query = this.em.createQuery(jpql, Video.class);
			return query.getSingleResult();
		} catch (Exception e) {
			throw e;
			// TODO: handle exception
		}
	}

	public Video create(Video entity) throws Exception {
		try {
			this.em.getTransaction().begin();
			this.em.persist(entity);
			this.em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			// TODO: handle exception
			this.em.getTransaction().rollback();
			throw e;
		}
	}

	public Video update(Video entity) throws Exception {
		try {
			this.em.getTransaction().begin();
			this.em.merge(entity);
			this.em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			// TODO: handle exception
			this.em.getTransaction().rollback();
			throw e;
		}
	}

	public Video delete(Video entity) throws Exception {
		try {
			this.em.getTransaction().begin();
			this.em.remove(entity);
			this.em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			// TODO: handle exception
			this.em.getTransaction().rollback();
			throw e;
		}
	}
}
