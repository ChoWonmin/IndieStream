package aop.common;

import static org.hamcrest.CoreMatchers.instanceOf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.logging.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StopWatch;
import org.springframework.web.servlet.ModelAndView;

import aop.controller.LoadingController;
import spring.indiestream.domain.MemberVO;

@Aspect
public class ReportAspect {
/*	@Autowired
	private LoadingController loadingController;*/
	private Log log = LogFactory.getLog(getClass());
/*	public void setReportService(ReportService reportService) {
		this.reportService = reportService;
	}*/
	@Around("execution(* spring.indiestream.controller..*.*(..))")
	public Object report(ProceedingJoinPoint pjp)throws Throwable{
		String tcname = pjp.getTarget().getClass().getName();
		String tmname = pjp.getSignature().getName();
		
		Object[] args =pjp.getArgs();
/*		for(Object o : args){
			if(o==null || o.equals("")){
				log.warn(tcname+ " class's "+ tmname +"inappropriate parameter value");	
			}//if
		}//for
*/		
		log.info("====aop start====");
		
		long start=System.currentTimeMillis();
		Object obj = pjp.proceed();  //??�?  ?��?��
		long end=System.currentTimeMillis();
		String loginId=null;
		for(Object o : args){
			if(o instanceof HttpServletRequest){
				//System.out.println("4::"+((HttpServletRequest)o).toString());
				//System.out.println("5::"+((MemberVO)((HttpServletRequest)o).getSession().getAttribute("loginMvo")));
				if(((MemberVO)((HttpServletRequest)o).getSession().getAttribute("loginMvo"))!=null){
					loginId=((MemberVO)((HttpServletRequest)o).getSession().getAttribute("loginMvo")).getMemberId();
					log.info("login ID :: "+loginId);
				}//login ID
			}else if(o instanceof HttpServletResponse){
				//System.out.println("6::"+((HttpServletResponse)o).toString());
			}else{
				//System.out.println("7::"+o.toString());
				//System.out.println("8::"+(o.getClass()).toString());
			}
		}//for
		log.info("args count of class ::"+args.length);
		log.info("TargetClassName :: "+tcname);
		log.info("TargetMethodName :: "+tmname);
		log.info("the time required :: " + (end-start)+" millisecond");
		log.info("ModelAndView: reference to view with name ::"+((ModelAndView)obj).getViewName());
		log.info("model ::"+((ModelAndView)obj).getModelMap());
		System.out.println("[콘솔]====aop start====");
		System.out.println("[콘솔]login ID :: "+loginId);
		System.out.println("[콘솔]?��?���? ?�� ::"+args.length);
		System.out.println("[콘솔]TargetClassName :: "+tcname);
		System.out.println("[콘솔]TargetMethodName :: "+tmname);
		System.out.println("[콘솔]�? ?��?��?���? :: " + (end-start)+" �?리세컨드 [1000�?리세컨드=1�?]");
		System.out.println("[콘솔]ModelAndView: reference to view with name ::"+((ModelAndView)obj).getViewName());
		//System.out.println("1::"+(ModelAndView)obj);
		System.out.println("[콘솔]model ::"+((ModelAndView)obj).getModelMap());
		System.out.println("[콘솔]====aop end====");
		log.info("====aop end====");
		return obj;
	}//report
	//강사?�� 방법
	/*public Object report(ProceedingJoinPoint pjp) throws Throwable{
		

		Object retValue=pjp.proceed(); // target?�� find�?() 메소?���? ?��출된?��.
		(List) list = (List) retValue;	
		if(!list.isEmpty()){ //  find()메소?�� ?��?��결과�? 뭔�?�? ?��?�� ?��?���?..word�? ?��?��?�� ?���?
			Object[] param=pjp.getArgs();
			reportService.saveReport(param[0].toString);  // ?���?
		}

		return retValue;
	}*/

}
