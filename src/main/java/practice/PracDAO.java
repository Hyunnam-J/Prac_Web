package practice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import join.DepartmentDTO;
import join.JobDTO;

@Repository
public class PracDAO {
	@Autowired @Qualifier("hr") private SqlSession sql;
	
	public List<JobDTO> select_jobs() {
		return sql.selectList("hr.select_jobs");
	}
	public List<DepartmentDTO> select_departments() {
		return sql.selectList("hr.select_departments");
	}

}
