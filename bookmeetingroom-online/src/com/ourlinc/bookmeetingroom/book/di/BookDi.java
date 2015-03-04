package com.ourlinc.bookmeetingroom.book.di;

import java.util.Date;

import com.ourlinc.bookmeetingroom.book.Order;
import com.ourlinc.tern.search.Searcher;
import com.ourlinc.tern.support.BusinessDi;

public interface BookDi extends BusinessDi {
	
	Searcher getOrderSearcher();

	boolean checkTime(int room, Date stTime,Date edTime, Order o);
}
