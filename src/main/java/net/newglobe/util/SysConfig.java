package net.newglobe.util;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import net.newglobe.service.SettingsConfigService;

@Component
public class SysConfig {
	private Logger logger = LoggerFactory.getLogger(SysConfig.class);
	

	@Autowired
	SettingsConfigService settingsConfigService;

	private Map<String, String> configMap;

	// 用戶是否认证
	private static String AUTH_ENABLE = "auth.enable";
	private static String UPLOAD_PATH = "upload.path";
	private static String UPLOAD_SHOW = "upload.show";
	private static String UPLOAD_PROJECT_ROOT = "upload.project.root";
	private static String CUSTOMER_SCALE_SHOW = "customer.scale.show";
	private static String REST_SERVICE_URL = "rest.service.url";
	private static String UPLOAD_PATH_LOCAL = "upload.path.local";
	private static String UPLOAD_SHOW_LOCAL = "upload.show.local";
	private static String UPLOAD_PROJECT_ROOT_LOCAL = "upload.project.root.local";
	private static String CRM_PLATFORM_CODE = "platform.code";
	public static String REST_SERVICE_UPDATETIME = "rest.service.updatetime";
	
	//个推
	private static String APP_ID ="push.appId";
	private static String APP_KEY = "push.appKey";
	private static String MASTER_SECRET = "push.masterSecret";
	private static String PUSH_URL = "push.pushUrl";
	
	@Value("jdbc.testSql")
	private String testSql;
	
	
	//邮件发送服务器
	@Value("${mail.account}")
	private String mailAccount;
	@Value("${mail.password}")
	private String mailPassword;
	@Value("${mail.smtp}")
	private String mailSmtp;

	/**
	 * 初始化，或者更新配置参数
	 */
	@PostConstruct
	public void initConfig() {
		logger.info("通过init方法初始化各种配置参数");
		configMap = new HashMap<String, String>();
		configMap = settingsConfigService.getAllProperties();
	}

	public void updateConfig() {
		logger.info("更新配置参数");
		configMap.clear();
		configMap = settingsConfigService.getAllProperties();
	}

	public void removeData() {
		logger.info("删除各种配置参数");
		configMap.clear();
	}

	// 登录是否需要验证，
	public String getAuthEnable() {
		return configMap.get(AUTH_ENABLE);
	}

	// 图片上传的路径
	public String getMdmUploadPath() {
		return configMap.get(UPLOAD_PATH);
	}

	// 图片显示的路径
	public String getMdmUploadShow() {
		return configMap.get(UPLOAD_SHOW);
	}

	// 图片上传项目的根目录
	public String getMdmUploadProjectRoot() {
		return configMap.get(UPLOAD_PROJECT_ROOT);
	}

	// 用户等级，页面是否显示
	public String getCustomerScaleShow() {
		return configMap.get(CUSTOMER_SCALE_SHOW);
	}

	public String getRestServiceUrl() {
		return configMap.get(REST_SERVICE_URL);
	}

	public String getMdmUploadPathLocal() {
		return configMap.get(UPLOAD_PATH_LOCAL);
	}

	public String getMdmUploadShowLocal() {
		return configMap.get(UPLOAD_SHOW_LOCAL);
	}

	public String getMdmUploadProjectRootLocal() {
		return configMap.get(UPLOAD_PROJECT_ROOT_LOCAL);
	}
	
	public String getCrmPlatformCode() {
		return configMap.get(CRM_PLATFORM_CODE);
	}
	
	public String getRestServiceUpdatetime() {
		return configMap.get(REST_SERVICE_UPDATETIME);
	}
	
	public String getAppId() {
		return configMap.get(APP_ID);
	}

	public String getAppKey() {
		return configMap.get(APP_KEY);
	}

	public String getMasterSecret() {
		return configMap.get(MASTER_SECRET);
	}

	public String getPushUrl() {
		return configMap.get(PUSH_URL);
	}

	public String getTestSql() {
		return testSql;
	}

	public void setTestSql(String testSql) {
		this.testSql = testSql;
	}
	
	
	public String getMailAccount() {
		return mailAccount;
	}

	public String getMailPassword() {
		return mailPassword;
	}

	public String getMailSmtp() {
		return mailSmtp;
	}

}
