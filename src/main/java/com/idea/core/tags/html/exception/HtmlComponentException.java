package com.idea.core.tags.html.exception;

@SuppressWarnings("serial")
public class HtmlComponentException extends RuntimeException {

	public HtmlComponentException() {
		super();
	}

	public HtmlComponentException(String msg) {
		super(msg);
	}

	public HtmlComponentException(Exception exception) {
		 super(exception);
	}
}
