package kr.daoko.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.daoko.dto.HrDTO;

@Repository
public class HrDAOImpl implements HrDAO {
	@Inject
	private SqlSession sql;
	
	// mapper
	private static String NAMESPACE = "kr.daoko.mapper.hrMapper";

	// 로그인 처리
	@Override
	public HrDTO login(HrDTO dto) throws Exception {
		return sql.selectOne(NAMESPACE + ".loginCheck", dto);
	}
	
	// 사용자 추가
	@Override
	public void addUser(HrDTO dto) throws Exception {
		sql.insert(NAMESPACE + ".adduser", dto);
	}

	// 사용자 목록
	@Override
	public List<HrDTO> listUser() throws Exception {
		return sql.selectList(NAMESPACE + ".listuser");
	}

	// 사용자 정보
	@Override
	public HrDTO viewUser(String ssn) throws Exception {
		return sql.selectOne(NAMESPACE + ".viewuser", ssn);
	}

	// 사용자 수정
	@Override
	public void modifyUser(HrDTO dto) throws Exception {
		sql.update(NAMESPACE + ".modifyuser", dto);
	}
}