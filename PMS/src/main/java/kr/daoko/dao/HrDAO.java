package kr.daoko.dao;

import java.util.List;

import kr.daoko.dto.HrDTO;

public interface HrDAO {
	// 로그인 처리
	public HrDTO login(HrDTO dto) throws Exception;
	
	// 사용자 추가
	public void addUser(HrDTO dto) throws Exception;
	
	// 사용자 목록
	public List<HrDTO> listUser() throws Exception;
	
	// 사용자 정보
	public HrDTO viewUser(String ssn) throws Exception;
	
	// 사용자 수정
	public void modifyUser(HrDTO dto) throws Exception;
}
