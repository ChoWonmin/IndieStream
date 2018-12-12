package spring.indiestream.service;

import java.sql.SQLException;
import java.util.List;

import spring.indiestream.dao.SearchDAO;
import spring.indiestream.domain.HashtagVO;
import spring.indiestream.domain.MemberVO;
import spring.indiestream.domain.SearchVO;
import spring.indiestream.domain.SnsBoardVO;
import spring.indiestream.domain.SoundBoardVO;
import spring.indiestream.domain.message.MemberMessageRoomVO;
import spring.indiestream.domain.message.MessageRoomVO;

public interface SearchService {

	public void SearchDAO(SearchDAO searchDAO);
	public List<SnsBoardVO> snsBoardWriterSearchSelect(String search);
	public List<SnsBoardVO> snsBoardContentSearchSelect(String search);
	//수정 artist
	public List<MemberVO> soundBoardWriterSearchSelect(String search);
	public List<SoundBoardVO> soundBoardContentSearchSelect(String search);
	public List<SoundBoardVO> soundBoardTitleSearchSelect(String search);
	public List<HashtagVO> hashtagSnsSearchSelect(String search);
	public List<HashtagVO> hashtagSoundSearchSelect(String search);
	//public Map<String, List> totalSearch(String search);
	public List<SearchVO> totalSearch(String search);
	
	List<MemberVO> searchMemberById(String logindId, String search) throws SQLException;
	List<MemberVO> searchFollowById(String logindId, String search) throws SQLException;
	List<MemberMessageRoomVO> searchMessageRoom(String logindId, String search) throws SQLException;
}
