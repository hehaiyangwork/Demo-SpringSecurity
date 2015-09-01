<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<form role="form" id="form_del_user" action="${base}/admin/user/saveEdit.htm" method="post">
 <input type="hidden" name="id" value="${user.id}" />
<div class="modal-body">
  <div class="form-group">
    <label for="InputUsername">用户名称</label>
    <input type="text" class="form-control" id="InputUsername" name="username" value="${user.username}" />
  </div>
  <div class="form-group">
    <label for="InputCnName">中文名称</label>
    <input type="text" class="form-control" id="InputCnName" name="cnName" value="${user.cnName}" />
  </div>
  <div class="form-group">
    <label for="InputPassword">密码</label>
    <input type="text" class="form-control" id="InputPassword" name="password" value="${user.password}" />
  </div>
  <div class="form-group">
    <label for="InputEmail">邮箱</label>
    <input type="text" class="form-control" id="InputEmail" name="email" value="${user.email}" />
  </div>
  <div class="form-group">
    <label for="InputMobile">电话</label>
    <input type="text" class="form-control" id="InputMobile" name="mobile" value="${user.mobile}" />
  </div>
</div>
<div class="modal-footer">
	<button type="submit" class="btn btn-primary">保存</button>
	<a role="button" class="btn btn-default" id="btn_user_del_close">取消</a>
</div>
</form>
<script type="text/javascript">
$(document).ready(function(){
	var options = {
		beforeSubmit : showRequest,
		success : showResponse,
		resetForm : true,
		dataType : 'json'
	};
	$('#form_del_user').submit(function() {
		$(this).ajaxSubmit(options);
		return false;
	});
	$("#btn_user_del_close").click(function(){
		gDialog.fClose();
	});
});
	function showRequest(formData, jqForm, options) {
		return true;
	}
	function showResponse(jsonData, statusData) {
		if(statusData=="success"&&jsonData.status==200){
			 message_box.show('编辑成功!','success');
			 gDialog.fClose();
			 refreshThisTab();
		}else{
			 message_box.show("编辑失败!<br/>"+jsonData.msg,'error');
			 gDialog.fClose();
		}
	}
</script>   