package kr.daoko.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.daoko.dao.NoticeDAO;
import kr.daoko.dto.NoticeDTO;
import kr.daoko.dto.Search;


@Service
public class NoticeServiceImpl implements NoticeService {
	@Inject
	private NoticeDAO dao;

	@Override
	public List<NoticeDTO> listNotice(Search search) throws Exception {
		return dao.listNotice(search);
	}

	@Override
	public int noticeCnt(Search search) throws Exception {
		return dao.noticeCnt(search);
	}

	@Override
	public NoticeDTO viewNotice(int idx) throws Exception {
		return dao.viewNotice(idx);
	}

	@Override
	public void insertNotice(NoticeDTO dto) throws Exception {
		dao.insertNotice(dto);
	}

	@Override
	public void hitUp(int idx) throws Exception {
		dao.hitUp(idx);
	}

	@Override
	public void modifyNotice(NoticeDTO dto) throws Exception {
		dao.modifyNotice(dto);
	}

	@Override
	public void removeNotice(int idx) throws Exception {
		dao.removeNotice(idx);
	}

}