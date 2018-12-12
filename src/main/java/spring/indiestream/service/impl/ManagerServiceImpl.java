package spring.indiestream.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.indiestream.dao.ManagerDAO;
import spring.indiestream.domain.ManagerVO;
import spring.indiestream.service.ManagerService;

@Service
public class ManagerServiceImpl implements ManagerService{
	@Autowired
	private ManagerDAO managerDAO;
	
	@Override
	public void setManagerDAO(ManagerDAO managerDAO) {
		this.managerDAO=managerDAO;
	}

	@Override
	public ManagerVO selectOneManager(ManagerVO managerVO) {
		return managerDAO.selectOneManager(managerVO);
	}

	@Override
	public int insertOneManager(ManagerVO managerVO) {
		return managerDAO.insertOneManager(managerVO);
	}

}
