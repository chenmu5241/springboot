package net.newglobe.service;

import org.springframework.stereotype.Service;

import net.newglobe.dao.read.SysLogDao;
import net.newglobe.model.SysLog;
import net.newglobe.mybatis.BaseService;

@Service
public class SysLogService extends BaseService<SysLog, SysLogDao> {

}