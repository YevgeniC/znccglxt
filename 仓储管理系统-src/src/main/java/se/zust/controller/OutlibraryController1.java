package se.zust.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import se.zust.entity.Library;
import se.zust.entity.Outlibrary;
import se.zust.service.LibraryService;
import se.zust.service.OutlibraryService;

@Controller
@RequestMapping("/ssm")
public class OutlibraryController1 {
	@Autowired
	private OutlibraryService outlibraryservice;
	@Autowired
	private LibraryService libraryService;
	@RequestMapping(value="/chuli",method=RequestMethod.POST)
	public void dellibrary(@RequestParam Integer pid,ModelMap map,HttpServletRequest req,HttpServletResponse response) throws IOException{
		 Date outdate = new Date();
		libraryService.delLibrary(pid);
		Outlibrary outlibrary=new Outlibrary();
		outlibrary.setPnum(Integer.parseInt((req.getParameter("pnum")).toString()));
		outlibrary.setPname((req.getParameter("pname")));
		outlibrary.setFisid((req.getParameter("fisid")).toString());
		outlibrary.setSecid((req.getParameter("secid")).toString());
		outlibrary.setThiid((req.getParameter("thiid")).toString());
		outlibrary.setOutdate(outdate);
		outlibraryservice.addOutlibrary(outlibrary);
		response.sendRedirect("outbase1");
	}

	@RequestMapping(value="/outbase1",method=RequestMethod.GET)
	 public String test(String page,HttpServletRequest request){
		int count = libraryService.selectAlllibraryCount();
		request.setAttribute("count", count);
		//System.out.println("页码"+page);
		if(page==null){page="1";}
		int index = (Integer.parseInt(page)-1)*7;
		//System.out.println("第一项:"+index);
		if ((Integer.parseInt(page))<1) {
			index = 0;
			page = "1";
		}
		int totalpage = count/7;
		if ((count%7)!=0) {
			totalpage += 1;
		}
		if ((Integer.parseInt(page))>totalpage) {
			
			page = ""+totalpage;
		}
		index = (Integer.parseInt(page)-1)*7;
		request.setAttribute("totalpage", totalpage);
		List<Library> Library=libraryService.selectAlllibrary(index);
		request.setAttribute("Library", Library);
		request.setAttribute("page", page);
//		List<String> Thiid = BaseService.selectThiid();
//		request.setAttribute("Thiid", Thiid); 
//		List<String> Secid = BaseService.selectSecid();
//		request.setAttribute("Secid", Secid);
		return "outbase1";
	}
	@RequestMapping(value="/outbase1by",method=RequestMethod.GET,produces = "text/plain;charset=UTF-8")
	 public String selectBy(String page,HttpServletRequest request,HttpServletResponse response){
		String radio = (request.getParameter("type")).toString();
//		System.out.println(radio);
		if (radio.equals("0")) {
			String name = (request.getParameter("search"));
			int count = libraryService.selectByPnameCount(name);
			request.setAttribute("count", count);
			if(page==null){page="1";}
			int index = (Integer.parseInt(page)-1)*7;
			//System.out.println("第一项:"+index);
			if ((Integer.parseInt(page))<1) {
				index = 0;
				page = "1";
			}
			int totalpage = count/7;
			if ((count%7)!=0) {
				totalpage += 1;
			}
			if ((Integer.parseInt(page))>totalpage) {
				
				page = ""+totalpage;
			}
			if (!page.equals("0")) {
				index = (Integer.parseInt(page)-1)*7;
			}
			request.setAttribute("totalpage", totalpage);
			List<Library> Library = libraryService.selectByPname(name,index);
			request.setAttribute("Library", Library);
			request.setAttribute("page", page);
		}
		else if (radio.equals("1")) {
			String Thiid = (request.getParameter("thiid")).toString();
			String Secid = (request.getParameter("secid")).toString();
			int count = libraryService.selectByThidSecidCount(Thiid,Secid);
			request.setAttribute("count", count);
			if(page==null){page="1";}
			int index = (Integer.parseInt(page)-1)*7;
			//System.out.println("第一项:"+index);
			if ((Integer.parseInt(page))<1) {
				index = 0;
				page = "1";
			}
			int totalpage = count/7;
			if ((count%7)!=0) {
				totalpage += 1;
			}
			if ((Integer.parseInt(page))>totalpage) {
				
				page = ""+totalpage;
			}
			if (!page.equals("0")) {
				index = (Integer.parseInt(page)-1)*7;
			}
			request.setAttribute("totalpage", totalpage);
			List<Library> Library=libraryService.selectByThidSecid(Thiid,Secid,index);
			request.setAttribute("Library", Library);
		}
		else if (!radio.equals("0")&&!radio.equals("0")) {
			return "outbase1by";
		}
		return "outbase1";
	}	
	@RequestMapping(value="outbaseselectall",method=RequestMethod.GET)
	 public String selectoutall(String page,HttpServletRequest request){
		int count = outlibraryservice.selectAllOutlibraryCount();
		request.setAttribute("count", count);
		//System.out.println("页码"+page);
		if(page==null){page="1";}
		int index = (Integer.parseInt(page)-1)*7;
		//System.out.println("第一项:"+index);
		if ((Integer.parseInt(page))<1) {
			index = 0;
			page = "1";
		}
		int totalpage = count/7;
		if ((count%7)!=0) {
			totalpage += 1;
		}
		if ((Integer.parseInt(page))>totalpage) {
			
			page = ""+totalpage;
		}
		index = (Integer.parseInt(page)-1)*7;
		request.setAttribute("totalpage", totalpage);
		List<Outlibrary> Outlibrary=outlibraryservice.selectAllOutlibrary(index);
		request.setAttribute("outlibrary", Outlibrary);
		request.setAttribute("page", page);
//		List<String> Thiid = BaseService.selectThiid();
//		request.setAttribute("Thiid", Thiid); 
//		List<String> Secid = BaseService.selectSecid();
//		request.setAttribute("Secid", Secid);
		return "outbaseselectall";
	}
/*	@RequestMapping(value="/chuli",method=RequestMethod.GET)
	 public String select(String page,HttpServletRequest request,HttpServletResponse response){
	
		
	}*/
   }

