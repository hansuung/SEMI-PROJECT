package com.udong.board.common.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.udong.board.common.model.dao.BoardCommonDao;
import com.udong.board.common.model.vo.Attachment;
import com.udong.board.common.model.vo.BoardCommon;
import com.udong.board.common.model.vo.Reply;
import com.udong.board.news.model.dao.NewsBoardDao;
import com.udong.common.JDBCTemplate;
import com.udong.common.model.vo.PageInfo;

public class BoardCommonService {
	
	//인기글 조회해오기
	public ArrayList<BoardCommon> bestPostList() {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<BoardCommon> list = new BoardCommonDao().bestPostList(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<BoardCommon> searchKeyword(String keyword, PageInfo pi) {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<BoardCommon> list = new BoardCommonDao().searchKeyword(conn,keyword, pi);
		JDBCTemplate.close(conn);
		return list;
	}
	
	public ArrayList<BoardCommon> selectSearchListTitle(PageInfo pi, int time, String searchInput) {

		Connection conn = JDBCTemplate.getConnection();
		ArrayList<BoardCommon> list = new BoardCommonDao().selectSearchListTitle(conn,pi,time,searchInput);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<BoardCommon> selectSearchListContent(PageInfo pi, int time, String searchInput) {

		Connection conn = JDBCTemplate.getConnection();
		ArrayList<BoardCommon> list = new BoardCommonDao().selectSearchListContent(conn,pi,time,searchInput);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<Reply> selectSearchListReply(PageInfo pi, int time, String searchInput) {
			
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Reply> list = new BoardCommonDao().selectSearchListReply(conn,pi,time,searchInput);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<BoardCommon> selectSearchListWriter(PageInfo pi, int time, String searchInput) {

		Connection conn = JDBCTemplate.getConnection();
		ArrayList<BoardCommon> list = new BoardCommonDao().selectSearchListWriter(conn,pi,time,searchInput);
		JDBCTemplate.close(conn);
		return list;
		
	}

	public ArrayList<BoardCommon> lastestPostList() {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<BoardCommon> list = new BoardCommonDao().lastestPostList(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public int selectKeywordCount(String keyword) {

		Connection conn = JDBCTemplate.getConnection();
		int listCount = new BoardCommonDao().selectKeywordCount(conn,keyword);
		JDBCTemplate.close(conn);
		return listCount;
	}

	public int selectListCountTitleTime(int time, String searchInput) {
		
		Connection conn = JDBCTemplate.getConnection();
		int listCount = new BoardCommonDao().selectListCountTitleTime(conn,time,searchInput);
		JDBCTemplate.close(conn);
		return listCount;
	}

	public int selectListCountContentTime(int time, String searchInput) {
		
		Connection conn = JDBCTemplate.getConnection();
		int listCount = new BoardCommonDao().selectListCountContentTime(conn,time,searchInput);
		JDBCTemplate.close(conn);
		return listCount;
	}

	public int selectListCountReplyTime(int time, String searchInput) {

		Connection conn = JDBCTemplate.getConnection();
		int listCount = new BoardCommonDao().selectListCountReplyTime(conn,time,searchInput);
		JDBCTemplate.close(conn);
		return listCount;
	}

	public int selectListCountWriterTime(int time, String searchInput) {

		Connection conn = JDBCTemplate.getConnection();
		int listCount = new BoardCommonDao().selectListCountWriterTime(conn,time,searchInput);
		JDBCTemplate.close(conn);
		return listCount;
	}

	public int selectMyPostList(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new BoardCommonDao().selectMyPostList(conn, userNo);
		
		JDBCTemplate.close(conn);
		
		return listCount;
	}

	public ArrayList<BoardCommon> selectMyPost(PageInfo pi, int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<BoardCommon> list = new BoardCommonDao().selectMyPost(conn, pi, userNo);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public int insertEachBoard(BoardCommon b, ArrayList<Attachment> list) {
		
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardCommonDao().insertEachBoard(conn,b);
		int result2 = new BoardCommonDao().insertEachAttachment(conn,list);
		
		if(result>0 && result2>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result*result2;
	}

	public int increaseCount(int boardNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardCommonDao().increaseCount(conn, boardNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public BoardCommon selectBestPostDetail(int boardNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		BoardCommon b = new BoardCommonDao().selectBestPostDetail(conn,boardNo);
		JDBCTemplate.close(conn);
		return b;
	}

	public ArrayList<Attachment> selectAttachment(int boardNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Attachment> alist = new BoardCommonDao().selectAttachment(conn,boardNo);
		JDBCTemplate.close(conn);
		return alist;
	}

	public int deletePost(int[] bnoArr) {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		
		int count = 0;
		for(int i=0;i<bnoArr.length;i++) {
			count += new BoardCommonDao().deletePost(conn, bnoArr[i]);
		}
		
		if(count == bnoArr.length) { // 삭제 성공
			JDBCTemplate.commit(conn);
			result = 1;
		}
		else { // 삭제 실패
			JDBCTemplate.rollback(conn);
		}
		
		return result;
	}
	
	public void deleteAttachment(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BoardCommonDao().deleteAttachment(conn, boardNo);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}
		else {
			JDBCTemplate.rollback(conn);
		}
	}

	public ArrayList<BoardCommon> foodPostList() {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<BoardCommon> list = new BoardCommonDao().foodPostList(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public ArrayList<BoardCommon> selectMyLike(PageInfo pi, int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<BoardCommon> list = new BoardCommonDao().selectMyLike(conn, pi, userNo);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public BoardCommon selectEachBoard(int bno) {
		
		Connection conn = JDBCTemplate.getConnection();
		BoardCommon b = new BoardCommonDao().selectEachBoard(conn,bno);
		JDBCTemplate.close(conn);
		return b;
	}

	public int updateEachBoard(BoardCommon b, ArrayList<Attachment> list) {
		
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardCommonDao().updateEachBoard(conn,b);
		int result2 = new BoardCommonDao().updateEachAttachment(conn,list);
		
		if(result>0 && result2>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result*result2;
	}

	public ArrayList<BoardCommon> givePostList() {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<BoardCommon> list = new BoardCommonDao().givePostList(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public int increaseSearch(String inputKeyword) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BoardCommonDao().increaseSearch(conn ,inputKeyword);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}
		else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int insertSearch(String keyword) {
Connection conn = JDBCTemplate.getConnection();
		
		int result = new BoardCommonDao().insertSearch(conn ,keyword);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}
		else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
}
