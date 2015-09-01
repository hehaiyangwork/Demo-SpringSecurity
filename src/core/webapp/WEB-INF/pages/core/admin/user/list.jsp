<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
        <!-- Main content -->
              <div class="box box-primary">
                <div class="box-header">
                  <button class="btn btn-primary" id="btn_user_add"><i class="fa fa-user-plus"></i> 新增</button>
                  <button class="btn" id="btn_user_print"><i class="fa fa-print"></i> 打印</button>
                  <button class="btn" id="btn_user_download"><i class="fa fa-download"></i> 导出</button>
                  <h3 class="box-title">USER LIST</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="table_user" class="table table-bordered table-hover">
                    <thead>
                      <tr>
                      	<th>ORDER</th>
                        <th>USERNAME</th>
                        <th>CNNAME</th>
                        <th>EMAIL</th>
                        <th>LASTLOGINDATE</th>
                        <th>操作</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:if test="${empty page.list}"><th colspan="6">暂无数据!</th></c:if>
                    <c:forEach items="${page.list}" var="user" varStatus="s">
						<c:choose>
							<c:when test="${user.id eq 1}"><tr class="danger"></c:when>
							<c:otherwise><tr></c:otherwise>
						</c:choose>
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.cnName}</td>
                        <td>${user.email}</td>
                        <td><fmt:formatDate value="${user.lastLoginDate}" type="both"/></td>
                        <td>
                        	<span role="button" class="glyphicon glyphicon-pencil" title="编辑角色" onclick="userEdit(${user.id});"></span>&nbsp;&nbsp;
                        	<span role="button" class="glyphicon glyphicon-trash" title="编辑角色" onclick="userDelete(${user.id});"></span>&nbsp;&nbsp;
                         	<span role="button" class="glyphicon glyphicon-user" title="编辑角色" onclick="userRole(${user.id});"></span>&nbsp;&nbsp;
                        </td>
                      </tr>
                    </c:forEach>
                    </tbody>
                    <tfoot>
                      <tr>
                        <th colspan="6">
						<!-- START CONTENT ITEM -->
						<div class="pull-left" style="padding: 5px 20px;text-align: left;color: #000;">
    					</div>
   	 					<div class="tcdPageCode pull-right" id="userPageCode">
    					</div>
						<!-- END CONTENT ITEM -->
						</th>
                      </tr>
                    </tfoot>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
<script type="text/javascript">
function userEdit(id){
	gDialog.fCreate({title : '编辑用户',url : '${base}/admin/user/edit.htm?id='+id,width : 500}).show();
}
function userDelete(id){
	gDialog.fConfirm('提示信息','确定删除该用户吗?',function(rs){
		if(rs){
			$.ajax({ 
			    url:        '${base}/admin/user/del.htm', 
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
function userRole(id){
	gDialog.fCreate({title:'角色分配',url:'${base}/admin/user/role.htm?id='+id,width:500}).show();	
}

void function(){
	
	$("#btn_user_add").click(function(){
		gDialog.fCreate({title:'新增用户',url:'${base}/admin/user/add.htm',width:500}).show();	
	});
	
	$("#btn_user_print").click(function(){
		gDialog.fCreate({title:'打印设置',url:'${base}/admin/user/add.htm',width:500}).show();	
	});
	
	$("#btn_user_download").click(function(){
		gDialog.fCreate({title:'数据导出',url:'${base}/admin/user/add.htm',width:500}).show();	
	});
	
	  $("#userPageCode").createPage({
			pageCount : "${page.totalPage}",//总页数
			pageSize : "${page.pageSize}",//每页大小
			currentPage : "${page.currentPage}",//当前页
			totalRecord : "${page.totalRecord}",//总记录数
	      	callback:function(page){
	  			var tabIndex=tabs.tabs('option', 'active');
	  	 		var x=$("#mainTab li[id^='tab-']").toArray();
	  	 		var tabId=x[tabIndex].id;
	  	 		var panelId=$("#"+tabId).attr( "aria-controls" );
	  	 		$( "#"+panelId ).load( "${base}/admin/user/list.htm",{"p":page},
	  	 			function( response, status, xhr ) {
	  	 				$("#"+panelId ).html(response);
	  	 		});
	      }
	  });
	  
}(jQuery);
</script>