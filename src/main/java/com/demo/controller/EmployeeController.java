package com.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;
import com.demo.dao.EmployeeMapper;
import com.demo.entity.Employee;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import com.demo.entity.TaiKhoan;
import request.EmployeeSave;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(ModelMap mm) {
		mm.put("tk", new TaiKhoan());
		return "login";
		}
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(@ModelAttribute(value="tk") TaiKhoan tk, Model model, HttpServletRequest request) {
		if(tk.getUsername().equals("trungkien") && tk.getPassword().equals("123456")) {
			HttpSession session=request.getSession();  
	        session.setAttribute("username",tk.getUsername());  
			return "redirect:/employee/listOfEmployee";
			}
			else {
				model.addAttribute("message", "ログインIDまたはパスワードが間違っています。");
				return "login";
			}
	}
	
    @RequestMapping(value="/logout",method = RequestMethod.GET)
    public String logout(HttpServletRequest request){
        HttpSession httpSession = request.getSession();
        httpSession.invalidate();
        return "redirect:/employee/login";
    }

	@Autowired
	EmployeeMapper employeeMapper;
	
	private static final String EMPLOYEE = "Employee";
	private static final String EMPLOYEELIST = "ListEmployees";
	
	//search
	@RequestMapping(value="/listOfEmployee/search")
	public String search(Model model, HttpSession session, @RequestParam("txt") String txt, HttpServletRequest request){
		Boolean isAuth = this.checkAuth(request);
		if (!isAuth) {
			return "redirect:/employee/login";
		}
		model.addAttribute("employeeList", employeeMapper.findAll(txt));
		return EMPLOYEELIST;
	}
	

	@RequestMapping(value="/listOfEmployee")
	public String showListOfEmployees(Model model, HttpSession session, @RequestParam(value = "page", required = false) String page, HttpServletRequest request){	
		Boolean isAuth = this.checkAuth(request);
		if (!isAuth) {
			return "redirect:/employee/login";
		}
		
		//pagination
		int limit = 5;
//		int nextPage = 0;
//		int prevPage = 0;	
		int currentPage = 1;	
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}		
		int startIndex = (currentPage - 1) * limit;
		
		//lấy số employee từ startIndex và limit giới hạn khoảng lấy
		List<Employee> employeeList = employeeMapper.findEmployee(startIndex);
		
		//lấy tổng số employee có trong db
		List<Employee> allOfEmployee = employeeMapper.getAllEmployees();
		//tính tổng số page từ db
		int totalEmployees = allOfEmployee.size();
		double totalPages = Math.ceil((double) totalEmployees/limit);
		
		model.addAttribute("employeeList", employeeList);
		model.addAttribute("startIndex", startIndex);
		model.addAttribute("limit", limit);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalEmployees", totalPages);
		model.addAttribute("totalPages", totalPages);
		
		return EMPLOYEELIST;
	}

	public Boolean checkAuth(HttpServletRequest request) {
		String username = (String)request.getSession().getAttribute("username");
        if(username!=null){  
        	return true;
        } 
        return false;
	}
	
	//show form add
	@RequestMapping("/displayAddForm")
	public String addEmployee(Model model, HttpServletRequest request, HttpSession session){
		Boolean isAuth = this.checkAuth(request);
		if (!isAuth) {
			return "redirect:/employee/login";
		}
		model.addAttribute("employee", new Employee());
		return "AddEmployee";
	}
	
	// process add
	@RequestMapping(value="/updateProcess", method = RequestMethod.POST)
	public String addEmployee(@ModelAttribute(value="emp") Employee emp,Employee employee, ModelMap mm, Model model, HttpServletRequest request, HttpSession session) {
		Boolean isAuth = this.checkAuth(request);
		if (!isAuth) {
			return "redirect:/employee/login";
		}
		EmployeeSave employeeValidate = new EmployeeSave();
		String message = employeeValidate.validation(emp, employee);
		if(!message.equalsIgnoreCase("")) {
			model.addAttribute("message", message);
		return "AddEmployee";
	}
		if (employee.getId() == 0){
			employeeMapper.saveEmployee(employee);
		} else {
			employeeMapper.updateEmployee(employee);
		}
		return "ConfirmAdd";
	}
	
	// view show confirm added
	@RequestMapping("/showconfirmupdate")
	public String showConfirmUpdate(@RequestParam("employeeId") int employeeId, Model model, HttpServletRequest request, HttpSession session){
		Boolean isAuth = this.checkAuth(request);
		if (!isAuth) {
			return "redirect:/employee/login";
		}
		model.addAttribute("employee", employeeMapper.findById(employeeId));
		return "showFormForUpdate";
	}
	
	//VIEW CONFIRM added
	@RequestMapping("/confirmadd")
	public String confirmAdd(Model model, HttpServletRequest request, HttpSession session){
		Boolean isAuth = this.checkAuth(request);
		if (!isAuth) {
			return "redirect:/employee/login";
		}
		model.addAttribute("employee", new Employee());
		return "ConfirmAdd";
	}
	
	//----------------------------------------------------
	//show form update
	@RequestMapping("/displayUpdateForm")
	public String showUpdateForm(@RequestParam("employeeId") int employeeId, Model model, HttpServletRequest request, HttpSession session){
		Boolean isAuth = this.checkAuth(request);
		if (!isAuth) {
			return "redirect:/employee/login";
		}
		model.addAttribute("employee", employeeMapper.findById(employeeId));
		return EMPLOYEE;
	}
	
	//process update
	@RequestMapping(value ="/saveProcess", method = RequestMethod.POST)
	public String updateEmployee(@ModelAttribute(value="emp") Employee emp,Employee employee, ModelMap mm, Model model, HttpServletRequest request, HttpSession session) {
		Boolean isAuth = this.checkAuth(request);
		if (!isAuth) {
			return "redirect:/employee/login";
		}
		EmployeeSave employeeValidate = new EmployeeSave();
		String message = employeeValidate.validation(emp, employee);
		if(!message.equalsIgnoreCase("")) {
			model.addAttribute("message", message);
			return EMPLOYEE;
		}	
		if (employee.getId() == 0){
			employeeMapper.saveEmployee(employee);
		} else {
			employeeMapper.updateEmployee(employee);
		}
		return "ConfirmUpdate";
	}
	
	// view show confirm updated
	@RequestMapping("/showconfirmadd")
	public String showConfirmAdd(@RequestParam("employeeId") int employeeId, @RequestParam("action") String action, Model model,HttpSession session, HttpServletRequest request){
		Boolean isAuth = this.checkAuth(request);
		if (!isAuth) {
			return "redirect:/employee/login";
		}
		model.addAttribute("employee", employeeMapper.findById(employeeId));
		
		String confirmAction = "saveProcess";
		if (action.equalsIgnoreCase("delete")) {
			confirmAction = "showconfirmdelete?employeeId=" + employeeId;
		}
		
		model.addAttribute("confirmAction", confirmAction);
		return "ShowConfirmAdd";
	}
	
	//VIEW CONFIRM UPDATED
	@RequestMapping("/confirmupdate")
	public String confirmUpdate(Model model, HttpServletRequest request, HttpSession session){
		Boolean isAuth = this.checkAuth(request);
		if (!isAuth) {
			return "redirect:/employee/login";
		}
		model.addAttribute("employee", new Employee());
		return "ConfirmUpdate";
	}
	//------------------------
	
	@RequestMapping("/confirmdelete")
	public String confirmDelete(Model model, HttpServletRequest request, HttpSession session){
		Boolean isAuth = this.checkAuth(request);
		if (!isAuth) {
			return "redirect:/employee/login";
		}
		model.addAttribute("employee", new Employee());
		return "ConfirmDel";
	}

	@RequestMapping("/showconfirmdelete")
	public String deleteEmployee(@RequestParam("employeeId") int employeeId, HttpServletRequest request, HttpSession session){
		Boolean isAuth = this.checkAuth(request);
		if (!isAuth) {
			return "redirect:/employee/login";
		}
		employeeMapper.deleteEmployee(employeeId);
		return "ConfirmDel";
	}
	
}

