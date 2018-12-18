package cn.edu.neusoft.fawutong.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.neusoft.fawutong.domain.Delegate;
import cn.edu.neusoft.fawutong.domain.Order;
import cn.edu.neusoft.fawutong.domain.Users;
import cn.edu.neusoft.fawutong.mapper.UsersDao;
import cn.edu.neusoft.fawutong.service.UsersService;

@Service
public class UsersServiceImpl implements UsersService {

	@Autowired
	private UsersDao dao;
	
	@Override
	public Users getFindUsers(String id) {
		return dao.getfindUser(id);
	}

	@Override
	public List<Users> getAllLawyers() {
		return dao.getAllLawyers();
	}
	
	@Override
	public List<Users> getHot5Lawyers() {
		return dao.getHot5Lawyers();
	}

	@Override
	public List<Users> selectKeywordLawyers(String keyword) {
		return dao.selectKeywordLawyers(keyword);
	}

	@Override
	public Users getOneLawyer(int id) {
		return dao.getOneLawyer(id);
	}

	@Override
	public Integer selectIsUser(String uphone) {
		return dao.selectIsUser(uphone);
	}

	@Override
	public Users getLoginUser(Map userMap) {
		return dao.getLoginUser(userMap);
	}

	@Override
	public void addNewUsers(Users user) {
		// TODO Auto-generated method stub
		dao.addNewUser(user);
	}

	@Override
	public void updateUserOfUser(Users user) {
		// TODO Auto-generated method stub
		dao.updateUserOfUser(user);
	}
	
	@Override
	public Integer getMyCaseNum(String uid) {
		return dao.getMyCaseNum(uid);
	}

	@Override
	public Integer getMyOrderNum(String lid) {
		return dao.getMyOrderNum(lid);
	}

	@Override
	public Integer getMyLawyerNum(String uid) {
		return dao.getMyLawyerNum(uid);
	}

	@Override
	public List<Delegate> getAllDelegates() {
		return dao.getAllDelegates();
	}

	@Override
	public Integer getMyDelegateNum(String uid) {
		// TODO Auto-generated method stub
		return dao.getMyDelegateNum(uid);
	}

	@Override
	public void doDelegate(Order bean) {
		// TODO Auto-generated method stub
		dao.doDelegate(bean);
	}

	@Override
	public void updateDelegateStatusING(Map<String, Object> map) {
		// TODO Auto-generated method stub
		dao.updateDelegateStatusING(map);
	}

	@Override
	public Integer selectIsCollection(Map map) {
		// TODO Auto-generated method stub
		return dao.selectIsCollection(map);
	}

	@Override
	public void addCollection(Map map) {
		// TODO Auto-generated method stub
		dao.addCollection(map);
	}

	@Override
	public List<Users> getAllMyLawyers(String string) {
		// TODO Auto-generated method stub
		return dao.getAllMyLawyers(string);
	}

	@Override
	public void doNotCollecte(Map<String, Object> map) {
		// TODO Auto-generated method stub
		dao.doNotCollecte(map);
	}

	@Override
	public List<Delegate> getAllMyDelegates(String uid) {
		// TODO Auto-generated method stub
		return dao.getAllMyDelegates(uid);
	}

	@Override
	public List<Delegate> getAllLawDelegates(String lid) {
		// TODO Auto-generated method stub
		return dao.getAllLawDelegates(lid);
	}

	@Override
	public void delOrderInfo(String did) {
		// TODO Auto-generated method stub
		dao.delOrderInfo(did);
	}

	@Override
	public Integer getOrderOfDidNum(String did) {
		// TODO Auto-generated method stub
		return dao.getOrderOfDidNum(did);
	}

	@Override
	public void updateUserMoney(Map map) {
		// TODO Auto-generated method stub
		dao.updateUserMoney(map);
	}

	@Override
	public Users getFindOrderLawUser(String did) {
		// TODO Auto-generated method stub
		return dao.getFindOrderLawUser(did);
	}

	@Override
	public Users getFindOrderNomalUser(String did) {
		// TODO Auto-generated method stub
		return dao.getFindOrderNomalUser(did);
	}

	@Override
	public Users getFindDelegateNomalUser(String did) {
		// TODO Auto-generated method stub
		return dao.getFindDelegateNomalUser(did);
	}

	@Override
	public Integer selectMaxUserId() {
		// TODO Auto-generated method stub
		return dao.selectMaxUserId();
	}
	@Override
	public String selectlaweremail(int uid) {
		return dao.selectlaweremail(uid);
	}

	
}
