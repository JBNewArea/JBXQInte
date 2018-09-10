package com.idea.modules.supervise.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import com.idea.core.common.entity.DataEntity;
/**
 * 舆情信息
 * @author Arthur
 *
 */
@TableName("xjl_issue_info")
@SuppressWarnings("serial")
public class Supervise extends DataEntity<String> {

	/** 主键 */
	 @TableId(value = "id", type = IdType.UUID)
	 private String id;
	/** 标题 */
	 @TableField(value = "title")
	 private String title;
	 /** 键值名称 */
	 @TableField(value = "type")
	 private String type;
	 /** 内容描述*/
	 @TableField(value = "describe_content")
	 private String describeContent;
	 /**发行人*/
	 @TableField(value = "publisher")
	 private String publisher;
	 /** 数据状态*/
	 @TableField(value = "status")
	 private String status;
	 /**审核人*/
	 @TableField(value = "verifier")
	 private String verifier;
	
	
	 /**点击*/
	 @TableField(value = "clicklike")
	 private String clicklike;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDescribeContent() {
		return describeContent;
	}
	public void setDescribeContent(String describeContent) {
		this.describeContent = describeContent;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getVerifier() {
		return verifier;
	}
	public void setVerifier(String verifier) {
		this.verifier = verifier;
	}
	
	public String getClicklike() {
		return clicklike;
	}
	public void setClicklike(String clicklike) {
		this.clicklike = clicklike;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
}
