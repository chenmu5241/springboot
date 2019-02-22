package net.newglobe.springboot;

import org.apache.solr.client.solrj.SolrClient;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.test.context.junit4.SpringRunner;

import com.alibaba.fastjson.JSON;

import net.newglobe.model.SysAccount;
import net.newglobe.service.SysRoleService;
import net.newglobe.util.MailUtil;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestApp {

	@Autowired
	private SysRoleService sysRoleService;
	@Autowired
	private RedisTemplate<String, Object> redisTemplate;
	@Autowired
	private MailUtil mailUtil;
//	@Autowired
//	private SolrClient solr;;

	// ehcache测试
	@Test
	public void testEhcache() {
		// 第一次查询
		System.out.println(JSON.toJSONString(sysRoleService.getAccountRoles(1L)));
		// 第二次查询
		System.out.println(JSON.toJSONString(sysRoleService.getAccountRoles(1L)));
	}

	// redis测试
	@Test
	public void testRedis() {
		SysAccount sysAccount = new SysAccount();
		sysAccount.setUsername("root用户");
		this.redisTemplate.opsForValue().set("key", sysAccount);
		SysAccount object = (SysAccount) this.redisTemplate.opsForValue().get("key");
		System.out.println(JSON.toJSONString(object));
	}

	// 邮件测试
	@Test
	public void testEmail() {
		mailUtil.sendSms("462372228@qq.com", "我的163", "调试邮件功能");
	}
	
	//solr测试
	@Test
	public void testSolr() {
		
	}
}
