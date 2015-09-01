<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>通用权限管理系统</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.4 -->
    <link href="${base}/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="${base}/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="${base}/plugins/ionicons/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="${base}/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link href="${base}/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
	<!-- jquery-ui tabs -->
    <link href="${base}/plugins/jQueryUI/jquery-ui-1.10.0.custom.css" rel="stylesheet" type="text/css" />
    <!-- 右键菜单 -->
    <link href="${base}/plugins/contextMenu/css/context.standalone.css" rel="stylesheet" type="text/css" />    
	<!-- 弹窗插件 -->
	<link href="${base}/plugins/bootstrap-jshow/css/bootstrap-modal-bs3patch.css" rel="stylesheet" />
	<link href="${base}/plugins/bootstrap-jshow/css/bootstrap-modal.css" rel="stylesheet" />
	<!-- zTree插件 -->
	<link rel="stylesheet" href="${base}/plugins/zTree_v3/css/zTreeStyle/zTreeStyle_b.css" type="text/css">

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>
  <body class="skin-blue sidebar-mini">
    <div class="wrapper">

      <!-- Main Header -->
      <header class="main-header">

        <!-- Logo -->
        <a href="${base}/index.htm" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b></b>管理</span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b></b>通用权限管理系统</span>
        </a>

        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
          <!-- Navbar Right Menu -->
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <!-- Messages: style can be found in dropdown.less-->
              <li><a href="${base}/login.htm">登录</a></li>
              <li class="dropdown messages-menu">
                <!-- Menu toggle button -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-envelope-o"></i>
                  <span class="label label-success">4</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 4 messages</li>
                  <li>
                    <!-- inner menu: contains the messages -->
                    <ul class="menu">
                      <li><!-- start message -->
                        <a href="#">
                          <div class="pull-left">
                            <!-- User Image -->
                            <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image" />
                          </div>
                          <!-- Message title and timestamp -->
                          <h4>
                            Support Team
                            <small><i class="fa fa-clock-o"></i> 5 mins</small>
                          </h4>
                          <!-- The message -->
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li><!-- end message -->
                    </ul><!-- /.menu -->
                  </li>
                  <li class="footer"><a href="#">See All Messages</a></li>
                </ul>
              </li><!-- /.messages-menu -->

              <!-- Notifications Menu -->
              <li class="dropdown notifications-menu">
                <!-- Menu toggle button -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-bell-o"></i>
                  <span class="label label-warning">10</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 10 notifications</li>
                  <li>
                    <!-- Inner Menu: contains the notifications -->
                    <ul class="menu">
                      <li><!-- start notification -->
                        <a href="#">
                          <i class="fa fa-users text-aqua"></i> 5 new members
                        </a>
                      </li><!-- end notification -->
                    </ul>
                  </li>
                  <li class="footer"><a href="#">View all</a></li>
                </ul>
              </li>
              <!-- Tasks Menu -->
              <li class="dropdown tasks-menu">
                <!-- Menu Toggle Button -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-flag-o"></i>
                  <span class="label label-danger">9</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 9 tasks</li>
                  <li>
                    <!-- Inner menu: contains the tasks -->
                    <ul class="menu">
                      <li><!-- Task item -->
                        <a href="#">
                          <!-- Task title and progress text -->
                          <h3>
                            Design some buttons
                            <small class="pull-right">20%</small>
                          </h3>
                          <!-- The progress bar -->
                          <div class="progress xs">
                            <!-- Change the css width attribute to simulate progress -->
                            <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                              <span class="sr-only">20% Complete</span>
                            </div>
                          </div>
                        </a>
                      </li><!-- end task item -->
                    </ul>
                  </li>
                  <li class="footer">
                    <a href="#">View all tasks</a>
                  </li>
                </ul>
              </li>
              <!-- User Account Menu -->
              <li class="dropdown user user-menu">
                <!-- Menu Toggle Button -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <!-- The user image in the navbar-->
                  <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image" />
                  <!-- hidden-xs hides the username on small devices so only the image appears. -->
                  <span class="hidden-xs">欢迎回来，何海洋</span>
                </a>
                <ul class="dropdown-menu">
                  <!-- The user image in the menu -->
                  <li class="user-header">
                    <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image" />
                    <p>
                   	   个人信息面板
                      <small>2015-07-30 20:25</small>
                    </p>
                  </li>
				  
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="#" class="btn btn-default btn-flat">个人中心</a>
                    </div>
                    <div class="pull-right">
                      <a href="${base}/logout.do" class="btn btn-default btn-flat">注销</a>
                    </div>
                  </li>
                </ul>
              </li>
              <!-- Control Sidebar Toggle Button -->
              <li>
                <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
              </li>
            </ul>
          </div>
        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- search form (Optional) -->
          <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
              <input type="text" name="q" class="form-control" placeholder="查询..." />
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
          </form>
          <!-- /.search form -->

          <!-- Sidebar Menu -->
          <ul class="sidebar-menu">
            <li class="header">系统菜单</li>
            <!-- Optionally, you can add icons to the links -->
            <li><a href="#" onclick="createNewTab('index','主页','#')"><i class="fa fa-dashboard"></i> <span>主页</span></a></li>
            <li class="treeview">
              <a href="#"><i class="fa fa-link"></i> <span>系统设置</span> <i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="#" onclick="createNewTab('userManage','用户管理','${base}/admin/user/list.htm')">用户管理</a></li>
                <li><a href="#" onclick="createNewTab('roleManage','角色管理','${base}/admin/role/list.htm')">角色管理</a></li>
                <li><a href="#" onclick="createNewTab('authorityManage','权限管理','${base}/admin/authority/list.htm')">权限管理</a></li>
                <li><a href="#" onclick="createNewTab('resourceManage','资源管理','${base}/admin/resource/list.htm')">资源管理</a></li>
                <li><a href="#" onclick="createNewTab('parameterManage','参数设置','${base}/admin/parameter/list.htm')">参数设置</a></li>	               
              </ul>
            </li>
          </ul><!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">

        <!-- Main content -->
        <section class="tabs-simple" >
          <!-- Your Page Content Here -->
                <div id="tabContent">
                    <ul role="tablist" id="mainTab">
                        <li id="tab-index" ><a id='ui-id-1' href="./start.htm">主页</a></li>
                    </ul>
                </div>
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

      <!-- Main Footer -->
      <footer class="main-footer">
        <!-- To the right -->
        <div class="pull-right hidden-xs">
          Anything you want
        </div>
        <!-- Default to the left -->
        <strong>Copyright &copy; 2015 <a href="#">Company</a>.</strong> All rights reserved.
      </footer>

      <!-- Control Sidebar -->
      <aside class="control-sidebar control-sidebar-dark">
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
          <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
          <!-- Home tab content -->
          <div class="tab-pane" id="control-sidebar-home-tab">
            <h3 class="control-sidebar-heading">系统信息</h3>
            <ul class="control-sidebar-menu">
              <li>
                <a href="javascript::;">
                  <i class="menu-icon fa fa-birthday-cake bg-red"></i>
                  <div class="menu-info">
                    <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>
                    <p>Will be 23 on April 24th</p>
                  </div>
                </a>
              </li>
            </ul><!-- /.control-sidebar-menu -->
          </div><!-- /.tab-pane -->
        </div>
      </aside><!-- /.control-sidebar -->
      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
      <div class="control-sidebar-bg"></div>
    </div><!-- ./wrapper -->

    <!-- jQuery 2.1.4 -->
    <script src="${base}/plugins/jQuery/jQuery-2.1.4.min.js" type="text/javascript"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="${base}/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- AdminLTE App -->
    <script src="${base}/dist/js/app.min.js" type="text/javascript"></script>
    <!-- jquery Ui -->
    <script src="${base}/plugins/jQueryUI/jquery-ui-1.10.0.custom.min.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="${base}/dist/js/demo.js" type="text/javascript"></script>
    <!-- 右键菜单 -->
    <script src="${base}/plugins/contextMenu/js/context.js" type="text/javascript"></script> 
    <!-- 分页插件 -->
	<script src="${base}/plugins/page/jquery.page.js" type="text/javascript"></script> 
	<!-- 表单ajax提交 -->
	<script type="text/javascript" src="${base}/plugins/ajaxsubmit/jquery.form.min.js"></script>
	<!-- 弹窗插件 -->
    <script src="${base}/plugins/bootstrap-jshow/js/bootstrap-modalmanager.js"></script>
    <script src="${base}/plugins/bootstrap-jshow/js/bootstrap-modal.js"></script>
	<script src="${base}/plugins/bootstrap-jshow/js/jquery.ui.draggable.js"></script>
	<script src="${base}/plugins/bootstrap-jshow/js/modal.manager.plugin1.0.js"></script>
	<script src="${base}/plugins/bootstrap-jshow/js/jshow.utils.js"></script>
	<script src="${base}/plugins/bootstrap-jshow/js/form.validate.js"></script>	
	<!-- zTree插件 -->
	<script type="text/javascript" src="${base}/plugins/zTree_v3/js/jquery.ztree.core-3.5.js"></script>
	<script type="text/javascript" src="${base}/plugins/zTree_v3/js/jquery.ztree.excheck-3.5.js"></script>
	<script type="text/javascript" src="${base}/plugins/zTree_v3/js/jquery.ztree.exedit-3.5.js"></script>	
<script type="text/javascript">
/**
 * 标签页 
 */
//tabs init
	var tabTemplate = "<li id='{tabId}' ><a href='{url}'><span>{title}</span></a><span class='ui-icon ui-icon-close'>Remove Tab</span></li>";
    	
	var tabs = $( "#tabContent" ).tabs({  
      	//collapsible: true,//双击标签名称部分，可以折叠标签内容。
      	//event: "mouseover",//鼠标滑过打开标签
      	//disabled: false, //是否禁用,也可是指定[0,2]
      	//active: 1,
      	//heightStyle: "content",//"auto"、"fill"、"content"
      	//hide: { effect: "explode", duration: 1000 },
      	//show: { effect: "blind", duration: 800 },
        create: function( event, ui ) {
      		//alert("tabs初始化完成！");
      	},
      	beforeActivate: function( event, ui ) {
      		//alert("tabs激活前！");
      	},
      	activate: function( event, ui ) {
          	//alert("tabs激活完成！");
      	},
      	beforeLoad: function( event, ui ) {
      		//alert("ajax加载前！");
      		var panelText=$("#"+ui.tab.find("a").parent().attr("aria-controls")).text();
  			//防止每次激活标签页都加载页面.
  			if($.trim(panelText).length>0){
  				ui.jqXHR.abort();
  				return ;
  			}
        	ui.jqXHR.error(function() {
      			//var errorMsg="加载失败,我们会尽快修复这个问题!";
          		var errorMsg = ui.jqXHR.responseText;
          		ui.panel.html(errorMsg);
        	});
      	},
      	load: function( event, ui ) {
      		//alert("ajax加载完成！");
      	}
    }); 
    //使用sortable方法可以让选项卡的顺序通过鼠标拖动标签名调节
    /**
    tabs.find( ".ui-tabs-nav" ).sortable({  
      axis: "x",  
      stop: function() {  
      	tabs.tabs( "refresh" );  
      }  
    });  
    */
// create tab
	function createNewTab(code, title, url ) {
    	var tabId = "tab-" + code;
		if($("#"+tabId).length>0) //若存在相同code,表示已创建该tab，选中即可。
		{	
			activeThisTab(tabId);
			return ;
		}else{	
			var newTab = $( tabTemplate.replace( "{tabId}", tabId ).replace( "{url}", url ).replace( "{title}", title ) );
    		tabs.find(".ui-tabs-nav" ).append( newTab );
    		activeThisTab(tabId);
   		}
	} 
// active tab
	function activeThisTab(tabId){
		tabs.tabs("refresh");
	 	var tabIndex=$("#"+tabId).index();//获取tab index值
		tabs.tabs('option', 'active', tabIndex);//根据id 选中tab
	}
// close tab
	$( "#tabContent" ).on( "click",'span.ui-icon-close', function() {
    	var panelId = $( this ).closest( "li" ).remove().attr( "aria-controls" );
    	$( "#" + panelId ).remove();
    	tabs.tabs( "refresh" );
	});
//refresh this tab
	function refreshThisTab(){
		var tabIndex=tabs.tabs('option', 'active');
	 	var x=$("#mainTab li[id^='tab-']").toArray();
	 	var tabId=x[tabIndex].id;
		var panelId=$("#"+tabId).attr( "aria-controls" );
		$("#"+panelId).html("");
		tabs.tabs( "load", $("#"+tabId).index());
	}
//refresh all tabs
	function refreshAllTabs(){	
     	var x=$("#mainTab li[id^='tab-']").toArray()
     	var tabId="",panelId="";
      	for (var i=0;i<x.length;i++)
      	{
      		tabId=x[i].id;
      		panelId=$("#"+tabId).attr( "aria-controls" );
      		$("#"+panelId).html("");
      		tabs.tabs( "load", $("#"+tabId).index());
      	}
      	context.destroy('#authorityTreeDiv');
	}
// close this tab
	function closeThisTab(){
		var tabIndex=tabs.tabs('option', 'active');
	 	var x=$("#mainTab li[id^='tab-']").toArray();
	 	var tabId=x[tabIndex].id;
	 	var panelId=$("#"+tabId).attr( "aria-controls" );
		if(tabIndex==$("#"+tabId).index()&&$.trim(tabId) != $.trim("tab-index")){
			$("#"+tabId).remove();
			$("#"+panelId).remove();
			tabs.tabs( "refresh" );
			tabs.tabs('option', 'active', tabIndex-1);//激活前一标签页
		}
	}
// close other tabs
	function closeOtherTabs(){
		var tabIndex=tabs.tabs('option', 'active');
		var array= new Array();
		var tabId="",panelId="";
    	var x=$("#mainTab li[id^='tab-']").toArray();
    	for (var i=0;i<x.length;i++)
    	{
    		tabId=x[i].id;
			if(tabIndex!=$("#"+tabId).index()&&$.trim(tabId) != $.trim("tab-index")){
				array.push(tabId);
			}
    	}
		for (var i=0;i<array.length;i++)
    	{
			panelId=$("#"+array[i]).remove().attr( "aria-controls" );
			$("#"+panelId).remove();
			tabs.tabs( "refresh" );
		}
	}
// close all tabs
	function closeAllTabs(){
     	var x=$("#mainTab li[id^='tab-']").toArray()
     	var tabId="",panelId="";
      	for (var i=0;i<x.length;i++)
      	{
      		tabId=x[i].id;
    		if($.trim(tabId) != $.trim("tab-index")){
    			panelId=$("#"+tabId).remove().attr( "aria-controls" );
    			$("#"+panelId).remove();
    			tabs.tabs( "refresh" );
    		}
      	}
      	tabs.tabs('option', 'active', 0);//激活主页标签页
	}
</script>
<script type="text/javascript">
/**
 * 右键菜单
 */ 
	context.init({preventDoubleContext: true});
	context.settings({compress: true});
	context.attach('#mainTab', [
		{text: '刷新当前标签页', action: function(e){
			refreshThisTab();
		}},
		{text: '刷新全部标签页', action: function(e){
			refreshAllTabs();
		}},	
		{text: '关闭当前标签页', action: function(e){
			closeThisTab();
		}},
		{text: '关闭其他标签页', action: function(e){
			closeOtherTabs();
		}},
		{text: '关闭全部标签页', action: function(e){
			closeAllTabs();
		}}
	]);
</script>
  </body>
</html>
