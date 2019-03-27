package net.newglobe.app.service;

import org.springframework.stereotype.Service;

import net.newglobe.app.dao.read.SettingsDictDao;
import net.newglobe.app.model.SettingsDict;
import net.newglobe.app.mybatis.BaseService;
@Service
public class SettingsDictService extends BaseService<SettingsDict, SettingsDictDao>{
}