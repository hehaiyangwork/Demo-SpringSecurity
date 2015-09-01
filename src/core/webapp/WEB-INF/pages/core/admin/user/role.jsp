<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<form role="form" id="form_user_role" action="${base}/admin/user/saveRole.htm" method="post">
<input type="hidden" name="role" id="role" />
<input type="hidden" name="id" value="${userId}"/>
<div class="modal-body">
	<ul id="user_role_tree" class="ztree" style="height: 300px;overflow: auto;"></ul>
</div>
<div class="modal-footer">
	<button type="submit" class="btn btn-primary">保存</button>
	<a role="button" class="btn btn-default" id="btn_user_role_close">关闭</a>
</div>
</form>
<script type="text/javascript">
$(document).ready(function(){
	$('#form_user_role').submit(function() {
		$(this).ajaxSubmit({
			beforeSubmit : showReq, 
			success : showRes, 
			resetForm : true,
			dataType : 'json'
		});
		return false;
	});

	$("#btn_user_role_close").click(function(){
		gDialog.fClose();
	});
});

function showReq(formData, jqForm, options) {
	var razTree = $.fn.zTree.getZTreeObj("user_role_tree");
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
				url : "${base}/admin/role/getRoleJosn.htm",
				autoParam : [ "id" ],
				dataFilter: ajaxDataFilter
			},
			check: {
				enable: true
			},
			view: {
				dblClickExpand: dblClickExpand,
				selectedMulti: false
			},
			data: {
				simpleData: {
					enable: true
				}
			}
		};
		function dblClickExpand(treeId, treeNode) {
			return treeNode.level > 0;
		}
		
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
			$.fn.zTree.init($("#user_role_tree"), rasetting);
			var razTree = $.fn.zTree.getZTreeObj("user_role_tree");
			razTree.setting.check.chkboxType = { "Y" : "", "N" : "" };
		});
		//-->
</script> 