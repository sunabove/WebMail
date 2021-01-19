package web;

import java.util.List;

import org.apache.ibatis.annotations.*;

@Mapper
public interface EmployeeMapper  {
	@Select("SELECT * FROM employee WHERE id = #{id}")
	Employee selectOne(int id);

	@Select("SELECT * FROM employee")
	List<Employee> selectAll();

	@Insert("INSERT INTO employee( id, first_name, last_name, phone_no ) "
			+ " VALUES( #{id}, #{firstName}, #{lastName}, #{phoneNo} )")
	int insertEmployee(Employee employee);

	@Update("UPDATE employee SET first_name = #{firstName}, last_name = #{lastName}, phone_no = #{phoneNo} "
			+ " WHERE id = #{id} ")
	int updateEmployee(Employee employee);
	
	@Delete("DELETE FROM employee WHERE id = #{id} ")
	int deleteEmployee(Employee employee);

	// delete("deleteAuthor", 5)
	int deleteEmployee(int id);
}