package com.sf.qzm.dto.admin;

import com.sf.qzm.dto.SfDto;

/**
 * 用户角色，中间表
 * @author Administrator
 */
public class UserToRoleDTO implements SfDto {
	private Integer id;
	private Integer userId;
	private Integer roleId;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	
}
