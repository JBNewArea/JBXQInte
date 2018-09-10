/**
 * 事项页面获取数据is
 */
var pageSize = 10; // 每页显示多少条记录
var total; // 总共多少记录

$(function(){
	//checksIsLogin();
	findTrans(1);
});

/**
 * 分页回调函数
 */
function PageCallback(index, jq) { // 前一个表示您当前点击的那个分页的页数索引值，后一个参数表示装载容器。
	findTrans(index);
}

/**
 * 查询事项方法
 */
function findTrans(pageNo){
	debugger;
	console.log('comeon');
	$(".tcdPageCode").empty();
	var keyword = '';
	if($("#transKeyword").val()){
		keyword = $("#transKeyword").val();
	}else{
		keyword = getParameter("keyword");
	}
	console.log('ajax start');
	$.ajax({
		type : "post",
		dataType : "json",
		data : {
			"pageNo" : pageNo,
			"pageSize" : pageSize,
			"name" : keyword
		},
		url : "/JBXQInte/admin/onlinerep/getTheme",
		success : function(result){
			console.log(result);
			//result=JSON.parse(result.data);
			var result=eval("(" + result.data + ")");
			$("#translist").empty();
			total = result.size;
			$.each(result.list,function(index,element){
				$("#translist").append("<li>"
		                +"<div class='left_box'>"
		                +"  <h4>"+element.name+"</h4>"
		                +"  <p><span>受理机构：</span><span>受理机构</span></p>"
		                +"  <p class='btm_text'>"
		                +"  <span>全程网办服务</span>"
		                +"  <span>物流快递服务</span>"
		                +"  </p>"
		                +"</div>"
		                +"<div class='right_box'>"
		                +"  <dl>"
		                +"     <dd class='on'></dd>"
		                +"     <dd class='on'></dd>"
		                +"     <dd class='on'></dd>"
		                +"     <dd class='on'></dd>"
		                +"     <dd class='on'></dd>"
		                +" </dl>"
		                +"  <a href='javascript:void(0)' onclick=\"OnlineTransact('themeName','"+element.name+"','transIds','"+element.transIds+"','/JBXQInte/admin/onlinerep/toThemeDeclare')\">在线办理</a>"
		                +"  "
		                +" </div>"
		                +" </li>");
			});
			totalPage = total % pageSize == 0 ? total / pageSize : Math.ceil(total / pageSize) ;
			if($(".tcdPageCode").html().length==0){
				 $(".tcdPageCode").createPage({
				        pageCount:totalPage,
				        current:pageNo,
				        backFn:function(p){
				        	findTrans(p);
				        }
				});
			}
			
			if(keyword){
				delCookie("keyword");
			}
		}
	});
	console.log('ajax end');
}

/**
 * 判断用户是否登陆跳转
 * @param name  trans_id
 * @param value  
 * @param path  跳转路径
 */
function OnlineTransact(themeName,themeValue,transIds,transIdsValue,path){
	console.log(transIds + "="+ escape (transIdsValue));
	document.cookie = transIds + "="+ escape (transIdsValue);
	console.log(themeName + "="+ escape (themeValue));
	document.cookie = themeName + "="+ escape (themeValue);
	$.ajax({
		type : "post",
		dataType : "json",
		data:{
			"tempPath":path
		},
		url : "/JBXQInte/admin/onlinerep/toOnlineDeclare",
		success : function(result) {
			var myobj=eval("(" + result.data + ")");
			document.cookie = "legal_id" + "="+ escape (myobj.id);
			document.cookie = "user_type" + "="+ escape (myobj.type);
			location.href = path+"?type=1";
		}
	});
	console.log('判断用户是否登录跳转');
}