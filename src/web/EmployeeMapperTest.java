package web;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class EmployeeMapperTest {

	public static void main(String[] args) throws Exception {
		InputStream inputStream = Resources.getResourceAsStream( "mybatis-config.xml" );
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);		
		
		SqlSession session = sqlSessionFactory.openSession();
		
		EmployeeMapper mapper = session.getMapper(EmployeeMapper.class);
		
		Employee employee ;
		employee = new Employee();
		
		mapper.insert(employee);
		
		employee = mapper.selectOne(1);
		System.out.println(employee); 
		
		employee.setFirstName( "ABCDEF" );
		mapper.update(employee);
		
		employee = mapper.selectOne(12);
		mapper.delete(employee);
		
		List<Employee> employees = mapper.selectAll();
		
		for( Employee e : employees ) {
			System.out.println( e );
		} 
		
		session.commit();
	}

}
