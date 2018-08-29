/**
 * 首页数据获取js
 * @author mawenxia
 * 2017-12-21
 */

$(function(){
	checksIsLogin();
})


/**
 * 搜索事项的方法
 */
function searchTrans(){
	var keyword = $("#keyword_input").val();
	document.cookie = "keyword" + "="+ escape (keyword);
	location.href = 'shixiang.html';
}