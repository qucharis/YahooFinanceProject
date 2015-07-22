package com.mercury.beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
@Table(name = "OWNS")
public class Ownership {
	
//	private int userId;
//	private int sid;
	private int ownershipId;
	private User user;
	private Stock stock;
	private int quantity; 
	
//	@Id
//	@ManyToOne(fetch = FetchType.EAGER)
//	@JoinColumn(name = "UserID", nullable = false)
//	@Column(name = "UserId", nullable = false)
//	public int getUserId() {
//		return userId;
//	}
//	public void setUserId(int userId) {
//		this.userId = userId;
//	}
//	@Id
//	@ManyToOne(fetch = FetchType.EAGER)
//	@JoinColumn(name = "SID", nullable = false)
//	@Column(name = "SID", nullable = false)
//	public int getSid() {
//		return sid;
//	}
//	public void setSid(int sid) {
//		this.sid = sid;
//	}
	@Id
	@GeneratedValue(generator = "owns_id_gen", 
    strategy = GenerationType.SEQUENCE)
	@SequenceGenerator(name = "owns_id_gen", 
       sequenceName = "seq_owns_ownid", 
       allocationSize = 1)
	@Column(name = "OwnershipID", nullable = false)
	public int getOwnershipId() {
		return ownershipId;
	}
	public void setOwnershipId(int ownershipId) {
		this.ownershipId = ownershipId;
	}
	
	@Column(name = "Quantity", nullable = false)
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userid", nullable = false)
	@Cascade(CascadeType.SAVE_UPDATE)
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "sid", nullable = false)
	@Cascade(CascadeType.SAVE_UPDATE)
	public Stock getStock() {
		return stock;
	}
	public void setStock(Stock stock) {
		this.stock = stock;
	}
	

}
