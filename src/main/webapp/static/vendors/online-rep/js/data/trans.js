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
			"transName" : keyword
		},
		url : "/JBXQInte/admin/onlinerep/getMatter",
		success : function(result){
			var myobj=eval("(" + result.data + ")");
			$("#translist").empty();
			total = result.count;
			$.each(myobj.list,function(index,element){
				$("#translist").append("<li>"
		                +"<div class='left_box'>"
		                +"  <h4>"+element.transName+"</h4>"
		                +"  <p><span>受理机构：</span><span>"+element.office.name+"</span></p>"
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
		                +"  <a href='javascript:void(0)' onclick=\"OnlineTransact('trans_id','"+element.id+"','/JBXQInte/admin/onlinerep/toDeclare')\">在线办理</a>"
		                +"  <a href='/JBXQInte/admin/onlinerep/toMatterGuide?id="+element.id+"'>办事指南</a>"
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
function OnlineTransact(name,value,path){
	document.cookie = name + "="+ escape (value);
	$.ajax({
		type : "post",
		dataType : "json",
		data:{
			"tempPath":path
		},
		url : "/JBXQInte/admin/onlinerep/toOnlineDeclare",
		success : function(result) {
			console.log(result.data);
			var myobj=eval("(" + result.data + ")");
			document.cookie = "legal_id" + "="+ escape (myobj.id);
			document.cookie = "user_type" + "="+ escape (myobj.type);
			location.href = path+"?type=0";
//			if(result.type == 1){
//				document.cookie = "user_id" + "="+ escape (result.id);
//				document.cookie = "user_type" + "="+ escape (result.type);
//				location.href = path ;
//			}else if(result.type == 2){
//				document.cookie = "legal_id" + "="+ escape (result.id);
//				document.cookie = "user_type" + "="+ escape (result.type);
//				location.href = path ;
//			}else if(result.type == 0){
//				location.href = "login.html?url="+path;
//			}
		}
	});
}