<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
        <!-- Main content -->
              <div class="box box-primary">
                <div class="box-header">
                  <h3 class="box-title">PARAMETER LIST</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="table_parameter" class="table table-bordered table-hover">
                    <thead>
                      <tr>
                      	<th>NAME</th>
                        <th>DESCRIPTION</th>
                        <th>PAR_VALUE</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:if test="${empty page.list}"><th colspan="3">暂无数据!</th></c:if>
                    <c:forEach items="${page.list}" var="par" varStatus="s">
                      <tr>
                        <td>${par.name}</td>
                        <td>${par.description}</td>
                        <td>${par.parValue}</td>
                      </tr>
                    </c:forEach>
                    </tbody>
                    <tfoot>
                      <tr>
                        <th colspan="3">
						<!-- START CONTENT ITEM -->
						<div class="pull-left" style="padding: 5px 20px;text-align: left;color: #000;">
    					</div>
   	 					<div class="tcdPageCode pull-right" id="paramPageCode">
    					</div>
						<!-- END CONTENT ITEM -->
						</th>
                      </tr>
                    </tfoot>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
<script type="text/javascript">
$(document).ready(function(){
	  $("#paramPageCode").createPage({
			pageCount : "${page.totalPage}",//总页数
			pageSize : "${page.pageSize}",//每页大小
			currentPage : "${page.currentPage}",//当前页
			totalRecord : "${page.totalRecord}",//总记录数
	      	callback:function(page){
	  			var tabIndex=tabs.tabs('option', 'active');
	  	 		var x=$("#mainTab li[id^='tab-']").toArray();
	  	 		var tabId=x[tabIndex].id;
	  	 		var panelId=$("#"+tabId).attr( "aria-controls" );
	  	 		$("#"+panelId).load( "${base}/admin/parameter/list.htm",{"p":page}, 
	  	 			function( response, status, xhr ) {
	  	 				$("#"+panelId ).html(response);
	  	 		});
	      }
	  });
});
</script>