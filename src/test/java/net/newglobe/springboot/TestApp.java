package net.newglobe.springboot;

import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.response.UpdateResponse;
import org.apache.solr.common.SolrInputDocument;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.test.context.junit4.SpringRunner;

import com.alibaba.fastjson.JSON;

import net.newglobe.model.SysAccount;
import net.newglobe.rabbit.Sender;
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
	@Autowired
	private SolrClient solrClient;

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

	// solr测试
	@Test
	public void testSolr() {
		try {
			SolrInputDocument doc = new SolrInputDocument();
	        doc.setField("id", "nihao");
	        UpdateResponse add = solrClient.add(doc,1000);
	        solrClient.commit("gettingstarted");
//			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
//			SolrInputDocument doc = new SolrInputDocument();
//			doc.setField("id", uuid);
//			doc.setField("content_ik", "我是中国人, 我爱中国");
//			/*
//			 * 如果spring.data.solr.host 里面配置到 core了, 那么这里就不需要传 collection1 这个参数 下面都是一样的
//			 */
//			solrClient.add("gettingstarted", doc);
//			// client.commit();
//			solrClient.commit("gettingstarted");

//			SolrDocument document = solrClient.getById("hello");
//			System.out.println(document);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Autowired
	private Sender sender;
	@Test
	public void testRabbit() throws InterruptedException {
		while (true) {
			this.sender.send("你好，消息队列！");
			Thread.sleep(2000L);
		}
	}
}
