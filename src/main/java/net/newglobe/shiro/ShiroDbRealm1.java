package net.newglobe.shiro;

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
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.github.pagehelper.PageHelper;
import net.newglobe.model.SysAccount;
import net.newglobe.model.SysPower;
import net.newglobe.model.SysRole;
import net.newglobe.service.SysAccountService;
import net.newglobe.service.SysPowerService;
import net.newglobe.service.SysRoleService;
import net.newglobe.util.SysConfig;

import tk.mybatis.mapper.entity.Example;
/**
 * 
 * @author xiongyuankun
 *为了解决用户直接从数据库查询出user不用加密盐对比直接登录的问题
 */
@Component
public class ShiroDbRealm1 extends AuthorizingRealm {

	@Autowired
	private SysAccountService sysAccountService;
	@Autowired
	private SysRoleService roleService;
	@Autowired
	private SysPowerService powerService;
	@Autowired
	private SysConfig sysConfig;

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
		return new SimpleAuthenticationInfo(sysUser, sysUser.getPassword(), sysUser.getUsername());
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
