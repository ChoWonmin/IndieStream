package spring.indiestream.dao;

import java.util.List;

import spring.indiestream.domain.SnsBoardVO;
import util.page.PageModel;

public interface ListDAO {
	List<SnsBoardVO> selectFollowSnsBoard (PageModel pageModel);
}
