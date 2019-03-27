package net.newglobe.app.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.newglobe.app.dao.read.SettingsConfigDao;
import net.newglobe.app.model.SettingsConfig;
import net.newglobe.app.mybatis.BaseService;

@Service
public class SettingsConfigService extends BaseService<SettingsConfig, SettingsConfigDao> {

	@Autowired
	SettingsConfigDao settingsConfigDao;

	public Map<String, String> getAllProperties() {
		Map<String, String> configMap = new HashMap<String, String>();
		SettingsConfig tpmConfig;
		List<SettingsConfig> configList = new ArrayList<SettingsConfig>();
		configList = settingsConfigDao.selectAll();
		if (configList != null) {
			for (int i = configList.size() - 1; i >= 0; i--) {
				tpmConfig = new SettingsConfig();
				tpmConfig = configList.get(i);
				configMap.put(tpmConfig.getKeyName().trim(), tpmConfig.getKeyValue().trim());
			}
		}
		return configMap;
	}

}
