package com.ourlinc.bookmeetingroom.book;

import java.util.Arrays;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.ourlinc.bookmeetingroom.book.di.BookDi;
import com.ourlinc.tern.NameItem;
import com.ourlinc.tern.search.IndexElement;
import com.ourlinc.tern.search.IndexKeyword;
import com.ourlinc.tern.search.IndexKeywords;
import com.ourlinc.tern.support.AbstractPersistent;

/**
 * 订单
 * @author Juxdun
 *
 */
public class Order extends AbstractPersistent<BookDi>{
	/**
	 * 会议室常量
	 */
	public static final NameItem ROOM_1 = new NameItem("10楼会议室", 1);
	public static final NameItem ROOM_2 = new NameItem("12楼会议室", 2);
	
	public static final NameItem[] ALL_ROOM = {ROOM_1, ROOM_2};
	
	/**
	 * 部门常量
	 */
	public static final NameItem DEPART_DEVELOP = new NameItem("开发部", 5);
	public static final NameItem DEPART_HUMAN_R = new NameItem("人事部", 6);
	public static final NameItem DEPART_COMPREX = new NameItem("综合部", 7);
	public static final NameItem DEPART_MARKET = new NameItem("市场部", 8);
	
	public static final NameItem[] ALL_DEPART = {DEPART_DEVELOP,
			DEPART_HUMAN_R,
			DEPART_COMPREX,
			DEPART_MARKET};
	
	/**
	 * 状态常量
	 */
	public static final NameItem STATUS_DEL = new NameItem("删除", -1);
	public static final NameItem STATUS_OK = new NameItem("正常", 1);
	
	public static final NameItem[] ALL_STATUS = {STATUS_DEL, STATUS_OK};
	/**
	 * 状态索引关键字
	 */
	public static final String REINDEX_STATUS = "s:";
	
	/**
	 * 状态
	 */
	@Resource
	private int m_Status;
	
	/**
	 * 会议室
	 */
	@Resource
	private int m_Room;
	
	/**
	 * 开始时间
	 */
	@Resource
	private Date m_StaTime;
	
	/**
	 * 结束时间
	 */
	@Resource
	private Date m_EndTime;
	
	/**
	 * 预定部门
	 */
	@Resource
	private int m_Depart;
	
	/**
	 * 预订人
	 */
	@Resource
	private String m_BookMan;

	
	/**
	 * 会议主题
	 */
	@Resource
	private String m_Theme;

	public Order(BookDi bookDi, int room, Date startTime, Date endTime) {
		super(bookDi);
		m_Id = getPersister().getNewId();
		m_Status = STATUS_OK.id;
		m_Room = room;
		m_StaTime = startTime;
		m_EndTime = endTime;
		markPersistenceUpdate();
		reindex();
	}

	protected Order(BookDi di) {
		super(di);
	}
	
	public boolean changeTime(int room, Date stTime,Date edTime){
		if(getBusinessDi().checkTime(room, stTime, edTime, this)){
			m_StaTime = stTime;
			m_EndTime = edTime;
			markPersistenceUpdate();
			reindex();
			return true;
		}
		return false;
	}
	
	public void setDepartment(int mDepart) {
		m_Depart = mDepart;
		markPersistenceUpdate();
		reindex();
	}

	public void setBookMan(String mBookMan) {
		m_BookMan = mBookMan;
		markPersistenceUpdate();
		reindex();
	}

	public void setMeetingTheme(String mMeetingTheme) {
		m_Theme = mMeetingTheme;
		markPersistenceUpdate();
		reindex();
	}
	
	public void delete(){
		m_Status = STATUS_DEL.id;
		markPersistenceUpdate();
		reindex();
	}
	
	/*
	 * Getter
	 */
	public NameItem getRoom(){
		return NameItem.findById(m_Room, ALL_ROOM);
	}
	
	public Date getStartTime() {
		return m_StaTime;
	}
	
	public Date getEndTime() {
		return m_EndTime;
	}
	
	public NameItem getDepart() {
		return NameItem.findById(m_Depart, ALL_DEPART);
	}

	public String getBookMan() {
		return m_BookMan;
	}

	public String getTheme() {
		return m_Theme;
	}
	
	/**
	 * 关键词重索引
	 */
	public void reindex() {
		List<IndexKeyword> ks = Arrays.asList(
				IndexKeywords.newKeyword(REINDEX_STATUS + m_Status, 0),
				IndexKeywords.newKeyword(m_Room+"", 0),
				IndexKeywords.newKeyword(m_Depart+"", 0),
				IndexKeywords.newKeyword(String.format("yyyy-mm-dd", m_StaTime), 0),
				IndexKeywords.newKeyword(String.format("yyyy-mm-dd", m_EndTime), 0)
		);
		
		getBusinessDi().getOrderSearcher().updateElement(
				IndexElement.valueOf(getId().getOrdinal()), ks);
	}
	
	/**
	 * 最新的排在最前
	 */
	public static Comparator<Order> ORDER_LAST = new Comparator<Order>(){
		@Override
		public int compare(Order o1, Order o2) {
			if (null==o1 || null==o2) {
				return -1;
			}
			return o1.getStartTime().after(o2.getStartTime()) ? 1 : 0;
		}
	};
}
