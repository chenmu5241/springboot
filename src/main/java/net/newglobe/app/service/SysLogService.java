package net.newglobe.app.service;

import org.springframework.stereotype.Service;

import net.newglobe.app.dao.read.SysLogDao;
import net.newglobe.app.model.SysLog;
import net.newglobe.app.mybatis.BaseService;

@Service
public class SysLogService extends BaseService<SysLog, SysLogDao> {

}