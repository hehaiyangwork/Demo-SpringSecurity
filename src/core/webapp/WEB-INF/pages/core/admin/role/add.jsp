<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<form role="form" id="form_role_add" action="${base}/admin/role/saveAdd.htm" method="post">
<div class="modal-body">
  <div class="form-group">
    <label for="InputName">角色标识</label>
    <input type="text" class="form-control" id="InputName" name="name" />
  </div>
  <div class="form-group">
    <label for="InputCnName">角色名称</label>
    <input type="text" class="form-control" id="InputCnName" name="cnName" />
  </div>
  <div class="form-group">
    <label for="InputParentId">上级角色</label>
    <input type="text" class="form-control" id="InputParentId" name="parentId" value="${parentId}"/>
  </div>
  <div class="form-group">
    <label for="InputOrderIndex">排序</label>
    <input type="text" class="form-control" id="InputOrderIndex" name="orderIndex" value="1"/>
  </div>
  <div class="form-group">
    <label for="SelectIsUse">使用状态</label>
    <select class="form-control" id="SelectIsUse" name="isUse" >
        <option value="1">在用</option>
        <option value="0">停用</option>
    </select>
   </div>  
</div>
<div class="modal-footer">
	<button type="submit" class="btn btn-primary">确认</button>
	<a role="button" class="btn btn-default" id="btn_role_add_close">取消</a>
</div>
</form>
<script type="text/javascript">
$(document).ready(function(){
	var options = {
		beforeSubmit : showRequest, // pre-submit callback 
		success : showResponse, // post-submit callback
		resetForm : true,
		dataType : 'json'
	};
	// bind to the form's submit event 
	$("#form_role_add").submit(function() {
		$(this).ajaxSubmit(options);
		return false;
	});
	// close dialog
	$("#btn_role_add_close").click(function(){
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
			 message_box.show("新增成功!",'success');
		}else{
			 message_box.show("新增失败!<br/>"+jsonData.msg,'error');
			 gDialog.fClose();
		}
	}
</script>   