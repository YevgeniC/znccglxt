package se.zust.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ssm")
public class UserController {
	Logger logger = LoggerFactory.getLogger(UserController.class);

  	//进入管理员主页
  	@RequestMapping(value="/adhome")
    public String adhome(){
    	return "znccglpt";
    }

}
