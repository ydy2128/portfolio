package kr.daoko.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.daoko.dao.LogDAO;
import kr.daoko.dto.LogListDTO;

@Service
public class LogServiceImpl implements LogService {
	@Inject
	private LogDAO dao;

	// 로그 조회
	@Override
	public List<LogListDTO> listLog() throws Exception {
		return dao.listLog();
	}

	@Override
	public int countPark() throws Exception {
		return dao.countPark();
	}
}