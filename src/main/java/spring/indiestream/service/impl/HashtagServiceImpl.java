package spring.indiestream.service.impl;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.indiestream.dao.HashtagDAO;
import spring.indiestream.domain.HashtagVO;
import spring.indiestream.service.HashtagService;
@Service
public class HashtagServiceImpl implements HashtagService{
	@Autowired
	private HashtagDAO hashtagDAO;
	
	@Override
	public void setHashtagDAO(HashtagDAO hashtagDAO) {
		this.hashtagDAO=hashtagDAO;
	}

	@Override
	public int hashSnsInsert(HashtagVO hashtagVO) {
		System.out.println("HashtagServiceImpl에서 hashSnsInsert()호출...");
		
		String[] keywords=hashtagVO.getKeyword().split(" ");
		System.out.println("Sns태그 insert 기대값 : "+keywords.length);
		
		int result=0;
		for(int i=0;i<keywords.length;i++){
			HashtagVO hash = new HashtagVO();
			hash.setSnsBoardNo(hashtagVO.getSnsBoardNo());
			hash.setSnsWriter(hashtagVO.getSnsWriter());
			hash.setKeyword(keywords[i]);
			result+=hashtagDAO.hashSnsInsert(hash);
		}//for
		System.out.println("Sns태그 insert 결과값 : "+result);
		return result;
	}

	@Override
	public int hashSoundInsert(HashtagVO hashtagVO) {
		System.out.println("HashtagServiceImpl에서 hashSoundInsert()호출...");
		
		String[] keywords=hashtagVO.getKeyword().split(" ");	
		System.out.println("Sound태그 insert 기대값 : "+keywords.length);
		
		int result=0;
		for(int i=0;i<keywords.length;i++){
			HashtagVO hash = new HashtagVO();
			hash.setSoundBoardNo(hashtagVO.getSoundBoardNo());
			hash.setSoundWriter(hashtagVO.getSoundWriter());
			hash.setKeyword(keywords[i]);
			result+=hashtagDAO.hashSoundInsert(hash);
		}
		System.out.println("Sound태그 insert 결과값 : "+result);
		return result;
	}

	@Override
	public List<HashtagVO> hashSnsSelectFromOnePost(String no) {

		return hashtagDAO.hashSnsSelectFromOnePost(no);
	}

	@Override
	public int hashSnsDeleteFromOneBoard(HashtagVO hashtagVO) {
		System.out.println("HashtagServiceImpl에서 hashSnsDeleteFromOneBoard호출합니다...");
		int no = hashtagDAO.hashSnsDeleteFromOneBoard(hashtagVO);
		System.out.println("결과: "+no);
		return no;
	}

	@Override
	public int hashSoundDeleteFromOneBoard(HashtagVO hashtagVO) {
		return hashtagDAO.hashSoundDeleteFromOneBoard(hashtagVO);
	}

	@Override
	public List<HashtagVO> hashSoundSelectFromOnePost(String no) {
		return hashtagDAO.hashSoundSelectFromOnePost(no);
	}

	@Override
	public int hashSnsDeleteAllFromOneBoard(HashtagVO hashtagVO) {
		return hashtagDAO.hashSnsDeleteAllFromOneBoard(hashtagVO);
	}

	@Override
	public int hashSoundDeleteAllFromOneBoard(HashtagVO hashtagVO) {
		return hashtagDAO.hashSoundDeleteAllFromOneBoard(hashtagVO);
	}

	@Override
	public int snsBackUpHashtagInsert(HashtagVO hashtagVO) {
		return hashtagDAO.hashSnsInsert(hashtagVO);
	}

	@Override
	public int soundBackUpHashtagInsert(HashtagVO hashtagVO) {
		return hashtagDAO.hashSoundInsert(hashtagVO);
	}

	@Override
	public List<HashtagVO> hashtagCountSelect() {
		// TODO Auto-generated method stub
		return hashtagDAO.hashtagCountSelect();
	}

}
