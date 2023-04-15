package com.yedam.mes.common.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.mes.common.mapper.CommonMapper;
import com.yedam.mes.common.service.CommonService;
@Service
public class CommonServiceImpl implements CommonService {

	@Autowired
	CommonMapper mapper;
}
