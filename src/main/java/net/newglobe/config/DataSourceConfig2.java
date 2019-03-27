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
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import tk.mybatis.spring.annotation.MapperScan;

@Configuration
@MapperScan(basePackages = "mapper", value = "net.newglobe.app.dao.write", sqlSessionTemplateRef = "sessionTemplate2")
public class DataSourceConfig2 {

	@Bean(name = "dataSource2")
	@Primary
	@ConfigurationProperties(prefix = "spring.datasource.source2")
	public DataSource dataSource2() {
		return DataSourceBuilder.create().build();
	}

	@Bean(name = "sessionFactory2")
	@Primary
	public SqlSessionFactory sessionFactory2(@Qualifier("dataSource2") DataSource dataSource) throws Exception {
		SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
		bean.setDataSource(dataSource);
		bean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:mapper/write/*.xml"));
		return bean.getObject();
	}

	@Bean(name = "transactionManager2")
	@Primary
	public DataSourceTransactionManager transactionManager2(@Qualifier("dataSource2") DataSource dataSource) {
		return new DataSourceTransactionManager(dataSource);
	}

	@Bean(name = "sessionTemplate2")
	@Primary
	public SqlSessionTemplate sessionTemplate2(@Qualifier("sessionFactory2") SqlSessionFactory sqlSessionFactory) {
		return new SqlSessionTemplate(sqlSessionFactory);
	}

}