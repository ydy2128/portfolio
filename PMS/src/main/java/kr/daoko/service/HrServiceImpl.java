package kr.daoko.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.daoko.dao.HrDAO;
import kr.daoko.dto.HrDTO;

@Service
public class HrServiceImpl implements HrService {
	@Inject
	private HrDAO dao;
	
	// 로그인 처리
	@Override
	public HrDTO login(HrDTO dto) throws Exception {
		return dao.login(dto);
	}

	// 사용자 추가
	@Override
	public void addUser(HrDTO dto) throws Exception {
		dao.addUser(dto);
	}

	// 사용자 목록
	@Override
	public List<HrDTO> listUser() throws Exception {
		return dao.listUser();
	}

	// 사용자 정보
	@Override
	public HrDTO viewUser(String ssn) throws Exception {
		return dao.viewUser(ssn);
	}

	// 사용자 수정
	@Override
	public void modifyUser(HrDTO dto) throws Exception {
		dao.modifyUser(dto);
	}
}