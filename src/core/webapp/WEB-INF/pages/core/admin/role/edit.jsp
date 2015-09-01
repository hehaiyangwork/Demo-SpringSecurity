<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<form role="form" id="form_role_edit" action="${base}/admin/role/saveEdit.htm" method="post">
<input type="hidden" name="id" value="${role.id}" />
<div class="modal-body">
  <div class="form-group">
    <label for="InputName">角色标识</label>
    <input type="text" class="form-control" id="InputName" name="name" value="${role.name}" />
  </div>
  <div class="form-group">
    <label for="InputCnName">角色名称</label>
    <input type="text" class="form-control" id="InputCnName" name="cnName" value="${role.cnName}" />
  </div>
  <div class="form-group">
    <label for="InputParentId">上级角色</label>
    <input type="text" class="form-control" id="InputParentId" name="parentId" value="${role.parentId}" />
  </div>
  <div class="form-group">
    <label for="InputOrderIndex">排序</label>
    <input type="text" class="form-control" id="InputOrderIndex" name="orderIndex" value="${role.orderIndex}" />
  </div>
  <div class="form-group">
    <label for="SelectIsUse">使用状态</label>
    <select class="form-control" id="SelectIsUse" name="isUse">
        <option value="1" ${role.isUse eq 1 ?'selected':'' }>在用</option>
        <option value="0" ${role.isUse eq 0 ?'selected':'' }>停用</option>
    </select>
   </div>  
</div>
<div class="modal-footer">
	<button type="submit" class="btn btn-primary">保存</button>
	<a role="button" class="btn btn-default" id="btn_role_edit_close">取消</a>
</div>
</form>
<script type="text/javascript">
$(document).ready(function(){
	$('#form_role_edit').submit(function() {
		$(this).ajaxSubmit({
			beforeSubmit : showRequest, 
			success : showResponse, 
			resetForm : true,
			dataType : 'json'
		});
		return false;
	});
	$("#btn_role_edit_close").click(function(){
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