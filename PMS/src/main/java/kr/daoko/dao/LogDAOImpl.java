package kr.daoko.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.daoko.dto.LogListDTO;

@Repository
public class LogDAOImpl implements LogDAO {
	@Inject
	private SqlSession sql;
	
	// mapper
	private static String NAMESPACE = "kr.daoko.mapper.logMapper";

	// 로그 조회
	@Override
	public List<LogListDTO> listLog() throws Exception {
		return sql.selectList(NAMESPACE + ".listlog");
	}

	@Override
	public int countPark() throws Exception {
		return sql.selectOne(NAMESPACE + ".countPark");
	}
}
