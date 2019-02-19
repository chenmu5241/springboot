package net.newglobe.service;

import org.springframework.stereotype.Service;

import net.newglobe.dao.read.SysOauthAccountDao;
import net.newglobe.model.SysOauthAccount;
import net.newglobe.mybatis.BaseService;

@Service
public class SysOauthAccountService extends BaseService<SysOauthAccount, SysOauthAccountDao> {
}