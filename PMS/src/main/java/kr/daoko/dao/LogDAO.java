package kr.daoko.dao;

import java.util.List;

import kr.daoko.dto.LogListDTO;

public interface LogDAO {
	// 로그 조회
	public List<LogListDTO> listLog() throws Exception;
	
	//������ ���� ��
	public int countPark() throws Exception;
}
