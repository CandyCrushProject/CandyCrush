package com.yedam.mes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MesController {

	private static final Logger logger = LoggerFactory.getLogger(MesController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@GetMapping("ProcManagement")
	public String ProcManagement() {
		return "admin/processMenu";
	}
	
	
	
	

	@GetMapping("dashboard")
	public String dashboard() {
		return "process/dashboard";
	}
	
	
	@GetMapping("ulElements")
	public String ulElements() {
		return "process/process";
	}

	@GetMapping("chart")
	public String chart() {
		return "process/chart";
	}
	
	@GetMapping("tabpnel")
	public String tabpnel() {
		return "process/tabpnel";
	}
	

	@GetMapping("table")
	public String table() {
		return "process/table";
	}


	@GetMapping("form")
	public String form() {
		return "process/form";
	}
	@GetMapping("empty")
	public String empty() {
		return "process/empty";
	}
}
