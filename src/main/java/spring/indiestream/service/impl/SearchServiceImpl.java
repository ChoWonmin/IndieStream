package spring.indiestream.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.indiestream.dao.FollowDAO;
import spring.indiestream.dao.ImageDAO;
import spring.indiestream.dao.MemberDAO;
import spring.indiestream.dao.SearchDAO;
import spring.indiestream.domain.HashtagVO;
import spring.indiestream.domain.MemberVO;
import spring.indiestream.domain.SearchVO;
import spring.indiestream.domain.SnsBoardVO;
import spring.indiestream.domain.SoundBoardVO;
import spring.indiestream.domain.message.MemberMessageRoomVO;
import spring.indiestream.service.MessageService;
import spring.indiestream.service.SearchService;

@Service
public class SearchServiceImpl implements SearchService{
	@Autowired
	private SearchDAO searchDAO;
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private FollowDAO followDAO;
	@Autowired
	private ImageDAO imageDAO;
	
	@Autowired
	private MessageService messageService;
	
	@Override
	public void SearchDAO(SearchDAO searchDAO) {
		this.searchDAO=searchDAO;
	}

	@Override
	public List<SnsBoardVO> snsBoardWriterSearchSelect(String search) {
		return searchDAO.snsBoardWriterSearchSelect(search);
	}

	@Override
	public List<SnsBoardVO> snsBoardContentSearchSelect(String search) {
		List<SnsBoardVO> list = searchDAO.snsBoardContentSearchSelect(search);
		for(SnsBoardVO vo:list){
			vo.setImageList(imageDAO.imageSelectAll(vo.getSnsBoardNo()+""));
		}		
		return list;
	}

	//수정 artist
	@Override
	public List<MemberVO> soundBoardWriterSearchSelect(String search) {
		return searchDAO.soundBoardWriterSearchSelect(search);
	}

	@Override
	public List<SoundBoardVO> soundBoardContentSearchSelect(String search) {
		return searchDAO.soundBoardContentSearchSelect(search);
	}

	@Override
	public List<SoundBoardVO> soundBoardTitleSearchSelect(String search) {
		return searchDAO.soundBoardTitleSearchSelect(search);
	}

	@Override
	public List<HashtagVO> hashtagSnsSearchSelect(String search) {
		return searchDAO.hashtagSnsSearchSelect(search);
	}

	@Override
	public List<HashtagVO> hashtagSoundSearchSelect(String search) {
		return searchDAO.hashtagSoundSearchSelect(search);
	}
	
	@Override
	public List<SearchVO> totalSearch(String search) {
		List<SearchVO> totalSearchList = new ArrayList<SearchVO>();
		
		List<SnsBoardVO> snsBoardWriterList=snsBoardWriterSearchSelect(search);
		List<SnsBoardVO> snsBoardContentList=snsBoardContentSearchSelect(search);

		//수정 artist
		List<MemberVO> soundBoardWriterList=soundBoardWriterSearchSelect(search);
		List<SoundBoardVO> soundBoardContentList=soundBoardContentSearchSelect(search);
		List<SoundBoardVO> soundBoardTitleList=soundBoardTitleSearchSelect(search);
		
		List<HashtagVO> hashtagSnsList=hashtagSnsSearchSelect(search);

		List<HashtagVO> hashtagSoundList=hashtagSoundSearchSelect(search);

		totalSearchList.add(new SearchVO(snsBoardWriterList, null, null,null));
		totalSearchList.add(new SearchVO(snsBoardContentList, null, null ,null));
		totalSearchList.add(new SearchVO(null, null, null ,soundBoardWriterList));
		totalSearchList.add(new SearchVO(null, soundBoardTitleList, null ,null));
		totalSearchList.add(new SearchVO(null, soundBoardContentList, null, null));		
		totalSearchList.add(new SearchVO(null, null, hashtagSnsList, null));
		totalSearchList.add(new SearchVO(null, null, hashtagSoundList, null));

		return totalSearchList;
	}

	@Override
	public List<MemberVO> searchMemberById(String logindId, String search) throws SQLException {
		List<MemberVO> result = searchDAO.searchMemberById(search);
		
		for(int i=0;i<result.size();i++)
			if(result.get(i).getMemberId().equals(logindId))
				result.remove(result.get(i));
		
		return result;
	}
	
	@Override
	public List<MemberVO> searchFollowById(String logindId, String search) throws SQLException {
		List<MemberVO> followList = followDAO.selectFollowIdByMemberId(logindId);
		List<MemberVO> result = new ArrayList<MemberVO>();
		
		for(int i=0;i<followList.size();i++)
			if(followList.get(i).getMemberId().matches(".*"+search+".*"))
				result.add(followList.get(i));
		
		return result;
	}
	
	@Override
	public List<MemberMessageRoomVO> searchMessageRoom(String loginId, String search) throws SQLException {
		List<MemberMessageRoomVO> messageRoomList = messageService.selectMessageRoomById(loginId);
		List<MemberMessageRoomVO> result = new ArrayList<MemberMessageRoomVO>();
		
		
		for(MemberMessageRoomVO mmr:messageRoomList)
			for(MemberVO member:mmr.getMemberList())
				if(member.getMemberId().matches(".*"+search+".*"))
					result.add(mmr);
		
		return result;
	}
	
}
