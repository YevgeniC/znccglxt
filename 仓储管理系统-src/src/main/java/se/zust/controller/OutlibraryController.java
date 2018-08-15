package se.zust.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import se.zust.entity.Outlibrary;
import se.zust.service.OutlibraryService;

@Controller
@RequestMapping("/ssm")
public class OutlibraryController {
	Logger logger = LoggerFactory.getLogger(OutlibraryController.class);
	@Autowired
	private OutlibraryService outlibraryservice;
	
	@RequestMapping(value="/outbase",method=RequestMethod.GET)
	 public String listall(HttpServletRequest request){
		List<Outlibrary> outlibrary=outlibraryservice.selectAllOutlibrary(1);
		request.setAttribute("outlibrary", outlibrary);
   	return "outbase";
   }
}
