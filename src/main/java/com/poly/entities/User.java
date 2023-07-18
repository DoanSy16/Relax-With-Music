package com.poly.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@NamedQueries({ @NamedQuery(name = "User.findID", query = "SELECT o FROM User o WHERE o.username=:id OR o.email=:id") })
@Entity
@Table(name = "us")
public class User {
	@Id
	String username;
	String fullname;
	String password;
	String email;
	String image;
	String position="Khách hàng";
	int liked = 0;
	int shares = 0;
	boolean isActive = true;
	@OneToMany(mappedBy = "user")
	List<History> history;
	@OneToMany(mappedBy = "user")
	List<Share> share;

	public User() {
		super();
	}

	public User(String username, String fullname, String password, String email, String image, String position,
			int liked, int share, boolean isActive, List<History> historys, List<Share> shares) {
		super();
		this.username = username;
		this.fullname = fullname;
		this.password = password;
		this.email = email;
		this.image = image;
		this.position = position;
		this.liked = liked;
		this.shares = share;
		this.isActive = isActive;
		this.history = historys;
		this.shares = share;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public int getLiked() {
		return liked;
	}

	public void setLiked(int liked) {
		this.liked = liked;
	}

	public int getShare() {
		return shares;
	}

	public void setShare(int share) {
		this.shares = shares;
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	public List<History> getHistorys() {
		return history;
	}

	public void setHistorys(List<History> historys) {
		this.history = historys;
	}

	public List<Share> getShares() {
		return share;
	}

	public void setShares(List<Share> shares) {
		this.share = share;
	}

}
