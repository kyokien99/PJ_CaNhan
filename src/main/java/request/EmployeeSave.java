package request;

import com.demo.entity.Employee;

public class EmployeeSave {
	public String validation(Employee emp, Employee employee) {
		String message = "";
		String[] name;

		char kyTu;
	        int count = 0;
		    for (int i = 0; i < emp.getEmail().length(); i++) {
		        kyTu =  emp.getEmail().charAt(i);
		        if (Character.isSpaceChar(kyTu)) {
					count ++;
		        }
		    }
		
		

		if((emp.getFullname().length() > 25) || (emp.getFullname().trim() == null) || (emp.getFullname().length() < 5) || (emp.getEmail().length() > 25) || (emp.getEmail().length() < 8)) {
		    message = "The information you entered is incorrect. please re-enter";
		}
		
		return message;
		}
	
}

