package com.ourlinc.bookmeetingroom.book.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import com.ourlinc.bookmeetingroom.book.BookService;
import com.ourlinc.bookmeetingroom.book.Order;
import com.ourlinc.bookmeetingroom.book.di.BookDi;
import com.ourlinc.tern.Persistent;
import com.ourlinc.tern.Persister;
import com.ourlinc.tern.ResultPage;
import com.ourlinc.tern.ext.ResultPages;
import com.ourlinc.tern.search.IndexKeyword;
import com.ourlinc.tern.search.IndexKeywords;
import com.ourlinc.tern.search.IndexResults;
import com.ourlinc.tern.search.ResultPageWrap;
import com.ourlinc.tern.search.Searcher;
import com.ourlinc.tern.support.DataHub;

public class BookServiceImpl implements BookService {
	
	final DataHub m_DataHub;
	
	final BookDiImpl m_BookDi;
	
	final Persister<Order> m_PsOrder;
	
	final Searcher m_Searcher;

	public BookServiceImpl(DataHub hub) {
		m_DataHub = hub;
		m_BookDi = new BookDiImpl();
		m_PsOrder = m_DataHub.createPersister(Order.class, m_BookDi);
		m_Searcher = m_DataHub.createSearcher("Order");
	}
	
	@Override
	public Order createOrder(int room, Date stTime, Date edTime) {
		if(m_BookDi.checkTime(room, stTime, edTime, null)){
			return new Order(m_BookDi, room, stTime, edTime);
		}
		return null;
	}
	
	@Override
	public Order getOrder(String id) {
		return m_PsOrder.get(id);
	}
	
	@Override
	public ResultPage<Order> searchOrders(Date date, String depart,
			String theme) {
		List<IndexKeyword> ks = new ArrayList<IndexKeyword>();
		
		ks.add(IndexKeywords.newKeyword(Order.REINDEX_STATUS + Order.STATUS_OK.id));
		ks.add(IndexKeywords.newKeyword(String.format("yyyy-mm-dd", date)));
		if (null!=depart && 0<depart.length()) {
			ks.add(IndexKeywords.newKeyword(depart));
		}
		IndexResults ir = m_Searcher.search(ks,Searcher.OPTION_NONE);
		return ResultPages.toSortResultPage(ResultPageWrap.wrap(ir, m_PsOrder), Order.ORDER_LAST, ResultPage.LIMIT_NONE);
	}
	

	class BookDiImpl implements BookDi{

		@Override
		public <E extends Persistent> Persister<E> getPersister(Class<E> clazz) {
			return m_DataHub.getPersister(clazz);
		}

		@Override
		public boolean checkTime(int room, Date stTime, Date edTime, Order o) {
			List<IndexKeyword> ks = new ArrayList<IndexKeyword>();
			
			ks.add(IndexKeywords.newKeyword(room + ""));
			ks.add(IndexKeywords.newKeyword(String.format("yyyy-mm-dd", stTime)));
			ks.add(IndexKeywords.newKeyword(String.format("yyyy-mm-dd", edTime)));
			IndexResults ir = m_Searcher.search(ks,Searcher.OPTION_NONE);
			ResultPage<Order> list = ResultPages.toSortResultPage(
					ResultPageWrap.wrap(ir, m_PsOrder), Order.ORDER_LAST, ResultPage.LIMIT_NONE);
			list.setPageSize(128);
			for(int page=1;page<list.getPageCount()+1;page++){
				list.gotoPage(page);
				for(Order order:list){
					if (!o.getId().equals(order.getId())) {
						if (!(stTime.after(order.getEndTime()) || edTime.before(order.getStartTime()))) {
							return false;
						}
					}
				}
			}
			return true;
		}

		@Override
		public Searcher getOrderSearcher() {
			return m_Searcher;
		}
	}
}
