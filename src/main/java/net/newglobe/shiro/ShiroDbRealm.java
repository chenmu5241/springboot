package net.newglobe.shiro;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.codec.Base64;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageHelper;

import net.newglobe.app.model.SysAccount;
import net.newglobe.app.model.SysPower;
import net.newglobe.app.model.SysRole;
import net.newglobe.app.service.SysAccountService;
import net.newglobe.app.service.SysPowerService;
import net.newglobe.app.service.SysRoleService;
import tk.mybatis.mapper.entity.Example;

public class ShiroDbRealm extends AuthorizingRealm {

	@Autowired
	private SysAccountService sysAccountService;
	@Autowired
	private SysRoleService roleService;
	@Autowired
	private SysPowerService powerService;

	/**
	 * 授权
	 * 
	 * 认证回调函数, 登录时调用.
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		SysAccount account = (SysAccount) principals.getPrimaryPrincipal();
		// 设置用户的角色和权限
		boolean flag = false;
		// 查询用户拥有的角色的权限
		List<SysRole> roles = roleService.getAccountRoles(account.getId());
		for (SysRole role : roles) {
			if (role.getId() == 1) {
				flag = true;
				break;
			}
		}
		List<SysPower> powers = null;
		if (flag) {// 如果是超级管理员
			// 查询超级管理员的所有菜单
			Example example = new Example(SysPower.class);
			example.setOrderByClause("layer_code asc");
			powers = powerService.selectListByExample(example);
		} else {
			PageHelper.orderBy("layer_code asc");
			// 查询用户拥有的角色的权限下，能看到的菜单
			powers = powerService.getAccountPowers(account.getId());
		}

		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		// 角色权限
		for (SysRole role : roles) {
			if (StringUtils.isNotBlank(role.getName())) {
				info.addRole(role.getName());
			}
		}
		// 权限
		for (SysPower power : powers) {
			if (StringUtils.isNotBlank(power.getFlag())) {
				info.addStringPermission(power.getFlag());
			}
		}
		return info;
	}

	/**
	 * 认证回调函数, 登录时调用.
	 */
	// realm的认证方法，从数据库查询用户信息
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		
		//对应前端js的base64位加密
		String decode ="";
		try {
			decode = java.net.URLDecoder.decode(new String(token.getPassword()), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		token.setPassword(Base64.decodeToString(decode).toCharArray());//设置原始密码
		
		// token是用户输入的用户名和密码
		// 第一步从token中取出用户名
		String inputUserName = (String) token.getPrincipal();
		SysAccount account = new SysAccount();
		account.setStatus(1);
		account.setUsername(inputUserName);
		SysAccount sysUser = sysAccountService.selectOne(account);
		if (sysUser == null) {
			return null;
		} 
		// 将activeUser设置simpleAuthenticationInfo
		return new SimpleAuthenticationInfo(sysUser, sysUser.getPassword(), ByteSource.Util.bytes(sysUser.getSalt()), sysUser.getUsername());
	}

	public static void main(String[] args) {
		// md5加密，加盐，一次散列
		String password_md5_sale_1 = new Md5Hash("123456", "f7702200f11bfb9c", 1).toString();
		//System.out.println(password_md5_sale_1);
	}

	// 清除缓存
	public void clearCached() {
		PrincipalCollection principals = SecurityUtils.getSubject().getPrincipals();
		super.clearCache(principals);
	}
	
	//@Operation(title="退出")
	@Override
	public void onLogout(PrincipalCollection principals) {
		super.onLogout(principals);
	}
	

}
