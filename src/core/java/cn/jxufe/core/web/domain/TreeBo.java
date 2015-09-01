package cn.jxufe.core.web.domain;

public class TreeBo {
	
	private String id;
	private String pId;
	private String name;
	private String url;
	private String target;
	private String rel;
	private boolean open;
	private boolean isParent;
	private String click;
	private boolean checked;
	private boolean halfCheck;
	private String selfId;
	private boolean nocheck;
	private String resourceId;
	private String iconOpen;
	private String iconClose;
	private String icon;
	private boolean noR;
	
	private boolean drag;//是否允许拖拽
	private boolean childOuter;//是否允许子节点移走
	private boolean dropInner;//是否允许成为父节点
	private boolean dropRoot;//是否允许成为根节点
	private boolean childOrder;//是否允许子节点排序/增加
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getRel() {
		return rel;
	}
	public void setRel(String rel) {
		this.rel = rel;
	}
	public boolean isOpen() {
		return open;
	}
	public void setOpen(boolean open) {
		this.open = open;
	}
	public void setIsParent(boolean isParent) {
		this.isParent = isParent;
	}
	public boolean getIsParent() {
		return isParent;
	}
	public String getClick() {
		return click;
	}
	public void setClick(String click) {
		this.click = click;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public boolean isHalfCheck() {
		return halfCheck;
	}
	public void setHalfCheck(boolean halfCheck) {
		this.halfCheck = halfCheck;
	}
	public String getSelfId() {
		return selfId;
	}
	public void setSelfId(String selfId) {
		this.selfId = selfId;
	}
	public boolean isNocheck() {
		return nocheck;
	}
	public void setNocheck(boolean nocheck) {
		this.nocheck = nocheck;
	}
	public String getResourceId() {
		return resourceId;
	}
	public void setResourceId(String resourceId) {
		this.resourceId = resourceId;
	}
	public String getIconOpen() {
		return iconOpen;
	}
	public void setIconOpen(String iconOpen) {
		this.iconOpen = iconOpen;
	}
	public String getIconClose() {
		return iconClose;
	}
	public void setIconClose(String iconClose) {
		this.iconClose = iconClose;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public boolean isNoR() {
		return noR;
	}
	public void setNoR(boolean noR) {
		this.noR = noR;
	}
	public boolean isDrag() {
		return drag;
	}
	public void setDrag(boolean drag) {
		this.drag = drag;
	}
	public boolean isChildOuter() {
		return childOuter;
	}
	public void setChildOuter(boolean childOuter) {
		this.childOuter = childOuter;
	}
	public boolean isDropInner() {
		return dropInner;
	}
	public void setDropInner(boolean dropInner) {
		this.dropInner = dropInner;
	}
	public boolean isDropRoot() {
		return dropRoot;
	}
	public void setDropRoot(boolean dropRoot) {
		this.dropRoot = dropRoot;
	}
	public boolean isChildOrder() {
		return childOrder;
	}
	public void setChildOrder(boolean childOrder) {
		this.childOrder = childOrder;
	}
	public void setParent(boolean isParent) {
		this.isParent = isParent;
	}
	
	
}
