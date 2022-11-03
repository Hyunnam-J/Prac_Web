package practice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import join.DepartmentDTO;
import join.JobDTO;

@Service
public class PracServiceImpl {
	@Autowired private PracDAO dao;
	
	public List<JobDTO> test8() {
		return dao.select_jobs();
	}
	
	public List<DepartmentDTO> test9() {
		return dao.select_departments();
	}

}
