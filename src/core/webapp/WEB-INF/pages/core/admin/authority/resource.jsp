<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<form role="form" id="form_authority_resource" action="${base}/admin/authority/saveResource.htm" method="post">
<input type="hidden" name="id" value="${authorityId}" />
	<div class="modal-body" >
		<div style="height:300px; overflow: auto;border:1px solid #ccc;">
		<table class="table table-condensed table-bordered table-hover">
			<thead>
				<tr>
					<th width=18px;"></th>
					<th width="100px;">CNNAME</th>
					<th width="200px;">PATH</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty resourceList}">
					<th colspan="6">暂无数据!</th>
				</c:if>
				<c:forEach items="${resourceList}" var="resource" varStatus="s">
					<tr>
						<td><input type="checkbox" value="${resource.id}" name="resourceArray" /></td>
						<td>${resource.cnName}</td>
						<td>${resource.path}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="modal-footer">
		<button type="submit" class="btn btn-primary">确认</button>
		<a role="button" class="btn btn-default" id="btn_authority_resource_close">取消</a>
	</div>
</form>
<script type="text/javascript">
$(document).ready(function(){

	checkedBox();
	
	$("#form_authority_resource").submit(function() {
		$(this).ajaxSubmit({
			beforeSubmit : showRequest,
			success : showResponse,
			resetForm : true,
			dataType : 'json'
		});
		return false;
	});
	$("#btn_authority_resource_close").click(function(){
		gDialog.fClose();
	});
});
	function checkedBox(){
		var str='${arr}'; 
		var arr=str.split(',');
	    for(var i =0; i < arr.length; i++){
	      	$("input[name='resourceArray']").each(function(){
	      		if(arr[i]==$(this).val()){
	      			$(this).attr("checked", true);
	      		}
	      	});  
	    }
	}


	function showRequest(formData, jqForm, options) {
		return true;
	}
	
	function showResponse(jsonData, statusData) {
		if(statusData=="success"&&jsonData.status==200){
			 gDialog.fClose();
			 refreshThisTab();
			 message_box.show("保存成功!",'success');
		}else{
			 message_box.show("保存失败!<br/>"+jsonData.msg,'error');
			 gDialog.fClose();
		}
	}
</script> 