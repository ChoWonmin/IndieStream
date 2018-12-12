package aop.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoadingController {
	
	public ModelAndView loading(HttpServletRequest request, HttpServletResponse response) throws Exception{
/*		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("asdasdasdasdasdasd");
		//out.close();
*/		return new ModelAndView("loading");
	}

}
