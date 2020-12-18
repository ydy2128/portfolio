package kr.daoko.dao;

import java.util.HashMap;
import java.util.List;

import kr.daoko.dto.StatCorpDTO;
import kr.daoko.dto.StatPeriodDTO;
import kr.daoko.dto.StatDTO;

public interface StatDAO {
	// 회사별 전체 통계 조회
	public List<StatCorpDTO> listCorp() throws Exception;
	
	//연도별 통계 조회
	public List<StatPeriodDTO> listYear(HashMap<String, String> period) throws Exception;
	
	//월별 통계 조회
	public List<StatPeriodDTO> listMonth(HashMap<String, String> period) throws Exception;
	
	//일별 통계 조회
	public List<StatPeriodDTO> listDay(HashMap<String, String> period) throws Exception;
		
	//시간별 통계 조회
	public List<StatPeriodDTO> listTime(String period) throws Exception;
	
	//회사에 따른 사원 통게 조회
	public List<StatPeriodDTO> listHr(String corp) throws Exception;
	
	//사원에 따른 년도별 통계 조회
	public List<StatPeriodDTO> statYear(String ssn) throws Exception;
	
	//사원에 따른 월별 통계 조회
	public List<StatPeriodDTO> statMonth(String ssn) throws Exception;
	
	//사원에 따른 일별 통계 조회
	public List<StatPeriodDTO> statDay(String ssn) throws Exception;
		
	//사원에 따른 당일 통계 조회
	public List<StatPeriodDTO> statTime(String ssn) throws Exception;
	
	// 오늘 입/출차량 조회
	public StatDTO statToday() throws Exception;
}
