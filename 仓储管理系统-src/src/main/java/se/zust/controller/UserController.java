package se.zust.controller;

import se.zust.controller.UserController;
import se.zust.entity.User;
import se.zust.service.UserService;

import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/ssm")
//@Scope("prototype")
public class UserController {
	
	Logger logger = LoggerFactory.getLogger(UserController.class);
	@Autowired
	private UserService service;
 	
  	//首页
  	@RequestMapping(value="/index",method=RequestMethod.GET)
    public String index(){
    	return "智能仓储管理系统";
    }
  	@RequestMapping(value="/产品中心",method=RequestMethod.GET)
    public String production(){
    	return "产品中心";
    }
  	@RequestMapping(value="/账户开通",method=RequestMethod.GET)
    public String register(){
    	return "账户开通";
    }
  	//注册页面
    @RequestMapping(value="/账户开通2",method=RequestMethod.GET)
    public String register2(@ModelAttribute("user") User user){
    	return "账户开通2";
    }
    //注册处理
  	@RequestMapping(value="/doRegister",method=RequestMethod.POST)
    public String doregister(User user,User user2,@RequestParam String username, HttpServletRequest request){
  		user=service.selectUserByName(username);
        if (user!=null){                                       //用户名已注册
            return "账户开通4";
        }
        else {                                                 //用户名未注册
        	service.addUser(user2);
        	request.setAttribute("user", user2);
        	return "账户开通3";
        }
    }
  	//登录页面
  	@RequestMapping(value="/进入系统",method=RequestMethod.GET)
    public String login(@ModelAttribute("login") User user){
  	    return "进入系统";
    }
  	//登录处理
  	@RequestMapping(value="/doLogin",method=RequestMethod.POST)
    public String doLogin(@ModelAttribute("usermanage") User user,
    		              @RequestParam String username, 
  	                      @RequestParam String password,
  	                      @RequestParam int type,
  	                      HttpServletRequest request){
        user = service.selectUserByName(username);             //搜索登录的用户名
        if(type==1) {                                          //用户
        	if (user != null){                                 //用户名存在
        		if (password.equals(user.getPassword())){      //密码正确
        			if (user.getType() == 1){
        				request.getSession().setAttribute("user", user);
        				                                       //type=1  
        				String loginerror="0";
          				request.getSession().setAttribute("loginerror", loginerror);  
                    	return "transfer";                     //用户名和密码正确，且该用户权限type=1
                    }
        			else{
        				String loginerror="1";
          				request.getSession().setAttribute("loginerror", loginerror); 
          				logger.info(loginerror);
        				return "进入系统";                        //用户名和密码正确，但该用户权限type=!1
        			}
        		}
        		else {
        			String loginerror="1";
      				request.getSession().setAttribute("loginerror", loginerror);
      				logger.info(loginerror);
        			return "进入系统";                            //用户名存在但密码错误
        		}
        	}
        	else {
        		String loginerror="2";
  				request.getSession().setAttribute("loginerror", loginerror);
  				logger.info(loginerror);
        		return "进入系统";                                //用户名不存在
        	}
        }
        else{                                                  //管理员
        	if (user != null){                                 //用户名存在
        		if (password.equals(user.getPassword())){      //密码正确
        			if (user.getType() == 0){   
                        request.getSession().setAttribute("user", user);
        				                                       //type=0 
                        String loginerror="0";
          				request.getSession().setAttribute("loginerror", loginerror); 
          				logger.info(loginerror);
                    	return "adtransfer";                   //用户名和密码正确，且该用户权限type=0
                    }
        			else{
        				String loginerror="1";
          				request.getSession().setAttribute("loginerror", loginerror);  
          				logger.info(loginerror);
        				return "进入系统";                        //用户名和密码正确，但该用户权限type=!0
        			}
        		}
        		else {   	
    				String loginerror="1";
      				request.getSession().setAttribute("loginerror", loginerror); 
      				logger.info(loginerror);
        			return "进入系统";                            //用户名存在但密码错误
        		}
        	}
        	else {	
        		String loginerror="2";
  				request.getSession().setAttribute("loginerror", loginerror); 
  				logger.info(loginerror);
        		return "进入系统";                                //用户名不存在
        	}
        }
    }
  	//进入管理员主页
  	@RequestMapping(value="/adhome")
    public String adhome(){
    	return "adhome";
    }
    //进入用户主页
  	@RequestMapping(value="/home")
    public String home(){
    	return "home";
    }
  	//个人中心页面
  	@RequestMapping(value="/个人中心")
    public String usermessage(@RequestParam String username,HttpServletRequest request){
  		User user = service.selectUserByName(username);
  		request.getSession().setAttribute("user", user);
    	return "个人中心";
    }
  	//个人信息更新
  	@RequestMapping(value="/doUpdate",method=RequestMethod.POST)
    public String doUpdate(User user,HttpServletRequest request){
		service.updateUser(user);
		request.setAttribute("user", user);
		String updateerror="55";
		request.getSession().setAttribute("updateerror", updateerror);
    	return "个人中心";
    }
    //用户管理页面
  	@RequestMapping(value="/用户管理",method=RequestMethod.GET)
    public String usermanage(@RequestParam String username,HttpServletRequest request){
  		User user = service.selectUserByName(username);
  		List<User> users = service.selectUserByDirector(username);
    	request.setAttribute("users", users);
    	request.getSession().setAttribute("user", user);
    	return "用户管理";
    }
    //用户增加
  	@RequestMapping(value="/用户增加",method=RequestMethod.GET)
    public String adduser(@ModelAttribute("user") User user){
    	return "用户增加";
    }
  	//增加处理
	@RequestMapping(value="/doAddUser",method=RequestMethod.POST)
    public String doAddUser(User user,User user2,@RequestParam String username,HttpServletRequest request){
//		service.addNormalUser(user);
//		return "用户增加";
		user=service.selectUserByName(username);
		logger.info(username);
		if(user!=null) {                                       //待插入的用户已存在
			logger.info("fail");
			String adderror="1";
			request.getSession().setAttribute("adderror", adderror);
			return "用户增加";
		}
		else {                                                 //待插入的用户不存在
			service.addNormalUser(user2);
			logger.info("success");
			String adderror="0";
			request.getSession().setAttribute("adderror", adderror);
            return "用户增加";
		}
    }
	
	
		
		
	//用户删除
  	@RequestMapping(value="/用户删除")
    public String deleteuser(@ModelAttribute("deletenormaluser") User user){
    	return "用户删除";
    }
  	//删除梳理
  	@RequestMapping(value="/doDeleteUser",method=RequestMethod.POST)
    public String doDeleteUser(@RequestParam int id,@RequestParam String director,HttpServletRequest request){
  		User user=service.selectUserById(id);
  		if(user!=null) {                                                       //要删除的ID号存在
  			if(user.getDirector().equals(director)&&user.getType()==1) {       //该ID的权限为用户，且上家为当前登录的管理员			
//  				String ID="";
//  	  			ID=id+"";
//  	  			logger.info("要删除的id:"+ID);
//  	  			logger.info("该id的上级应该是:"+director);
//  	  			logger.info("该id的上级实际是:"+user.getDirector());
//  	  			String Type="";
//  	  			Type=user.getType()+"";
//  	  			logger.info("该id的type:"+Type);
  	  			service.deleteNormalUser(id);
  	  		    String deleteerror="0";
				request.getSession().setAttribute("deleteerror", deleteerror);
				logger.info(deleteerror);
				return "用户删除";
  			}
  			else {                                                              //该ID的权限不为用户，或上家不为当前登录的管理员	
  				String deleteerror="1";
  				request.getSession().setAttribute("deleteerror", deleteerror); 
  				logger.info(deleteerror);
  				return "用户删除";
  			}
  		}
  		else {                                                                  //要删除的ID号不存在
  			String deleteerror="2";
			request.getSession().setAttribute("deleteerror", deleteerror);  
			logger.info(deleteerror);
  			return "用户删除";
  		}
    }
  	
  	
  	
  	
  	@RequestMapping(value="/a")
    public String a(){
    	return "a";
    }
  	@RequestMapping(value="/b")
    public String b(){
    	return "b";
    }

  	@RequestMapping(value="/c")
    public String c(){
    	return "c";
    }


  	

  	
}
