package net.newglobe.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.StringRedisSerializer;

@Configuration
public class RedisConfig {
	/***
	 * 3.
	 * 
	 * 创建 RedisTemplate:用于执行 Redis 操作的方法
	 */
	@Bean
	public RedisTemplate<String, Object> redisTemplate(@Autowired RedisConnectionFactory factory) {
		
		RedisTemplate<String, Object> template = new RedisTemplate<>();
		//关联
		template.setConnectionFactory(factory);
		//为 key 设置序列化器
		template.setKeySerializer(new StringRedisSerializer());
		//为 value 设置序列化器
//		template.setValueSerializer(new JdkSerializationRedisSerializer());
		return template;
	}
}