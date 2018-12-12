package spring.indiestream.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.indiestream.domain.MusicListVO;

public interface MusicListDAO {

	void setSqlSession(SqlSession sqlSession);
	
	void insertMusicList(MusicListVO musicListVO) throws SQLException;
	void deleteMusicList(MusicListVO musicListVO) throws SQLException;
	void updateListName(MusicListVO musicListVO) throws SQLException;
	List<MusicListVO> selectMusicListById(MusicListVO musicListVO) throws SQLException;
	
}
