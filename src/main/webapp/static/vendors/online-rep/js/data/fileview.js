/*文件管理js*/
$(function(){
	if($.getUrlParam("id")){
		findListByUserMaterialid();
	}else{
		queryPublicitynoticeFile();
	}
});
//多材料列表
function findListByUserMaterialid(){
	var id = $.getUrlParam("id");
	$.ajax({
		type : "post",
		data : {
			"userMaterialid" : id
		},
		url : "f/front/interfaceweb/interfaceUserMaterial/findListByUserMaterialid",
		success : function(result){
			$("#tableHead").empty().append("<td width='30%'>材料名称</td><td>创建时间</td><td>上传来源</td><td>操作</td>");
			$("#materialList").empty();
			var fileSuffixAll = "JPG,GIF,JPEG,PNG";
			var jsonobject = eval("("+result+")");
			var parmas = "";
			$.each(jsonobject,function(index,element){
				if(fileSuffixAll.match(element.fileSuffix)){
					parmas = "<tr><td>"+element.fileName+"</td><td>"+element.createDateStr+"</td><td>"+element.remarks+"</td><td><a href=\"javascript:openFileView('"+element.id+"')\" style='text-decoration:none;'>附件查看</a><a href='f/front/interfaceweb/interfaceUserMaterial/userMaterialDown?id="+element.id+"' style='text-decoration:none;margin-left:2%;'>附件下载</a><a href=\"javascript:deleteFile('"+element.id+"')\" style='text-decoration:none;margin-left:2%;'>删除</a></td></tr>";
				}else{
					parmas = "<tr><td>"+element.fileName+"</td><td>"+element.createDateStr+"</td><td>"+element.remarks+"</td><td><a href='#' style='color:#ccc;text-decoration:none;' disabled='disabled'>附件查看</a><a href='f/front/interfaceweb/interfaceUserMaterial/userMaterialDown?id="+element.id+"' style='text-decoration:none;margin-left:2%;'>附件下载</a><a href=\"javascript:deleteFile('"+element.id+"')\" style='text-decoration:none;margin-left:2%;'>删除</a></td></tr>";
				}
				$("#materialList").append(parmas);
			});
		}
	});
}
//附件查看弹框
function openFileView(id){
	var fileurl = "f/front/interfaceweb/interfaceUserMaterial/UserMaterialLook?id="+id;
	top.layer.open({
		type:1,
		title:'附件查看',
		maxmin:true,
		area: ['80%', '80%'],
		content:'<img src="'+fileurl+'" style="height:100%;width:100%;"/>'
	});
}
//删除文件方法
function deleteFile(id){
	$.ajax({
		type : "post",
		url : "f/front/interfaceweb/interfaceUserMaterial/delete",
		data : {
			"id" : id
		},
		success : function(result){
			if(result == "success"){
				findListByUserMaterialid();
			}
		}
	});
}
//双公示附件下载列表
function queryPublicitynoticeFile(){
	var officeNumber = $.getUrlParam("officeNumber");
	$.ajax({
		type : "post",
		data : {
			"officeNumber" : officeNumber
		},
		url : "f/front/interfaceweb/interfacePublicitynotice/findPublicitynoticeFile",
		success : function(result){
			$("#tableHead").append("<td width='30%'>材料名称</td><td>操作</td>");
			$("#materialList").empty();
			var fileSuffixAll = "JPG,GIF,JPEG,PNG";
			var jsonobject = eval("("+result+")");
			var parmas = "";
			if(jsonobject.length == 0){
				$("#materialList").append("无附件");
			}
			$.each(jsonobject,function(index,element){
				parmas = "<tr><td style='width:70%;'>"+element.fileName+"</td><td><a href='f/front/interfaceweb/interfacePublicitynotice/fileDownload?id="+element.id+"' style='text-decoration:none;margin-left:2%;'>附件下载</a></td></tr>";
				$("#materialList").append(parmas);
			});
		}
	});
}
