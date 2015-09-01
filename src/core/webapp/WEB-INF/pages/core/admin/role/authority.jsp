<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<form role="form" id="form_role_authority" action="${base}/admin/role/saveAuthority.htm" method="post">
<input type="hidden" name="auth" id="auth" />
<input type="hidden" name="id" value="${roleId}" />
<div class="modal-body" style="border:1px solid #ccc;">
	<ul id="role_authority_tree" class="ztree" style="height: 300px;overflow: auto;"></ul>
</div>
<div class="modal-footer">
	<button type="submit" class="btn btn-primary">保存</button>
	<a role="button" class="btn btn-default" id="btn_role_authority_close">关闭</a>
</div>
</form>
<script type="text/javascript">
$(document).ready(function(){
	$('#form_role_authority').submit(function() {
		$(this).ajaxSubmit({
			beforeSubmit : showReq, 
			success : showRes, 
			resetForm : true,
			dataType : 'json'
		});
		return false;
	});

	$("#btn_role_authority_close").click(function(){
		gDialog.fClose();
	});
});

function showReq(formData, jqForm, options) {
	var razTree = $.fn.zTree.getZTreeObj("role_authority_tree");
    var nodes = razTree.getCheckedNodes();
    var raArr = new Array();//数组，用于存放所有对象
    for (var i = 0; i < nodes.length; i++)
    {
    	raArr[i]=nodes[i].id;
    }
    formData[0].value=raArr;
	return true;
}
	
function showRes(jsonData, statusData) {
	if(statusData=="success"&&jsonData.status==200){
		message_box.show("保存成功!",'success');
		gDialog.fClose();
	}else{
		message_box.show("保存失败!<br/>"+jsonData.msg,'error');
	}
}
function refreshAuthority(id){
	message_box.show("刷新成功!",'success');
}
</script>
<script type="text/javascript">
		<!--
		var rasetting = {
			async : {
				enable : true,
				url : "${base}/admin/authority/getAuthroityJosn.htm",
				autoParam : [ "id" ],
				dataFilter: ajaxDataFilter
			},
			check: {
				enable: true
			},
			data: {
				simpleData: {
					enable: true
				}
			}
		};
		function ajaxDataFilter(treeId, parentNode, responseData) {
			var str='${arr}'; 
			var arr=str.split(',');
		    if (responseData) {
		    	for(var i =0; i < arr.length; i++){
		      		for(var j =0; j < responseData.length; j++) {
		      			if(arr[i]==responseData[j].id){
		      				responseData[j].checked=true;
		      			}
		      		}
		      	}
		    }
		    return responseData;
		};
		$(document).ready(function(){
			$.fn.zTree.init($("#role_authority_tree"), rasetting);
			var zTree = $.fn.zTree.getZTreeObj("role_authority_tree");
			zTree.setting.check.chkboxType = { "Y" : "s", "N" : "ps" };
		});
		//-->
</script> 