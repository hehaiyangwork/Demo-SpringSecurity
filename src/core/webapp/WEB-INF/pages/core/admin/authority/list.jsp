<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<style type="text/css">
.ztree li span.button.switch.level0 {visibility:hidden; width:1px;}
.ztree li ul.level0 {padding:0; background:none;}
</style>
<!-- Main content -->
<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">权限列表</h3>
	</div>
	<!-- /.box-header -->
	<div class="box-body row">
		<div class="pull-left col-md-3" style="border:1px solid #ccc;">
			<ul id="authorityTree" class="ztree" style="height: 450px;overflow: auto;"></ul>
    	</div>
		<div class="pull-right col-md-9" >
			<table id="table_authority" class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>NAME</th>
						<th>CNNAME</th>
						<th>PARENTID</th>
						<th>INSERTDATE</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty page.list}"><th colspan="6">暂无数据!</th></c:if>
					<c:forEach items="${page.list}" var="authority" varStatus="s">
						<c:choose>
							<c:when test="${authority.id eq 1}"><tr class="danger"></c:when>
							<c:otherwise><tr></c:otherwise>
						</c:choose>
							<td>${authority.id}</td>
							<td>${authority.name}</td>
							<td>${authority.cnName}</td>
							<td>${authority.parentId}</td>
							<td>${authority.orderIndex}</td>
							<td>
								<span role="button" class="glyphicon glyphicon-pencil" title="编辑权限" onclick="authorityEdit(${authority.id});"></span>&nbsp;&nbsp;
								<span role="button" class="glyphicon glyphicon-trash" title="删除权限" onclick="authorityDelete(${authority.id});"></span>&nbsp;&nbsp;
								<span role="button" class="glyphicon glyphicon-plus" title="添加子权限" onclick="authorityAdd(${authority.id});"></span>&nbsp;&nbsp;
								<span role="button" class="glyphicon glyphicon-list-alt" title="资源分配" onclick="authorityResource(${authority.id});"></span>&nbsp;&nbsp;
								<span role="button" class="glyphicon glyphicon-cog" title="控制面板" onclick="authorityManage(${authority.id});"></span>&nbsp;&nbsp;
							</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<th colspan="6">
							<div class="pull-left"></div>
							<div class="tcdPageCode pull-right" id="authorityPageCode"></div>
						</th>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
	<!-- /.box-body -->
	<div class="box-footer">box-footer</div>
</div>
<!-- /.box -->

<script type="text/javascript">
var authorityTree;
//权限树的一些设置
	var aSetting = {
		async : {
			enable : true,
			url : "${base}/admin/authority/getAuthroityJosn.htm",
			autoParam : [ "id" ]
		},
		data : {
			simpleData : {
				enable : true
			}
		},
		view: {
			dblClickExpand: dblClickExpand,
			selectedMulti: false
		},
	};
	function dblClickExpand(treeId, treeNode) {
		return treeNode.level > 0;
	}

	$(document).ready(function() {
		$.fn.zTree.init($("#authorityTree"), aSetting);
		authorityTree = $.fn.zTree.getZTreeObj("authorityTree");
	});	
</script> 
<script type="text/javascript">
function authorityEdit(id){
	gDialog.fCreate({title : '编辑权限',url : '${base}/admin/authority/edit.htm?id='+id,width : 500}).show();
}
function authorityDelete(id){
	gDialog.fConfirm('提示信息','确定删除该权限吗?',function(rs){
		if(rs){
			$.ajax({ 
			    url:'${base}/admin/authority/del.htm', 
			    type:'post',
			    dataType:'json',
			    data:{"id":id},
			    error:function(data){
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
function authorityAdd(id){
	gDialog.fCreate({title : '添加子权限',url : '${base}/admin/authority/add.htm?id='+id,width : 500}).show();
}
function authorityResource(id){
	gDialog.fCreate({title : '资源分配',url : '${base}/admin/authority/resource.htm?id='+id,width : 500}).show();
}
function authorityManage(id){
	alert("控制面板");
}
void function() {
	
	$("#authorityPageCode").createPage({
		pageCount : "${page.totalPage}",//总页数
		pageSize : "${page.pageSize}",//每页大小
		currentPage : "${page.currentPage}",//当前页
		totalRecord : "${page.totalRecord}",//总记录数
		callback : function(page) {
			var tabIndex = tabs.tabs('option', 'active');
			var x = $("#mainTab li[id^='tab-']").toArray();
			var tabId = x[tabIndex].id;
			var panelId = $("#" + tabId).attr("aria-controls");
			$("#" + panelId).load("${base}/admin/authority/list.htm",{"p":page},
				function(response, status, xhr) {
				$("#" + panelId).html(response);
			});
		}
	});

}(jQuery);
</script>