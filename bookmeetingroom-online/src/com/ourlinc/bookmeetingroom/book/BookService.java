package com.ourlinc.bookmeetingroom.book;

import java.util.Date;
import java.util.List;

import com.ourlinc.tern.ResultPage;

public interface BookService {
	
	/**
	 * 下单
	 * @param room
	 * @param staTime
	 * @param endTime
	 * @return
	 */
	Order createOrder(int room, Date staTime, Date endTime);
	
	/**
	 * 订单查询
	 * @param date
	 * @param department
	 * @param meetingTheme
	 * @return
	 */
	ResultPage<Order> searchOrders(Date date, String depart, String theme);
	
	/**
	 * 取订单对象
	 * @param id
	 * @return
	 */
	Order getOrder(String id);
}
