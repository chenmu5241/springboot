package net.newglobe.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import tk.mybatis.spring.annotation.MapperScan;

@Configuration
@MapperScan(basePackages = "mapper", value = "net.newglobe.app.dao.read", sqlSessionTemplateRef = "sessionTemplate1")
public class DataSourceConfig1 {

	@Bean(name = "dataSource1")
	@ConfigurationProperties(prefix = "spring.datasource.source1")
	public DataSource dataSource1() {
		return DataSourceBuilder.create().build();
	}

	@Bean(name = "sessionFactory1")
	public SqlSessionFactory sessionFactory1(@Qualifier("dataSource1") DataSource dataSource) throws Exception {
		SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
		bean.setDataSource(dataSource);
		bean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:mapper/read/*.xml"));
		return bean.getObject();
	}

	@Bean(name = "transactionManager1")
	public DataSourceTransactionManager transactionManager1(@Qualifier("dataSource1") DataSource dataSource) {
		return new DataSourceTransactionManager(dataSource);
	}

	@Bean(name = "sessionTemplate1")
	public SqlSessionTemplate sessionTemplate1(@Qualifier("sessionFactory1") SqlSessionFactory sqlSessionFactory) {
		return new SqlSessionTemplate(sqlSessionFactory);
	}

}