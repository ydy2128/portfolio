package kr.daoko.service;

import java.util.List;

import kr.daoko.dto.NoticeDTO;
import kr.daoko.dto.Search;

public interface NoticeService {
	
	//notice 조회
	public List<NoticeDTO> listNotice(Search search) throws Exception;
		
	//notice 개수 조회
	public int noticeCnt(Search search) throws Exception;
	
	//해당 notice 내용 조회
	public NoticeDTO viewNotice(int idx) throws Exception;
	
	// notice 작성
	public void insertNotice(NoticeDTO dto) throws Exception;
	
	//해당 notice 조회수 up
	public void hitUp(int idx) throws Exception;
	
	//해당 notice 수정
	public void modifyNotice(NoticeDTO dto) throws Exception;
	
	//해당 notice 삭제
	public void removeNotice(int idx) throws Exception;
}
