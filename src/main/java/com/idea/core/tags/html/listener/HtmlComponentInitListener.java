package com.idea.core.tags.html.listener;

import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;

import com.idea.core.tags.html.manager.HtmlComponentManager;
import com.idea.core.utils.SpringContextHolder;

public class HtmlComponentInitListener implements ApplicationListener<ContextRefreshedEvent> {
	protected HtmlComponentManager htmlComponentManager = SpringContextHolder.getApplicationContext()
			.getBean(HtmlComponentManager.class);
	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		try {
			htmlComponentManager.init();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}