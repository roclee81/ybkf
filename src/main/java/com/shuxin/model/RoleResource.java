package com.shuxin.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import com.shuxin.commons.utils.JsonUtils;

/**
 *
 * 角色资源
 *
 */
@TableName("t_role_menu")
public class RoleResource implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 主键id */
	@TableId(type = IdType.UUID)
	private String id;

	/** 角色id */
	@TableField(value = "role_id")
	private String roleId;

	/** 资源id */
	@TableField(value = "menu_id")
	private String resourceId;


	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRoleId() {
		return this.roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getResourceId() {
		return this.resourceId;
	}

	public void setResourceId(String resourceId) {
		this.resourceId = resourceId;
	}

	@Override
	public String toString() {
		return JsonUtils.toJson(this);
	}
}
