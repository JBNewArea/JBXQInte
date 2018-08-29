/**
 * 办件详情页面数据js
 * @author mawenxia
 * @version 2018-01-26
 */

$(function() {
	queryApplicationById();
});

// 查询办件详细信息的方法
function queryApplicationById() {
	var id = $.getUrlParam('id');
	$.ajax({
			type : "post",
			dataType : "json",
			data : {
				"id" : id
			},
			url : "f/front/interfaceweb/interfaceApplication/findOne",
			success : function(application) {
				$("#office_number").text(application.officeNumber);
				$("#trans_name").text(application.trans.transName);
				$("#projectNumber").text(application.projectNumber);
				$("#dept_name").text(application.trans.office.name);
				$("#checkstatus").text(application.checkStatus);
				if(application.checkMessage)
				{
					$("#check_message_tr").show();
					$("#checkMessage").text(application.checkMessage);
				}
				if(null == application.status){
					$("#status").text("暂无审批进度 ");
				}else{
					if(application.status == "待接件"){
						getStatus(1);
					}else if(application.status == "待受理"){
						getStatus(2);
					}else if(application.status == "审批中"){
						getStatus(3);
					}else if(application.status == "待办结"){
						getStatus(4);
					}else if(application.status == "已办结"){
						getStatus(5);
						queryResultFile(application.officeNumber);
					}
				}
				$("#apply_date").text(application.applyTime);
				$("#shouliTime").text(application.shouliTime);
				$("#end_date").text(application.finishTime);
				if(application.shouliperson == null){
					$("#shouli_username").text("无受理人");
				}else{
					$("#shouli_username").text(application.shouliperson.name);
				}
				$("#applicant").text(application.applicantName);
				$("#documentType").text(application.applicantDocumentType);
				$("#documentNumber").text(application.applicantDocumentNumber);
				if(application.agentName == null || application.agentName == ""){
					$("#agentName").text("无");
				}else{
					$("#agentName").text(application.agentName);
				}
				if(application.agentDocumentNumber == null || application.agentDocumentNumber== ""){
					$("#agentdocumentNumber").text("无");
				}else{
					$("#agentdocumentNumber").text(application.agentDocumentNumber);
				}
				if(application.agentDocumentType == null || application.agentDocumentType == ""){
					$("#agentdocumentType").text("无");
				}else{
					$("#agentdocumentType").text(application.agentDocumentType);
				}
				if(application.legalRepresentative == null || application.legalRepresentative == ""){
					$("#legal").empty();
				}else{
					$("#legalRepresentative").text(application.legalRepresentative);
				}
				if(application.postcode == null || application.postcode == ""){
					$("#postcode").text("无");
				}else{
					$("#postcode").text(application.postcode);
				}
				if(application.address == null || application.address == ""){
					$("#address").text("无");
				}else{
					$("#address").text(application.address);
				}
				if(application.telPhone == null || application.telPhone == ""){
					$("#agent_telphone").text("无");
				}else{
					$("#agent_telphone").text(application.telPhone);
				}
				$("#telephone").text(application.phone);
			}
		});
}

// 查询材料的方法
function queryResultFile(officeNumber) {
	$.ajax({
			type : "post",
			dataType : "json",
			data : {
				"officeNumber" : officeNumber
			},
			url : "f/front/interfaceweb/interfaceConcluded/findResultFileView",
			success : function(result) {
				$("#result_file").empty();
				var parmas = "";
				var index = "";
				var fileName = "";
				$.each(result,function(index,element){
					parmas = element.split("=");
					index = parmas[0];
					fileName = parmas[1];
					$("#result_file").append("<tr>"
                        +"<td style='width:900px;'>"+fileName+"</td>"
						+"<td><a href='f/front/interfaceweb/interfaceConcluded/resultFileDown?index="+index+"&officeNumber="+officeNumber+"'><button></button></a></td>"
					+"</tr>");
				});
			},
			error : function(){
				alert("数据获取失败！");
			}
		});
}

// 传trans_id的方法
function setApplication_Id(name, value, url) {
	document.cookie = name + "=" + escape(value);
	document.cookie = "flag=4";
	location.href = url;
}

/*状态条方法*/
function getStatus(step){
	//所有步骤的数据
	var stepListJson=[{StepNum:1,StepText:"接件"},
    {StepNum:2,StepText:"受理"},
    {StepNum:3,StepText:"审批"},
    {StepNum:4,StepText:"待办结"},
    {StepNum:5,StepText:"已办结"}];
	
	//当前进行到第几步
	var currentStep=step;
	//new一个工具类
	var StepTool = new Step_Tool_dc("test","mycall");
	//使用工具对页面绘制相关流程步骤图形显示
	StepTool.drawStep(currentStep,stepListJson);
	//回调函数
	function mycall(restult){
	//	alert("mycall"+result.value+":"+result.text);
		StepTool.drawStep(result.value,stepListJson);
		//TODO...这里可以填充点击步骤的后加载相对应数据的代码
	}
}
