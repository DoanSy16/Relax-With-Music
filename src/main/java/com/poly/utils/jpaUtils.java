package com.poly.utils;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class jpaUtils {
	private static EntityManagerFactory emf;

	static public EntityManager getManager() {
		try {
			if (emf == null || !emf.isOpen()) {
				emf = Persistence.createEntityManagerFactory("Assignment_Java4");
			}
			return emf.createEntityManager();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			throw e;
		}

	}

	static public void shutdown() {
		if (emf != null && emf.isOpen()) {
			emf.close();
		}
		emf = null;
	}
}
