package kr.daoko.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.daoko.dao.StatDAO;
import kr.daoko.dto.StatCorpDTO;
import kr.daoko.dto.StatPeriodDTO;
import kr.daoko.dto.StatDTO;

@Service
public class StatServiceImpl implements StatService {
	@Inject
	private StatDAO dao;
	
	// 회사별 전체 통계 조회
	@Override
	public List<StatCorpDTO> listCorp() throws Exception {
		return dao.listCorp();
	}

	@Override
	public List<StatPeriodDTO> listYear(HashMap<String, String> period) throws Exception {
		return dao.listYear(period);
	}

	@Override
	public List<StatPeriodDTO> listMonth(HashMap<String, String> period) throws Exception {
		return dao.listMonth(period);
	}

	@Override
	public List<StatPeriodDTO> listDay(HashMap<String, String> period) throws Exception {
		return dao.listDay(period);
	}

	@Override
	public List<StatPeriodDTO> listTime(String period) throws Exception {
		return dao.listTime(period);
	}

	@Override
	public List<StatPeriodDTO> listHr(String corp) throws Exception {
		return dao.listHr(corp);
	}

	@Override
	public List<StatPeriodDTO> statYear(String ssn) throws Exception {
		return dao.statYear(ssn);
	}

	@Override
	public List<StatPeriodDTO> statMonth(String ssn) throws Exception {
		return dao.statMonth(ssn);
	}

	@Override
	public List<StatPeriodDTO> statDay(String ssn) throws Exception {
		return dao.statDay(ssn);
	}

	@Override
	public List<StatPeriodDTO> statTime(String ssn) throws Exception {
		return dao.statTime(ssn);
	}

	@Override
	public StatDTO statToday() throws Exception {
		return dao.statToday();
	}
	
}
