package spring.indiestream.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.indiestream.dao.GenreDAO;
import spring.indiestream.domain.GenreVO;

@Repository
public class GenreDAOImpl implements GenreDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<String> selectBymemberId(String memberId) {
		return sqlSession.selectList("genreMapper.selectGenreByMemberId",memberId);
	}

	@Override
	public void addGenre(GenreVO genre) {
		sqlSession.insert("genreMapper.addGenre", genre);
	}

	@Override
	public void deleteGenre(String memberId) {
		sqlSession.delete("genreMapper.deleteGenre", memberId);
	}
	
}
