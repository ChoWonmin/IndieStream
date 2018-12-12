package spring.indiestream.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.indiestream.domain.GenreVO;

public interface GenreService {
	
	List<String> selectBymemberId(String memberId);
	
	void addGenre(GenreVO genre);
	
	void deleteGenre(String memberId);
}
