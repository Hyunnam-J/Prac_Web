package cus;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class CusDAO implements CusService{
	@Autowired @Qualifier("hanul") SqlSession sql;

	@Override
	public List<CustomerVO> cus_list() {
		return sql.selectList("cus.list");
	}

}
