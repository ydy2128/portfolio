package kr.daoko.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.daoko.dto.StatCorpDTO;
import kr.daoko.dto.StatPeriodDTO;
import kr.daoko.dto.StatDTO;

@Repository
public class StatDAOImpl implements StatDAO {
	@Inject
	private SqlSession sql;
	
	// mapper
	private static String NAMESPACE = "kr.daoko.mapper.statMapper";

	// 회사별 전체 통계 조회
	@Override
	public List<StatCorpDTO> listCorp() throws Exception {
		return sql.selectList(NAMESPACE + ".listcorp");
	}

	@Override
	public List<StatPeriodDTO> listYear(HashMap<String, String> period) throws Exception {
		return sql.selectList(NAMESPACE + ".listYear", period);
	}

	@Override
	public List<StatPeriodDTO> listMonth(HashMap<String, String> period) throws Exception {
		return sql.selectList(NAMESPACE + ".listMonth", period);
	}

	@Override
	public List<StatPeriodDTO> listDay(HashMap<String, String> period) throws Exception {
		return sql.selectList(NAMESPACE + ".listDay", period);
	}

	@Override
	public List<StatPeriodDTO> listTime(String period) throws Exception {
		return sql.selectList(NAMESPACE + ".listTime", period);
	}

	@Override
	public List<StatPeriodDTO> listHr(String corp) throws Exception {
		return sql.selectList(NAMESPACE + ".listHr", corp);
	}

	@Override
	public List<StatPeriodDTO> statYear(String ssn) throws Exception {
		return sql.selectList(NAMESPACE + ".statYear", ssn);
	}

	@Override
	public List<StatPeriodDTO> statMonth(String ssn) throws Exception {
		return sql.selectList(NAMESPACE + ".statMonth", ssn);
	}

	@Override
	public List<StatPeriodDTO> statDay(String ssn) throws Exception {
		return sql.selectList(NAMESPACE + ".statDay", ssn);
	}

	@Override
	public List<StatPeriodDTO> statTime(String ssn) throws Exception {
		return sql.selectList(NAMESPACE + ".statTime", ssn);
	}

	@Override
	public StatDTO statToday() throws Exception {
		return sql.selectOne(NAMESPACE + ".statToday");
	}
	
}
