package com.idea.modules.charts.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.idea.core.common.controller.BaseController;

@Controller
@RequestMapping("${admin.url.prefix}/charts/echarts")
public class EchartsController extends BaseController {
	private Map<String, String> chatMap = new HashMap<String, String>();

	@PostConstruct
	public void initChatMap(){
		chatMap.put("bar", "柱状图");
		chatMap.put("chord", "和弦图");
		chatMap.put("circular", "关系图");
		chatMap.put("force", "力导向布局图");
		chatMap.put("funnel", "漏斗图");
		chatMap.put("gauge", "仪表盘");
		chatMap.put("line", "折线图");
		chatMap.put("pie", "饼状图");
		chatMap.put("radar", "雷达图");
		chatMap.put("scatter", "散点图");
		chatMap.put("map", "地图");
	}

	/**
	 * 
	 * @title: chart
	 * @description: 统计
	 * @param charttype
	 * @param request
	 * @return
	 * @return: String
	 */
	@RequestMapping("/chart/{charttype}")
	public String chart(@PathVariable("charttype") String charttype, HttpServletRequest request) {
		request.setAttribute("charttype", charttype);
		request.setAttribute("charttitle", chatMap.get(charttype));
		return display("echart");
	}
	
	/**
	 * chart Map
	 * @param charttype
	 * @param request
	 * @return
	 */
	@RequestMapping("/chartMap/{charttype}")
	public String chartMap(@PathVariable("charttype") String charttype, HttpServletRequest request){
		request.setAttribute("charttype", charttype);
		request.setAttribute("charttitle", chatMap.get(charttype));
		return display("echartMap");
	}
}
