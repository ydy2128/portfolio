package kr.daoko.service;

import java.util.List;

import kr.daoko.dto.LogListDTO;

public interface LogService {
	// 로그 조회
	public List<LogListDTO> listLog() throws Exception;
	
	//������ ���� ��
	public int countPark() throws Exception;
}
