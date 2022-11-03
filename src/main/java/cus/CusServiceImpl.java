package cus;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CusServiceImpl implements CusService{
	@Autowired CusDAO dao;

	@Override
	public List<CustomerVO> cus_list() {
		return dao.cus_list();
	}

}
