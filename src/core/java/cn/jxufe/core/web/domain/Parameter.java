package cn.jxufe.core.web.domain;

public class Parameter implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4767135184979801106L;

	private Integer id;
	
	private String name;
	
	private String description;
	
	private String parValue;

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getParValue() {
		return parValue;
	}

	public void setParValue(String parValue) {
		this.parValue = parValue;
	}

}
