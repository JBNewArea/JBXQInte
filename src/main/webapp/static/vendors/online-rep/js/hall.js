$(function() {
    
});

var M = Mustache, //模板引擎
introducetemp = $("#introducetemp").html()
tabbodytemp = $("#tabbodytemp").html(); 

var url="../../../../rest/qjdinfoaction/getzwfwinfo";

$(function() {
    var geoCoordMap = {
        // "南京市": [118.73757,32.028498],
        "南京江北新区管理委员会行政审批局<br>南京江北新区政务服务中心（丽景路）": [118.71917,32.16433],
        "南京江北新区政务服务中心（园西路）": [118.75487,32.234659],
        // "玄武区": [118.827757,32.068498],
        // "秦淮区": [118.81476,32.019113],
        // "建邺区": [118.701793,31.983731],
        // "鼓楼区": [118.770182,32.066601],
        // "栖霞区": [118.929153,32.116388],
        // "雨花台区": [118.739051,31.95126],
        "浦口区": [118.508003,32.058903],
        // "江宁区": [118.840015,31.852612],
        "六合区": [118.832132,32.383584],//
        // "溧水区": [119.028288,31.551099],//
        // "高淳区": [119.02222,31.327586]//
        // "经济技术开发区": [118.999153,32.156388]
    };

    var requestdata = [
        // { name: "南京市", value: "江东中路265号", tel: "025-68506850", capital: false },
         { name: "南京江北新区管理委员会行政审批局<br>南京江北新区政务服务中心（丽景路）", value: "浦口区丽景路2号", tel: "025-67872806", capital: true },
        { name: "南京江北新区政务服务中心（园西路）", value: "六合区园西路180号 ", capital: true },
        // { name: "玄武区", value: "玄武区珠江路455号", tel: "025-83678288", capital: false },
        // { name: "秦淮区", value: "秦淮区太平南路69号", tel: "025-84556777", capital: false },
        // { name: "建邺区", value: "雨润大街99号双和综合办公区内02栋、03栋一楼", tel: "025-58950800", capital: false },
        // { name: "鼓楼区", value: "鼓楼区山西路84号", tel: "025-83230218", capital: false },
        // { name: "栖霞区", value: "栖霞区尧佳路20", tel: "025-85563360", capital: false },
        // { name: "雨花台区", value: "雨花台区软件大道106号1幢", tel: "025-84426711", capital: false },
        /*{ name: "浦口区", value: "浦口区江浦街道龙华路18号", tel: "025-58002000", capital: false },*/
        // { name: "江宁区", value: "东山街道金箔路218号", tel: "025-2280033", capital: false },
        /*{ name: "六合区", value: "六合区雄州东路1号 ", tel: "025-57130500", capital: false },*/
        // { name: "溧水区", value: "溧水县永阳镇后巷10号", tel: "025-56220869", capital: false },
        // { name: "高淳区", value: "高淳区康乐路195", tel: "025-57358911", capital: false }
        // { name: "经济技术开发区", value: "我母鸡道啊", tel: "025-538683838", capital: false }
    ];

    //散点图数据
    var convertData = function(data, flag) {
        var res = [];
        for (var i = 0; i < data.length; i++) {
            if (data[i].capital == flag) {
                var geoCoord = geoCoordMap[data[i].name];
                if (geoCoord) {
                    res.push({
                        name: data[i].name,
                        value: geoCoord.concat(data[i].value),
                        tel: data[i].tel
                    });
                }
            }
        }

        return res;
    };

    var mapChart = echarts.init(document.getElementById('map'));
    mapChart.setOption({
        title: {
        	top:15,
        	left: 120,
            text: '办事大厅分布图',
            textStyle:{
            	fontWeight:'normal'
            }
        },
        backgroundColor: '#f7f7f7',
        tooltip: {
            trigger: 'item',
            formatter: function(params) {
                return  params.name + '<br>'+ "地址：" + params.value[2];
            }
        },
        legend: {
            orient: 'vertical',
            left: 20,
            bottom: 20,
            data: ['江北新区政务服务中心']
        },
        geo: [{
            map: 'nanjing',
            label: {
            	normal:{
            		show:false,
            		textStyle:{
            			color:'#fff'
            		}
            	},
                emphasis: {
                    show: false,
                    textStyle:{
                    	color:'#333'
                    }
                }
            },
            itemStyle: {
                normal: {
                    areaColor: '#66cdaa'
                },
                emphasis: {
                    areaColor: '#cae1ff'
                }
            }
        }],
        series: [{
            name: '江北新区政务服务中心',
            type: 'effectScatter',
            coordinateSystem: 'geo',
            data: convertData(requestdata, true),
            symbolSize: 15,
            showEffectOn: 'render',
            rippleEffect: {
                brushType: 'stroke'
            },
            hoverAnimation: true,
            itemStyle: {
                normal: {
                    color: '#ff6000',
                    shadowBlur: 5,
                    shadowColor: '#ff6000'
                }
            }
        }]
    });
    mapChart.on('click', function (params) {
	    var name=encodeURI(params.name);
	    getinfo(name);
		
	});
	
    
    getinfo('');
    function getinfo(name){
    	$.ajax({
            url: url,
            type: 'post',
            dataType: 'json',
            data: {
            	name:name
            },
            success: function(data) {
            	$('#introduce').html(M.render(introducetemp, data));
            	$('#tabbody').html(M.render(tabbodytemp, data));
            },complete:function(){
            	new TabView({
                    dom: '#tab',
                    activeCls: 'active',
                    triggerEvent: 'click'
                });
            }
        })
    }

});