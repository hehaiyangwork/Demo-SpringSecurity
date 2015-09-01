package cn.jxufe.core.web.domain;

import java.util.Date;

/**
 * 
* 类名称：Role   
* 类描述： 
* 创建时间：2015年8月22日 上午11:51:15     
* 修改备注：   
* @version
 */
public class Role implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1094566287214539247L;

	private Integer id;
	
	private String name;
	
	private String cnName;
	
	private Date insertDate;
	
	private Date updateDate;
	
	private Integer isUse;
	
	private Integer parentId;
	
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

	public String getCnName() {
		return cnName;
	}

	public void setCnName(String cnName) {
		this.cnName = cnName;
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

	public Integer getIsUse() {
		return isUse;
	}

	public void setIsUse(Integer isUse) {
		this.isUse = isUse;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Integer getOrderIndex() {
		return orderIndex;
	}

	public void setOrderIndex(Integer orderIndex) {
		this.orderIndex = orderIndex;
	}

}
