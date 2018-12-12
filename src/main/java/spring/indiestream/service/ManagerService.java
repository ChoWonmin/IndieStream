package spring.indiestream.service;


import spring.indiestream.dao.ManagerDAO;
import spring.indiestream.domain.ManagerVO;

public interface ManagerService {
	void setManagerDAO(ManagerDAO managerDAO);
	ManagerVO selectOneManager(ManagerVO managerVO);
	int insertOneManager(ManagerVO managerVO);
}
