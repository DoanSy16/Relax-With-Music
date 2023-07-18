package com.poly.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "history", uniqueConstraints = { @UniqueConstraint(columnNames = { "username", "videoId" }) })
public class History {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;
	@ManyToOne
	@JoinColumn(name = "username")
	User user;
	@ManyToOne
	@JoinColumn(name = "videoId")
	Video video;
	@Temporal(TemporalType.DATE)
	Date viewsDate = new Date();
	boolean isLike = false;
	@Temporal(TemporalType.DATE)
	Date likedDate = new Date();

	public History() {
		super();
	}

	public History(Long id, User user, Video video, Date viewsDate, boolean isLike, Date likedDate) {
		super();
		this.id = id;
		this.user = user;
		this.video = video;
		this.viewsDate = viewsDate;
		this.isLike = isLike;
		this.likedDate = likedDate;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Video getVideo() {
		return video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}

	public Date getViewsDate() {
		return viewsDate;
	}

	public void setViewsDate(Date viewsDate) {
		this.viewsDate = viewsDate;
	}

	public boolean isLike() {
		return isLike;
	}

	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}

	public Date getLikedDate() {
		return likedDate;
	}

	public void setLikedDate(Date likedDate) {
		this.likedDate = likedDate;
	}

}
