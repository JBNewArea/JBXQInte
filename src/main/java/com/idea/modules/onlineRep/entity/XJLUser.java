package com.idea.modules.onlineRep.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import com.idea.core.common.entity.DataEntity;

/**
 * 在线 - 用户信息
 * @author Arthur
 *
 */
@TableName("XJL_XZWEB_USER")
@SuppressWarnings("serial")
public class XJLUser  extends DataEntity<String> {

	/** 主键 */
	@TableId(value = "USER_ID", type = IdType.UUID)
	private String userId;
	/** 姓名 */
	@TableField(value = "USER_NAME")
	private String userName;
	/** 登录名 */
	@TableField(value = "LOGIN_NAME")
	private String loginName;
	/** 密码 */
	@TableField(value = "PWD")
	private String pwd;
	/**邮箱 */
	@TableField(value = "EMAIL")
	private String email;
	/**电话 */
	@TableField(value = "TELPHONE")
	private String telphone;
	/**身份证*/
	@TableField(value = "ID_CARD")
	private String idCard;
	/**实名认证状态*/
	@TableField(value = "STATUS")
	private String status;
	/**联系方式*/
	@TableField(value = "PHOTO")
	private String phone;
	/**自然人状态*/
	@TableField(value = "TYPE")
	private String type;
	/**联系地址*/
	@TableField(value = "ADDRESS")
	private String address;
	/**民族*/
	@TableField(value = "NATION")
	private String nation;
	/**激活类型*/
	@TableField(value = "ACTIVATE_TYPE")
	private String activateType;
	/**注册时间*/
	@TableField(value = "ADDTIME")
	private String addtime;
	/**删除标记*/
	@TableField(value = "DEL_FLAG")
	private String delFlag;
	@Override
	public String getId() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void setId(String id) {
		// TODO Auto-generated method stub
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelphone() {
		return telphone;
	}
	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getAddtime() {
		return addtime;
	}
	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	public String getActivateType() {
		return activateType;
	}
	public void setActivateType(String activateType) {
		this.activateType = activateType;
	}
	
}
