<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<form role="form" id="form_authority_edit" action="${base}/admin/authority/saveEdit.htm" method="post">
<input type="hidden" name="id" value="${authority.id}" />
<div class="modal-body">
  <div class="form-group">
    <label for="InputName">权限标识</label>
    <input type="text" class="form-control" id="InputName" name="name" value="${authority.name}" />
  </div>
  <div class="form-group">
    <label for="InputCnName">权限名称</label>
    <input type="text" class="form-control" id="InputCnName" name="cnName" value="${authority.cnName}" />
  </div>
  <div class="form-group">
    <label for="InputParentId">上级权限</label>
    <input type="text" class="form-control" id="InputParentId" name="parentId" value="${authority.parentId}" />
  </div>
  <div class="form-group">
    <label for="InputOrderIndex">排序</label>
    <input type="text" class="form-control" id="InputOrderIndex" name="orderIndex" value="${authority.orderIndex}" />
  </div> 
</div>
<div class="modal-footer">
	<button type="submit" class="btn btn-primary">保存</button>
	<a role="button" class="btn btn-default" id="btn_authority_edit_close">取消</a>
</div>
</form>
<script type="text/javascript">
$(document).ready(function(){
	$('#form_authority_edit').submit(function() {
		$(this).ajaxSubmit({
			beforeSubmit : showRequest, 
			success : showResponse, 
			resetForm : true,
			dataType : 'json'
		});
		return false;
	});
	$("#btn_authority_edit_close").click(function(){
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