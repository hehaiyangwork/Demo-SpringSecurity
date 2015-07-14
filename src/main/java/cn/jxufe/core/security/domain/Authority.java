package cn.jxufe.core.security.domain;

import java.util.Date;

public class Authority implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4767135184979801106L;

	private Integer id;
	
	private String name;
	
	private String cnname;
	
	private Date insertDate;
	
	private Date updateDate;
	
	private Integer orderIndex;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCnname() {
		return cnname;
	}

	public void setCnname(String cnname) {
		this.cnname = cnname;
	}

	public Date getInsertDate() {
		return insertDate;
	}

	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public Integer getOrderIndex() {
		return orderIndex;
	}

	public void setOrderIndex(Integer orderIndex) {
		this.orderIndex = orderIndex;
	}

}
