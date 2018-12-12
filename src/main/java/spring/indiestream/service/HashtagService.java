package spring.indiestream.service;

import java.util.List;

import spring.indiestream.dao.HashtagDAO;
import spring.indiestream.domain.HashtagVO;

public interface HashtagService {
	
	public void setHashtagDAO(HashtagDAO hashtagDAO);
	public int hashSnsInsert(HashtagVO hashtagVO);
	public int hashSoundInsert(HashtagVO hashtagVO);
	public List<HashtagVO> hashSnsSelectFromOnePost(String no);
	public int hashSnsDeleteFromOneBoard(HashtagVO hashtagVO);
	public int hashSoundDeleteFromOneBoard(HashtagVO hashtagVO);
	public List<HashtagVO> hashSoundSelectFromOnePost(String no);
	public int hashSnsDeleteAllFromOneBoard(HashtagVO hashtagVO);
	public int hashSoundDeleteAllFromOneBoard(HashtagVO hashtagVO);
	public int snsBackUpHashtagInsert(HashtagVO hashtagVO);
	public int soundBackUpHashtagInsert(HashtagVO hashtagVO);
	public List<HashtagVO> hashtagCountSelect();
}
