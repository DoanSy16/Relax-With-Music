package com.poly.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.poly.entities.History;
import com.poly.entities.Video;
import com.poly.utils.jpaUtils;

public class HistoryDAO {
	private EntityManager em;

	public HistoryDAO() {
		this.em = jpaUtils.getManager();
	}

	public List<History> loadAllFavorite() {
		try {
			String jpql = "SELECT o FROM History o";
			TypedQuery<History> query = this.em.createQuery(jpql, History.class);
			return query.getResultList();
		} catch (Exception e) {
			throw e;
		}
	}

	public List<History> findAll(String userId) throws Exception {
		try {
			String jpql = "SELECT DISTINCT o FROM History o WHERE o.user.username LIKE :username ORDER BY o.viewsDate DESC";
			TypedQuery<History> query = this.em.createQuery(jpql, History.class);
			query.setParameter("username", userId);
			return query.getResultList();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			throw e;
		}
	}

	public List<History> loadVideoFavorite(String userId) throws Exception {
		try {
			String jpql = "SELECT DISTINCT o FROM History o WHERE o.user.username LIKE :username AND o.isLike LIKE 1 ORDER BY o.likedDate DESC";
			TypedQuery<History> query = this.em.createQuery(jpql, History.class);
			query.setParameter("username", userId);
			return query.getResultList();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			throw e;
		}
	}

	public List<History> findId(int id, String user) throws Exception {
		try {
			String jpql = "SELECT o FROM History o WHERE o.video.id =:id AND o.user.username LIKE :username AND o.isLike LIKE 1";
			TypedQuery<History> query = this.em.createQuery(jpql, History.class);
			query.setParameter("id", id);
			query.setParameter("username", user);
			return query.getResultList();
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
	}

	public List<History> loadUserfavorite(String title) throws Exception {
		String jpql;
		try {
			if (title == null) {
				jpql = "SELECT o FROM History o";
			} else {
				jpql = "SELECT o FROM History o WHERE o.video.title LIKE :title";
			}
			TypedQuery<History> query = this.em.createQuery(jpql, History.class);
			if (title == null) {
				query.setParameter("title", title);
			}
			return query.getResultList();
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
	}

	public List<History> loadAllHistory() throws Exception {
		try {
			String jpql = "SELECT o FROM History o";
			TypedQuery<History> query = this.em.createQuery(jpql, History.class);
			return query.getResultList();
		} catch (Exception e) {
			throw e;
			// TODO: handle exception
		}
	}

	public List<History> findAllIdVideo(int id) throws Exception {
		try {
			String jpql = "SELECT o FROM History o WHERE o.video.id =:id";
			TypedQuery<History> query = this.em.createQuery(jpql, History.class);
			query.setParameter("id", id);
			return query.getResultList();
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
	}

	public History findVideoDate(int id, String user, Date date) throws Exception {
		try {
			String jpql = "SELECT o FROM History o WHERE o.video.id =:id AND o.user.username =:user AND o.viewsDate =:date";
			TypedQuery<History> query = this.em.createQuery(jpql, History.class);
			query.setParameter("id", id);
			query.setParameter("user", user);
			query.setParameter("date", date);
			return query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	public History findIdVideoAndUser(int id, String user, String check) throws Exception {
		try {
			String sql = "";
			if (check == null) {
				sql = "AND o.viewsDate=(SELECT MAX(o.viewsDate) FROM History o)";
			} else if (check.equals("isLike")) {
				sql = "AND o.isLike=1";
			}
			String jpql = "SELECT o FROM History o WHERE o.video.id =:id AND o.user.username =:user " + sql;
			TypedQuery<History> query = this.em.createQuery(jpql, History.class);
			query.setParameter("id", id);
			query.setParameter("user", user);
			return query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	public List<History> loadFavoriteVideo(int id) throws Exception {
		try {
			String jpql = "SELECT o FROM History o WHERE o.video.id =:id AND o.isLike=1";
			TypedQuery<History> query = this.em.createQuery(jpql, History.class);
			query.setParameter("id", id);
			return query.getResultList();
		} catch (Exception e) {
			throw e;
		}
	}

	public History topViews(String user, int video) throws Exception {
		try {
			String jpql = "SELECT o FROM History o WHERE o.user.username=:user AND o.video.id=:video";
			TypedQuery<History> query = this.em.createQuery(jpql, History.class);
			query.setParameter("user", user);
			query.setParameter("video", video);
			return query.getSingleResult();
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
	}

	public History create(History entity) throws Exception {
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

	public History delete(History entity) throws Exception {
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

	public History update(History entity) throws Exception {
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

}
