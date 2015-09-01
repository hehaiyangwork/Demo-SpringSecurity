<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<style type="text/css">
.ztree li span.button.switch.level0 {visibility:hidden; width:1px;}
.ztree li ul.level0 {padding:0; background:none;}
</style>
<!-- Main content -->
<div class="box box-primary">
	<div class="box-header">
		<h2 class="box-title">角色列表</h2>
	</div>
	<!-- /.box-header -->
	<div class="box-body">
	   	<div class="pull-left col-md-3" style="border:1px solid #ccc;">
			<ul id="roleTree" class="ztree" style="height: 450px;overflow: auto;"></ul>
    	</div>
		<div class="pull-right col-md-9">
		<table id="table_role" class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>NAME</th>
					<th>CNNAME</th>
					<th>PARENT</th>
					<th>INSERTDATE</th>
					<th>ISUSE</th>
					<th>ORDER</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty page.list}"><th colspan="7">暂无数据!</th></c:if>
				<c:forEach items="${page.list}" var="role" varStatus="s">
					<c:choose>
						<c:when test="${role.id eq 1}"><tr class="danger"></c:when>
						<c:otherwise><tr></c:otherwise>
					</c:choose>
						<td>${role.id}</td>
						<td>${role.name}</td>
						<td>${role.cnName}</td>
						<td>${role.parentId}</td>
						<td><fmt:formatDate value="${role.insertDate}" type="both"/></td>
						<td>${role.isUse}</td>
						<td>${role.orderIndex}</td>
						<td>
							<span role="button" class="glyphicon glyphicon-pencil" title="编辑角色" onclick="roleSetting(${role.id});"></span>&nbsp;&nbsp;
							<span role="button" class="glyphicon glyphicon-trash" title="删除角色" onclick="roleDelete(${role.id});"></span>&nbsp;&nbsp;
							<span role="button" class="glyphicon glyphicon-plus" title="添加子角色" onclick="roleAdd(${role.id});"></span>&nbsp;&nbsp;
							<span role="button" class="glyphicon glyphicon-lock" title="权限分配" onclick="roleAuthority(${role.id});"></span>&nbsp;&nbsp;
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="8">
						<!-- START CONTENT ITEM -->
						<div class="pull-left" style="padding: 5px 20px; text-align: left; color: #000;">
						</div>
						<div class="tcdPageCode pull-right" id="rolePageCode"></div> <!-- END CONTENT ITEM -->
					</th>
				</tr>
			</tfoot>
		</table>
		</div>
	</div>
	<!-- /.box-body -->
</div>
<!-- /.box -->
<script type="text/javascript">
//权限树的一些设置
	var rSetting = {
		async : {
			enable : true,
			url : "${base}/admin/role/getRoleJosn.htm",
			autoParam : [ "id" ]
		},
		view: {
			dblClickExpand: dblClickExpand,
			selectedMulti: false
		},
		data : {
			simpleData : {
				enable : true
			}
		}
	};
	
	function dblClickExpand(treeId, treeNode) {
		return treeNode.level > 0;
	}
	$(document).ready(function() {
		$.fn.zTree.init($("#roleTree"), rSetting);
	});	
</script> 
<script type="text/javascript">
function roleSetting(id){
	gDialog.fCreate({title : '编辑角色',url : '${base}/admin/role/edit.htm?id='+id,width : 500}).show();
}
function roleAuthority(id){
	gDialog.fCreate({title : '权限设置&nbsp;&nbsp;<span role="button" class="glyphicon glyphicon-refresh" title="权限刷新" onclick="refreshAuthority(${role.id});"></span>',url : '${base}/admin/role/authority.htm?id='+id,width : 500}).show();
}
function roleAdd(id){
	gDialog.fCreate({title : '添加子角色',url : '${base}/admin/role/add.htm?id='+id,width : 500}).show();
}
function roleDelete(id){
	gDialog.fConfirm('提示信息','确定删除该角色吗?',function(rs){
		if(rs){
			$.ajax({ 
			    url:        '${base}/admin/role/del.htm', 
			    type:       'post',
			    dataType:   'json',
			    data:       {"id":id},
			    error:      function(data){
					if(data.status==300){
						 message_box.show("删除失败!<br/>"+data.msg,'error');
						 gDialog.fClose();
						 refreshThisTab();
					}
			    },
			    success:    function(data){
					if(data.status==200){
						 message_box.show('删除成功!','success');
						 gDialog.fClose();
						 refreshThisTab();
					}
			    }
			});
		}else{
		  	message_box.show('你取消了本次操作！','error');
		}
	});
}
void function() {
	
	$("#rolePageCode").createPage({
		pageCount : "${page.totalPage}",//总页数
		pageSize : "${page.pageSize}",//每页大小
		currentPage : "${page.currentPage}",//当前页
		totalRecord : "${page.totalRecord}",//总记录数
		callback : function(page) {
			var tabIndex = tabs.tabs('option', 'active');
			var x = $("#mainTab li[id^='tab-']").toArray();
			var tabId = x[tabIndex].id;
			var panelId = $("#" + tabId).attr("aria-controls");
			$("#" + panelId).load("${base}/admin/role/list.htm",{"p":page},
				function(response, status, xhr) {
					$("#" + panelId).html(response);
			});
		}
	});

}(jQuery);
</script>