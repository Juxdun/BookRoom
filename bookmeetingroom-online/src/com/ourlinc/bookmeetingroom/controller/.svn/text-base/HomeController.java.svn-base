package com.ourlinc.bookmeetingroom.controller;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ourlinc.bookmeetingroom.book.BookService;
import com.ourlinc.bookmeetingroom.book.Order;
import com.ourlinc.tern.ResultPage;
import com.ourlinc.web.util.ServletUtils;

@Controller
public class HomeController {
	
	@Resource(name = "bookService")
	private BookService m_BookService;
	/**
	 * 日志记录器
	 */
	public static final Logger _logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * 主页（今天的预定情况）
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping
	String index(HttpServletRequest request,HttpServletResponse response){
		Calendar c = Calendar.getInstance();
		Date date = c.getTime();	// 今天
		ResultPage<Order> list = m_BookService.searchOrders(date, null, null);
		request.setAttribute("list", list);
		return "index";
	}
	
	/**
	 * 预定
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping
	String book(HttpServletRequest request,HttpServletResponse response){
		request.setAttribute("rooms", Order.ALL_ROOM);
		request.setAttribute("departs", Order.ALL_DEPART);
		
		String op = ServletUtils.inputValToString(request.getParameter("op"));
		if("add".equals(op)){	//	添加
			int room = ServletUtils.inputValToInt(request.getParameter("room"));
			int depart = ServletUtils.inputValToInt(request.getParameter("depart"));
			String bookMan = ServletUtils.inputValToString(request.getParameter("bookMan"));
			Date stTime = ServletUtils.inputValToDate(request.getParameter("startTime"));
			Date edTime = ServletUtils.inputValToDate(request.getParameter("endTime"));
			String theme = ServletUtils.inputValToString(request.getParameter("meetingTheme"));
			Order o = m_BookService.createOrder(room, stTime, edTime);
			if (null == o) {
				return "book";
			}
			o.setDepartment(depart);
			o.setBookMan(bookMan);
			o.setMeetingTheme(theme);
			
			ServletUtils.sendRedirect("index.jspx", request, response);
			return null;
		}
		
		return "book";
	}
	
	@RequestMapping
	String search(HttpServletRequest request,HttpServletResponse response){
		String op = ServletUtils.inputValToString(request.getParameter("op"));
		if ("search".equals(op)) {
			String depart = ServletUtils.inputValToString(request.getParameter("department"));
			String dDate = request.getParameter("date");
			Date date = ServletUtils.inputValToDate(dDate);
			String theme = ServletUtils.inputValToString(request.getParameter("meetingTheme"));
			String room = ServletUtils.inputValToString(request.getParameter("roomId"));
			// 搜索
			ResultPage<Order> list = m_BookService.searchOrders(date, depart, theme);
			request.setAttribute("list", list);
			ServletUtils.sendRedirect("search.jspx", request, response);
			return null;
		}
		
		return "search";
	}
	
	/**
	 * 日历显示
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping
	String calendar(HttpServletRequest request,HttpServletResponse response){
		String op = ServletUtils.inputValToString(request.getParameter("op"));
		if ("gotoday".equals(op)) {
			
		}
		return "calendar";
	}
	
	

}
