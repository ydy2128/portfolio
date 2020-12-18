package kr.daoko.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.daoko.dto.NoticeDTO;
import kr.daoko.dto.Search;


@Repository
public class NoticeDAOImpl implements NoticeDAO {
	@Inject
	private SqlSession sql;
	
	// mapper
	private static String NAMESPACE = "kr.daoko.mapper.noticeMapper";

	@Override
	public List<NoticeDTO> listNotice(Search search) throws Exception {
		return sql.selectList(NAMESPACE + ".listNotice", search);
	}

	@Override
	public int noticeCnt(Search search) throws Exception {
		return sql.selectOne(NAMESPACE + ".noticeCnt", search);
	}

	@Override
	public NoticeDTO viewNotice(int idx) throws Exception {
		return sql.selectOne(NAMESPACE + ".viewNotice", idx);
	}

	@Override
	public void insertNotice(NoticeDTO dto) throws Exception {
		sql.insert(NAMESPACE + ".insertNotice", dto);
	}

	@Override
	public void hitUp(int idx) throws Exception {
		sql.update(NAMESPACE + ".hitUp", idx);
	}

	@Override
	public void modifyNotice(NoticeDTO dto) throws Exception {
		sql.update(NAMESPACE + ".modifyNotice", dto);
	}

	@Override
	public void removeNotice(int idx) throws Exception {
		sql.delete(NAMESPACE + ".removeNotice", idx);
	}

}
