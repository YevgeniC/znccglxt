package se.zust.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import se.zust.entity.Inlibrary;
import se.zust.entity.Library;
import se.zust.service.InlibraryService;
import se.zust.service.LibraryService;


@Controller
@RequestMapping("/ssm")
public class InlibraryController {
	@Autowired
	private InlibraryService inlibraryservice;
	@Autowired
	private LibraryService LibraryService;
	@RequestMapping(value="/inManagement",method=RequestMethod.POST)
	public String inManagement(HttpServletRequest request,@RequestParam(value = "search",required = false) String search){
        List<Inlibrary> inlibrary = null;
	    int index = 1;
	    int a = 0;
		if ("" == search || null == search){
            inlibrary = inlibraryservice.selectAllInlibrary(index);
        }else {
            inlibrary = inlibraryservice.selectByName(search);
        }
		for (Inlibrary inlib: inlibrary){
			String[] time = inlib.getIntime().split("\\.");
            inlib.setIntime(time[0]);
		}
		int count = inlibraryservice.selectAllInlibraryCount();
		request.setAttribute("inlibrary",inlibrary);
		request.setAttribute("count",count);
		return "inManagement";
	}

    @RequestMapping(value = "/addInlibrary",method = RequestMethod.POST)
    public ResponseEntity<Inlibrary> addInlibrary(@RequestParam(value = "goodsName",required = false) String goodsName, @RequestParam(value = "goodsNum",required = false) Integer goodsNum,
                                          @RequestParam(value = "area",required = false) String area, @RequestParam(value = "room",required = false) String room,
                                          @RequestParam(value = "inUser",required = false) String inUser) {
        Inlibrary inlibrary = new Inlibrary();
		inlibrary.setPname(goodsName);
		inlibrary.setPnum(goodsNum);
		inlibrary.setArea(area);
		inlibrary.setRoom(room);
		inlibrary.setInuser(inUser);
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
        inlibrary.setIntime(sdf.format(date));
        inlibraryservice.addInlibrary(inlibrary);
        return new ResponseEntity<Inlibrary>(HttpStatus.OK);
    }

    @RequestMapping(value="/delete",method=RequestMethod.POST)
    public ResponseEntity<Inlibrary> delete(@RequestParam(value = "pid",required = true) int pid){
	    inlibraryservice.deleteInlibrary(pid);
	    return new ResponseEntity<Inlibrary>(HttpStatus.OK);
    }

//    @RequestMapping(value="/selectByName",method=RequestMethod.POST)
//    public ResponseEntity<Inlibrary> selectByName(@RequestParam(value = "username",required = false) String username){
//	    inlibraryservice.selectByName(username);
//	    return new ResponseEntity<Inlibrary>(HttpStatus.OK);
//    }
	@RequestMapping(value="/inerror",method=RequestMethod.GET)
 	 public String error(){
		return "inerror";
	}

	@RequestMapping(value="/inbase1",method=RequestMethod.GET)
	 public String test(String page,HttpServletRequest request){
		int count = inlibraryservice.selectAllInlibraryCount();
		request.setAttribute("count", count);
		//System.out.println("椤电爜"+page);
		if(page==null){page="1";}
		int index = (Integer.parseInt(page)-1)*7;
		//System.out.println("绗竴椤?"+index);
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
		List<Inlibrary> Inlibrary=inlibraryservice.selectAllInlibrary(index);
		request.setAttribute("inlibrary", Inlibrary);
		request.setAttribute("page", page);
		return "inbase1";
	}

//	@RequestMapping(value = "/addInlibrary", method = RequestMethod.POST)
    public void addlibrary(@RequestParam String fisid,ModelMap map,HttpServletRequest req,HttpServletResponse response) throws UnsupportedEncodingException{
	  Date date = new Date();
	  req.setCharacterEncoding("utf8");
	  response.setCharacterEncoding("utf8");
	  Inlibrary inlibrary1=new Inlibrary();
	  Inlibrary inlibrary2=new Inlibrary();
	  Library library = new Library(); 
	  library.setFisid(fisid);
	  library.setSecid((req.getParameter("secid")).toString());
	  library.setThiid((req.getParameter("thiid")).toString());
	  library.setPnum(Integer.parseInt((req.getParameter("pnum")).toString()));
	  library.setPname(req.getParameter("pname"));
//	  inlibrary2.setFisid(fisid);
//	  inlibrary2.setSecid((req.getParameter("secid")).toString());
//	  inlibrary2.setThiid((req.getParameter("thiid")).toString());
//	  inlibrary1.setPnum(Integer.parseInt((req.getParameter("pnum")).toString()));
//	  inlibrary1.setPname(req.getParameter("pname"));
//	  inlibrary1.setFisid(fisid);
//	  inlibrary1.setSecid((req.getParameter("secid")).toString());
//	  inlibrary1.setThiid((req.getParameter("thiid")).toString());
//	  inlibrary1.setIndate(date);
	  //inlibrary1.setPid(Integer.parseInt(s));
//	  try{
//
//		  if(inlibraryservice.selectByThreeid(inlibrary2)==null){
//		  inlibraryservice.addInlibrary(inlibrary1);
//		  LibraryService.addlibrary(library);
//		  List<Inlibrary> inlibrary2=inlibraryservice.selectAllInlibrary();
//		  map.put("inlibrary2", inlibrary2);
//		  response.sendRedirect("inbase1");}
//		  else{
//			  response.sendRedirect("inerror");
//		  }
//	  }catch(Exception e){
//		  System.out.println(e);
//
//
//	  }
//        return "inbase1";
    }
	
	@RequestMapping(value="/select",method=RequestMethod.GET)
	 public String select(String page,HttpServletRequest request){
		int count = LibraryService.selectAlllibraryCount();
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
		if (!page.equals("0")) {
			index = (Integer.parseInt(page)-1)*7;
		}
		request.setAttribute("totalpage", totalpage);
		List<Library> Library=LibraryService.selectAlllibrary(index);
		request.setAttribute("Library", Library);
		request.setAttribute("page", page);
		return "select";
	}

	
	@RequestMapping(value="/selectBy",method=RequestMethod.GET,produces = "text/plain;charset=UTF-8")
	 public String selectBy(String page,HttpServletRequest request,HttpServletResponse response){
		String radio = (request.getParameter("type")).toString();
//		System.out.println(radio);
		if (radio.equals("0")) {
			String name = (request.getParameter("search"));
			int count = LibraryService.selectByPnameCount(name);
			//int count=1;
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
			List<Library> Library = LibraryService.selectByPname(name,index);
			request.setAttribute("Library", Library);
			request.setAttribute("page", page);
		}
		else if (radio.equals("1")) {
			String Thiid = (request.getParameter("thiid")).toString();
			String Secid = (request.getParameter("secid")).toString();
			int count = LibraryService.selectByThidSecidCount(Thiid,Secid);
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
			List<Library> Library=LibraryService.selectByThidSecid(Thiid,Secid,index);
			request.setAttribute("Library", Library);
		}
		else if (!radio.equals("0")&&!radio.equals("0")) {
			return "selectBy";
		}
		return "selectBy";
	}
	
	@RequestMapping(value="/sum",method=RequestMethod.GET)
	 public String sum(String page,HttpServletRequest request){
		int count = LibraryService.sumlibraryCount();
		//int count=7;
		//System.out.println(count);
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
		if (!page.equals("0")) {
			index = (Integer.parseInt(page)-1)*7;
		}		
		request.setAttribute("totalpage", totalpage);
		List<Library> Library=LibraryService.sumlibrary(index);
		request.setAttribute("Library", Library);
		request.setAttribute("page", page);
//		List<Library> Library=LibraryService.sumlibrary();
//		request.setAttribute("Library", Library);
		return "sum";
	}
//	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public void dellibrary(@RequestParam Integer pid,ModelMap map,HttpServletRequest req,HttpServletResponse response) throws IOException{
		//req.setAttribute("error", 0);
		LibraryService.delLibrary(pid);
		//System.out.println(pid);
		response.sendRedirect("select");
	}
	@RequestMapping(value="/move",method=RequestMethod.POST)
	public String move(@RequestParam Integer pid,HttpServletRequest request,HttpServletResponse response){
		List<Library> Library=LibraryService.selectByID(pid);
		request.setAttribute("Library", Library);
		return "move";
	}
	@RequestMapping(value="/MoveTo",method=RequestMethod.GET)
	public void MoveTo(@RequestParam Integer pid,HttpServletRequest request,HttpServletResponse response) throws Exception {
		String Thiid = (request.getParameter("thiid")).toString();
		String Secid = (request.getParameter("secid")).toString();
		String Fisid = (request.getParameter("fisid")).toString();
		System.out.println(1);
		if (Thiid.equals("0")||Secid.equals("0")||Fisid.equals("0")) {
			response.sendRedirect("moverror2");
		}
		List<Library> Library=LibraryService.selectByLocation(Thiid,Secid,Fisid);
		if (Library.size()==0) {
			LibraryService.updateLibrary(Thiid,Secid,Fisid,pid);
			response.sendRedirect("select");
		}else {
			response.sendRedirect("moverror");
		}
	}
	@RequestMapping(value="/moverror",method=RequestMethod.GET)
	 public String moverror(){
		return "moverror";
	}
	@RequestMapping(value="/moverror2",method=RequestMethod.GET)
	 public String moverror2(){
		return "moverror2";
	}
	@RequestMapping(value="/空白",method=RequestMethod.GET)
	 public String ininitial(){
		return "空白";
	}
	
	
	
	
	

}