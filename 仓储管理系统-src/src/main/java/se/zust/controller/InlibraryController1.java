package se.zust.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import se.zust.entity.Inlibrary;
import se.zust.entity.User;
import se.zust.service.InlibraryService;

@Controller
@RequestMapping("/ssm")
public class InlibraryController1 {
	Logger logger = LoggerFactory.getLogger(InlibraryController.class);
	@Autowired
	private InlibraryService inlibraryservice;
	
	@RequestMapping(value="/inbase1",method=RequestMethod.GET)
	 public String listall(HttpServletRequest request){
		List<Inlibrary> inlibrary=inlibraryservice.selectAllInlibrary(1);
		request.setAttribute("inlibrary", inlibrary);
    	return "inbase1";
    }
	  @RequestMapping(value = "/addInlibrary", method = RequestMethod.POST)
	    public void addlibrary(ModelMap map,HttpServletRequest req,HttpServletResponse response){
		  Date date = new Date();
//		  SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		  
		  
//		  date.getDate();
//		  inlibrary.setIndate(date);
//		  
//		  inlibraryservice.addInlibrary(inlibrary);
//		  List<Inlibrary> inlibrary1=inlibraryservice.selectAllInlibrary();
//	        request.setAttribute("inlibrary", inlibrary1);
		  	
		  Inlibrary inlibrary1=new Inlibrary();
//		  String s = req.getParameter("pid");
		  inlibrary1.setPid(Integer.parseInt((req.getParameter("pid")).toString()));
		  inlibrary1.setPnum(Integer.parseInt((req.getParameter("pid")).toString()));
		  inlibrary1.setPname((req.getParameter("pid")).toString());
//		  inlibrary1.setFisid(Integer.parseInt((req.getParameter("pid")).toString()));
//		  inlibrary1.setSecid(Integer.parseInt((req.getParameter("pid")).toString()));
//		  inlibrary1.setThiid(Integer.parseInt((req.getParameter("pid")).toString()));
//		  inlibrary1.setLname((req.getParameter("pid")).toString());
//		  inlibrary1.setIndate(date);
		  
		  //inlibrary1.setPid(Integer.parseInt(s));
		  try{
			  inlibraryservice.addInlibrary(inlibrary1);
//			  List<Inlibrary> inlibrary2=inlibraryservice.selectAllInlibrary();
//			  map.put("inlibrary2", inlibrary2);
			  response.sendRedirect("inbase1");
		  }catch(Exception e){
			  System.out.println("数据库操作异常！");
		  }
//	        return "inbase1";
	    }
	  
}