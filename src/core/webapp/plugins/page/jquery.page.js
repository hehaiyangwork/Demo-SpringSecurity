//分页插件
/**
2014-08-05 ch
**/
(function($){
	var ms = {
		init:function(obj,args){
			return (function(){
				ms.fillHtml(obj,args);
				ms.bindEvent(obj,args);
			})();
		},
		//填充html
		fillHtml:function(obj,args){
			return (function(){
				obj.empty();
				obj.append('<span style="color:#000;">页数：'+ args.currentPage +'/'+ args.pageCount +'</span>');
				//上一页
				if(args.currentPage > 1){
					obj.append('<a href="javascript:;" class="prevPage">上一页</a>');
				}else{
					obj.remove('.prevPage');
					obj.append('<span class="disabled">上一页</span>');
				}
				//中间页码
				if(args.currentPage != 1 && args.currentPage >= 4 && args.pageCount != 4){
					obj.append('<a href="javascript:;" class="tcdNumber">'+1+'</a>');
				}
				if(args.currentPage-2 > 2 && args.currentPage <= args.pageCount && args.pageCount > 5){
					obj.append('<span>...</span>');
				}
				var start = args.currentPage -2,end = args.currentPage+2;
				if((start > 1 && args.currentPage < 4)||args.currentPage == 1){
					end++;
				}
				if(args.currentPage > args.pageCount-4 && args.currentPage >= args.pageCount){
					start--;
				}
				for (;start <= end; start++) {
					if(start <= args.pageCount && start >= 1){
						if(start != args.currentPage){
							obj.append('<a href="javascript:;" class="tcdNumber">'+ start +'</a>');
						}else{
							obj.append('<span class="currentPage">'+ start +'</span>');
						}
					}
				}
				if(args.currentPage + 2 < args.pageCount - 1 && args.currentPage >= 1 && args.pageCount > 5){
					obj.append('<span>...</span>');
				}
				if(args.currentPage != args.pageCount && args.currentPage < args.pageCount -2  && args.pageCount != 4){
					obj.append('<a href="javascript:;" class="tcdNumber">'+args.pageCount+'</a>');
				}
				//下一页
				if(args.currentPage < args.pageCount){
					obj.append('<a href="javascript:;" class="nextPage">下一页</a>');
				}else{
					obj.remove('.nextPage');
					obj.append('<span class="disabled">下一页</span>');
				}
			})();
		},
		//绑定事件
		bindEvent:function(obj,args){
			return (function(){
				obj.on("click","a.tcdNumber",function(){
					var currentPage = parseInt($(this).text());
					ms.fillHtml(obj,{"currentPage":currentPage,"pageCount":args.pageCount});
					if(typeof(args.callback)=="function"){
						args.callback(currentPage);
					}
				});
				//上一页
				obj.on("click","a.prevPage",function(){
					var currentPage = parseInt(obj.children("span.currentPage").text());
					ms.fillHtml(obj,{"currentPage":currentPage-1,"pageCount":args.pageCount});
					if(typeof(args.callback)=="function"){
						args.callback(currentPage-1);
					}
				});
				//下一页
				obj.on("click","a.nextPage",function(){
					var currentPage = parseInt(obj.children("span.currentPage").text());
					ms.fillHtml(obj,{"currentPage":currentPage+1,"pageCount":args.pageCount});
					if(typeof(args.callback)=="function"){
						args.callback(currentPage+1);
					}
				});
			})();
		}
	}
	$.fn.createPage = function(options){
		var args = $.extend({
			pageCount : 10,//总页数
			pageSize : 10,//每页大小
			currentPage : 1,//当前页
			totalRecord : 100,//总记录数
			callback : function(){}//回调函数
		},options);
		ms.init(this,args);
	}
})(jQuery);
