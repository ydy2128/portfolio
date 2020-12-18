package kr.daoko.service;

import java.util.List;

import kr.daoko.dto.LogListDTO;

public interface LogService {
	// 濡쒓렇 議고쉶
	public List<LogListDTO> listLog() throws Exception;
	
	//주차된 차량 수
	public int countPark() throws Exception;
}
