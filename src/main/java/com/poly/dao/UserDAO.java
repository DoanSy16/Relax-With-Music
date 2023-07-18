package com.poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.poly.entities.User;
import com.poly.utils.jpaUtils;

public class UserDAO {
	private EntityManager em;

	public UserDAO() {
		this.em = jpaUtils.getManager();
	}

	public List<User> findAll() throws Exception {
		try {
			String jpql = "SELECT o FROM User o";
			TypedQuery<User> query = this.em.createQuery(jpql, User.class);
			return query.getResultList();
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
	}

	public User finId(String id) throws Exception {
		return this.em.find(User.class, id);
	}

	public User finduser(String email,String user) throws Exception {
		try {
			String jpql = "SELECT o FROM User o WHERE o.email=:email OR o.username=:user";
			TypedQuery<User> query = this.em.createQuery(jpql, User.class);
			query.setParameter("email", email);
			query.setParameter("user", user);
			return query.getSingleResult();
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
	}


	public User create(User entity) throws Exception {
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

	public User update(User entity) throws Exception {
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
	public User delete(User entity) throws Exception{
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
