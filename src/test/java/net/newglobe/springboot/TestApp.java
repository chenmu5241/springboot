package net.newglobe.springboot;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import net.newglobe.service.SysRoleService;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestApp {
	@Autowired
	private SysRoleService sysRoleService;

	@Test
	public void contextLoads() {
		PageHelper.startPage(2, 10);
		System.out.println(JSON.toJSONString(sysRoleService.selectAll()));
//		sysRoleService.update();
//		System.out.println(sysRoleService.selectCount(null));
	}

}

