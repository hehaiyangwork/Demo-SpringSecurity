<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
	<title>提示信息</title>
</head>
<body>
<h4>出错啦~~~</h4>
<h3>亲,请登录!</h3>
<p>将在 <span id="mes">5</span> 秒钟后跳转到登录页面!</p>
<script type="text/javascript">
var t = 5;
function countDown(){
	t--;
	if (t<=0) {
		location.href="${base}/login.htm";
		clearInterval(inter);
	};
	document.getElementById("mes").innerHTML = t; 
}
var inter = setInterval("countDown()",1000);
</script> 
</body>
</html>
