package org.zerock.wecart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.wecart.domain.UserVO;
import org.zerock.wecart.domain.user.LoginDTO;
import org.zerock.wecart.domain.user.UserDTO;
import org.zerock.wecart.exception.ControllerException;
import org.zerock.wecart.service.mypage.edit.EditService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@AllArgsConstructor

@RequestMapping("/mypage/edit")
@Controller
public class MypageEditController {

	private EditService service;

	// 비밀번호 확인
	@PostMapping("/checkUser")
	public String checkUser(LoginDTO dto, RedirectAttributes rttrs, Model model) throws ControllerException {
		try {
			UserVO vo = this.service.checkUser(dto);
			log.trace("vo: {}", vo);
			
			if (vo != null) {
				model.addAttribute("__CHECK__", vo);

				return "redirect:/mypage/edit/account";
			} else {
				rttrs.addAttribute("result", "check Failed");
				
				return null;
			} // if - else
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try-catch
	} // checkUser
	
	// 비밀번호 확인 화면
	@GetMapping("checkUser")
	public void checkUser() {
		;;
	} // checkUser - view

	// 닉네임 변경
	@PostMapping("/chagneAli")
	public String changeAli(UserDTO dto) throws ControllerException {
		try {
			boolean result = this.service.changeAli(dto);
			log.trace("result: {}", result);

			return "redirect:/mypage/edit/account";
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try-catch
	} // checkPw
	
	// 비밀번호 변경
	@PostMapping("/changePw")
	public String changePw(UserDTO dto) throws ControllerException {
		try {
			boolean result = this.service.changePw(dto);
			log.trace("result: {}", result);

			return "redirect:/mypage/edit/account";
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try-catch
	} // changePw
	
	// 비밀번호 변경 화면
	@GetMapping("changePw")
	public void changePw() {
		;;
	} // changePw - view

	// 이메일 변경
	@PostMapping("/changeEmail")
	public String changeEmail(UserDTO dto) throws ControllerException {
		try {
			boolean result = this.service.changeEmail(dto);
			log.trace("result: {}", result);

			return "redirect:/mypage/edit/account";
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try-catch
	} // changeEmail
	
	// 휴대전화 인증
//	public String authMobileNum(UserDTO dto) throws ControllerException {
//		try {
//			boolean result = this.service.authMobileNum(dto);
//			log.trace("result: {}", result);
//
//			return "redirect:/edit/account";
//	} // authMobileNum
	
	@GetMapping("withdrawal")
	public void withdrawal() {
		;;
	} // withdrawal - view

	// 회원 탈퇴
//	@GetMapping("/withdrawal")
//	public String withdrawal(Integer member_id) throws ControllerException {
//		try {
//			boolean result = this.service.withdrawal(member_id);
//			log.trace("result: {}", result);
//
//			return "redirect:/";
//		} catch (Exception e) {
//			throw new ControllerException(e);
//		} // try-catch
//	} // withdrawal

} // end class
