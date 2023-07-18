package com.poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.poly.entities.History;
import com.poly.entities.Share;
import com.poly.utils.jpaUtils;

public class ShareDAO {
	private EntityManager em;

	public ShareDAO() {
		this.em = jpaUtils.getManager();
	}

	public List<Share> findAll() throws Exception {
		try {
			String jpql = "SELECT o FROM Share o";
			TypedQuery<Share> query = this.em.createQuery(jpql, Share.class);
			return query.getResultList();
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
	}

	public List<Share> findIdUser(String id) throws Exception {
		try {
			String jpql = "SELECT o FROM Share o WHERE o.user.username LIKE :username";
			TypedQuery<Share> query = this.em.createQuery(jpql, Share.class);
			query.setParameter("username", id);
			return query.getResultList();
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
	}
	public List<Share>findAllIdVideo(int id )throws Exception{
		try {
			String jpql="SELECT o FROM Share o WHERE o.video.id =:id";
			TypedQuery<Share>query = this.em.createQuery(jpql,Share.class);
			query.setParameter("id", id);
			return query.getResultList();
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
	}
	public Share create(Share entity) throws Exception{
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
}
