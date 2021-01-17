package web;

import lombok.*;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Getter 
@Setter
@ToString

public class Employee {
	
	private String empId;
	private String firstName;
	private String lastName;
	private String phoneNo;
	
	private void testLog() {
		log.debug( "Here I am!");
	}
	
	public static void main(String [] args) {
		Employee emp = new Employee();
		String empId = emp.getEmpId();
		String toStr = emp.toString();
		
		var out = System.out;
		out.println( "empId = " + empId );
		out.println( "emp   = " + toStr );
		
		emp.testLog();
	}

}
