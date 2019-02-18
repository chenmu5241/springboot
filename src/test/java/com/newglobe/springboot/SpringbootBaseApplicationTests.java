package com.newglobe.springboot;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.alibaba.fastjson.JSON;
import com.newglobe.service.SysRoleService;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SpringbootBaseApplicationTests {
	@Autowired
	private SysRoleService sysRoleService;

	@Test
	public void contextLoads() {
		System.out.println(JSON.toJSONString(sysRoleService.selectList()));
		sysRoleService.update();
		System.out.println(sysRoleService.selectCount(null));
	}

}

