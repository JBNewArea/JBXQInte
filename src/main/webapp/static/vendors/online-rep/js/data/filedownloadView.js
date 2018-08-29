/*用户材料*/

//通过id查询用户上传材料列表
function getUserMaterialList(id){
	$.ajax({
		type : "post",
		data : {
			"id" : id
		},
		url : "f/front/interfaceweb/interfaceUserMaterial/getUserMaterialList",
		success : function(result){
			var content = "";
			result = eval("("+result+")");
			$.each(result,function(index,element){
				var params = element.split("=");
				content += '<label>'					
				        +'<input type="radio" name="filepath" value="'+element+'"/>'+params[0]
				        +'</label><br/>';
			});
			layer.open({
				title:'请选择需要下载的材料',
				fixed: false, //不固定
				maxmin: true,
				content: content,
				yes:function(index){
					var filepathandname = $("input[name='filepath']:checked").val();
					var params = filepathandname.split("=");
					location.href="f/front/interfaceweb/interfaceUserMaterial/userMaterialDowntoPath?fileAddress="+params[1]+"&fileNamelocal="+params[0];
					layer.close(index);
				}
			});
		}
	});
}


//打开对话框(查看)
function openDialogView(title,id,width,height,type){
	var parmas = "";
	if(navigator.userAgent.match(/(iPhone|iPod|Android|ios)/i)){//如果是移动端，就使用自适应大小弹窗
		width='auto';
		height='auto';
	}else{//如果是PC端，根据用户设置的width和height显示。
	}
	if(type == 1){
		parmas = "id";
	}else{
		parmas = "officeNumber";
	}
	top.layer.open({
	    type: 2,  
	    area: [width, height],
	    title: title,
        maxmin: true, //开启最大化最小化按钮
	    content: "fileview.html?"+parmas+"="+id ,
	    btn: ['关闭'],
	    cancel: function(index){ 
	    	
	    }
	}); 
}