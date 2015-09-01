<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<!-- Main content -->
<div class="box box-primary">
	<div class="box-header">
		<button class="btn btn-primary" id="btn_resource_add" title="新增资源"><i class="fa fa-plus"></i> 新增</button>
		<h2 class="box-title">资源列表</h2>
	</div>
	<!-- /.box-header -->
	<div class="box-body">
		<table id="table_resource" class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>NAME</th>
					<th>CNNAME</th>
					<th>PATH</th>
					<th>ORDER</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty page.list}"><th colspan="6">暂无数据!</th></c:if>
				<c:forEach items="${page.list}" var="resource" varStatus="s">
					<tr>
						<td>${resource.id}</td>
						<td>${resource.name}</td>
						<td>${resource.cnName}</td>
						<td>${resource.path}</td>
						<td>${resource.orderIndex}</td>
						<td>
							<span role="button" class="glyphicon glyphicon-pencil" title="编辑资源" onclick="resourceEdit(${resource.id});"></span>&nbsp;&nbsp;
							<span role="button" class="glyphicon glyphicon-trash" title="删除资源" onclick="resourceDelete(${resource.id});"></span>&nbsp;&nbsp;
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="6">
						<div class="pull-left" style="padding: 5px 20px; text-align: left; color: #000;">
						</div>
						<div class="tcdPageCode pull-right" id="resourcePageCode"></div> <!-- END CONTENT ITEM -->
					</th>
				</tr>
			</tfoot>
		</table>
	</div>
	<!-- /.box-body -->
</div>
<!-- /.box -->
<script type="text/javascript">
function resourceEdit(id){
	gDialog.fCreate({title : '编辑资源',url : '${base}/admin/resource/edit.htm?id='+id,width : 500}).show();
}
function resourceDelete(id){
	gDialog.fConfirm('提示信息','确定删除该资源吗?',function(rs){
		if(rs){
			$.ajax({ 
			    url:'${base}/admin/resource/del.htm', 
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
void function() {
	$("#btn_resource_add").click(function() {
		gDialog.fCreate({title : '新增资源',url : '${base}/admin/resource/add.htm',width : 500}).show();
	});
	
	$("#resourcePageCode").createPage({
		pageCount : "${page.totalPage}",//总页数
		pageSize : "${page.pageSize}",//每页大小
		currentPage : "${page.currentPage}",//当前页
		totalRecord : "${page.totalRecord}",//总记录数
		callback : function(page) {
			var tabIndex = tabs.tabs('option', 'active');
			var x = $("#mainTab li[id^='tab-']").toArray();
			var tabId = x[tabIndex].id;
			var panelId = $("#" + tabId).attr("aria-controls");
			$("#" + panelId).load("${base}/admin/resource/list.htm",{"p":page},
				function(response, status, xhr) {
					$("#" + panelId).html(response);
			});
		}
	});

}(jQuery);
</script>