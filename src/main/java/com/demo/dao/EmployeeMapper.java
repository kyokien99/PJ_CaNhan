package com.demo.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.demo.entity.Employee;
import com.demo.util.MyBatisUtil;

@Repository
public class EmployeeMapper {

	public void saveEmployee(Employee employee){
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		session.insert("insertEmployee", employee);
		session.commit();
		session.close();
	}
	
	public void updateEmployee(Employee employee){
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		session.update("updateEmployee", employee);
		session.commit();
		session.close();
	}
	
	public void deleteEmployee(int employeeId){
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		session.delete("deleteEmployee", employeeId);
		session.commit();
		session.close();
	}
	
	
	public Employee findById(int employeeId){
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		Employee employee = (Employee) session.selectOne("findById", employeeId);
		session.commit();
		session.close();
		return employee;
	}
	
	//search function
	public List<Employee> findAll(String txt){
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		@SuppressWarnings("unchecked")
		List<Employee> employeesList = session.selectList("findAll", txt);
		session.commit();
		session.close();
		return employeesList;
	}

	public List<Employee> getAllEmployees(){
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		@SuppressWarnings("unchecked")
		List<Employee> employeesList = session.selectList("getAllEmployees");
		session.commit();
		session.close();
		return employeesList;
	}
	
	public List<Employee> findEmployee(int startIndex) {
		Map<String, Object> parms = new HashMap<String, Object>();
		parms.put("startIndex", startIndex);
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		@SuppressWarnings("unchecked")
		List<Employee> employeeList = session.selectList("findEmployee", parms);
		session.commit();
		session.close();
		return employeeList;
	}

}