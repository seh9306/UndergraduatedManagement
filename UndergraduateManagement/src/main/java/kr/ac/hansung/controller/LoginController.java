package kr.ac.hansung.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

	@RequestMapping(value = "/login")
	public String showLogin(
			@RequestParam(value="error", required=false ) String error,
			@RequestParam(value="logout", required=false ) String logout,
			Model model) {
		
		if(error != null){
			model.addAttribute("errorMsg","유효하지 않은 아이디와 비밀번호 입니다.");
		}
		
		if(logout != null){
			model.addAttribute("logoutMsg","로그아웃 되었습니다.");
		}
		
		return "login";
	}
	
}
