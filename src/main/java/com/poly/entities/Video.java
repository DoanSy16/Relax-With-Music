package com.poly.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.NamedStoredProcedureQueries;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.OneToMany;
import javax.persistence.StoredProcedureParameter;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@NamedQueries({
	@NamedQuery(name = "Video.loadVideo", query = "SELECT o FROM Video o WHERE o.id <>:id") })
@NamedStoredProcedureQueries({
		@NamedStoredProcedureQuery(name = "Video.Trend", procedureName = "trend", resultClasses = { Video.class }) })
@Entity
@Table(name = "video")
public class Video {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	String title;
	String href;
	String poster;
	int views = 0;
	String description=null;
	int liked = 0;
	int shares = 0;
	@Temporal(TemporalType.DATE)
	Date startDate = new Date();
	@Temporal(TemporalType.DATE)
	Date endDate = new Date();
	boolean isactive = true;
	@OneToMany(mappedBy = "video")
	List<History> history;
	@OneToMany(mappedBy = "video")
	List<Share> share;

	public Video() {
		super();
	}

	public Video(int id, String title, String href, String poster, int views, String description, int liked,
			int shares, Date startDate, Date endDate, boolean isactive, List<History> history, List<Share> share) {
		super();
		this.id = id;
		this.title = title;
		this.href = href;
		this.poster = poster;
		this.views = views;
		this.description = description;
		this.liked = liked;
		this.shares = shares;
		this.startDate = startDate;
		this.endDate = endDate;
		this.isactive = isactive;
		this.history = history;
		this.share = share;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getLiked() {
		return liked;
	}

	public void setLiked(int liked) {
		this.liked = liked;
	}

	public int getShares() {
		return shares;
	}

	public void setShares(int shares) {
		this.shares = shares;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public boolean isIsactive() {
		return isactive;
	}

	public void setIsactive(boolean isactive) {
		this.isactive = isactive;
	}

	public List<History> getHistory() {
		return history;
	}

	public void setHistory(List<History> history) {
		this.history = history;
	}

	public List<Share> getShare() {
		return share;
	}

	public void setShare(List<Share> share) {
		this.share = share;
	}

}