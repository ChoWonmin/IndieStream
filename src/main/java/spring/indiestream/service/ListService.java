package spring.indiestream.service;

import java.sql.SQLException;
import java.util.List;

import spring.indiestream.domain.SnsBoardVO;

public interface ListService {
	List<SnsBoardVO> selectFollowSnsBoard(String loginId, int page) throws SQLException;
}
