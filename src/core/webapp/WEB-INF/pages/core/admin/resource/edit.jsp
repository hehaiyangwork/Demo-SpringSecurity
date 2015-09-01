<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<form role="form" id="form_resource_edit" action="${base}/admin/resource/saveEdit.htm" method="post">
<input type="hidden" name="id" value="${resource.id}" />
<div class="modal-body">
  <div class="form-group">
    <label for="InputName">资源标识</label>
    <input type="text" class="form-control" id="InputName" name="name" value="${resource.name}" />
  </div>
  <div class="form-group">
    <label for="InputCnName">资源名称</label>
    <input type="text" class="form-control" id="InputCnName" name="cnName" value="${resource.cnName}" />
  </div>
  <div class="form-group">
    <label for="InputParentId">资源路径</label>
    <input type="text" class="form-control" id="InputPath" name="path" value="${resource.path}" />
  </div>
  <div class="form-group">
    <label for="InputOrderIndex">排序</label>
    <input type="text" class="form-control" id="InputOrderIndex" name="orderIndex" value="${resource.orderIndex}" />
  </div>
</div>
<div class="modal-footer">
	<button type="submit" class="btn btn-primary">保存</button>
	<a role="button" class="btn btn-default" id="btn_resource_edit_close">取消</a>
</div>
</form>
<script type="text/javascript">
$(document).ready(function(){
	$('#form_resource_edit').submit(function() {
		$(this).ajaxSubmit({
			beforeSubmit : showRequest, 
			success : showResponse, 
			resetForm : true,
			dataType : 'json'
		});
		return false;
	});
	$("#btn_resource_edit_close").click(function(){
		gDialog.fClose();
	});
});
	// pre-submit callback 
	function showRequest(formData, jqForm, options) {
		return true;
	}
	// post-submit callback 
	function showResponse(jsonData, statusData) {
		if(statusData=="success"&&jsonData.status==200){
			 gDialog.fClose();
			 refreshThisTab();
			 message_box.show("编辑成功!",'success');
		}else{
			 message_box.show("编辑失败!<br/>"+jsonData.msg,'error');
			 gDialog.fClose();
		}
	}
</script>   