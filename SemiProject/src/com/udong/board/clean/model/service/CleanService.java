package com.udong.board.clean.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.udong.board.clean.model.dao.CleanDao;
import com.udong.board.clean.model.vo.CleanBoard;
import com.udong.board.clean.model.vo.CleanReply;
import com.udong.board.news.model.dao.NewsBoardDao;
import com.udong.board.news.model.vo.NewsBoard;
import com.udong.common.JDBCTemplate;
import com.udong.common.model.vo.PageInfo;

public class CleanService {

	//총 게시글 개수 구하기
	public int cleanSelectListCount() {
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new CleanDao().cleanSelectListCount(conn);
		
		JDBCTemplate.close(conn);
		
		return listCount;
		
	}
	
	//게시글 리스트 조회
	public ArrayList<CleanBoard> cleanSelectList(PageInfo pi) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<CleanBoard> clist = new CleanDao().cleanSelectList(conn,pi);
		
		JDBCTemplate.close(conn);
		
		return clist;
	}

	//게시글 하나 조회하는 메소드
	public CleanBoard selectClean(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		CleanBoard cb = new CleanDao().selectClean(conn, boardNo);
		
		JDBCTemplate.close(conn);
		
		return cb;
	}

	//댓글 작성
	public int cleanInsertReply(CleanReply r) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new CleanDao().cleanInsertReply(conn, r);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	//댓글 목록
	public ArrayList<CleanReply> cleanSelectReply(int cleanBoardNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<CleanReply> rlist = new CleanDao().cleanSelectReply(conn, cleanBoardNo);
		
		JDBCTemplate.close(conn);
		
		return rlist;
	}

	//댓글 삭제
	public int cleanDeleteReply(int cleanReplyNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new CleanDao().cleanDeleteReply(conn, cleanReplyNo);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		return result;

	}

	public int cleanUpdateReply(int cleanBoardNo, String content) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new CleanDao().cleanUpdateReply(conn, cleanBoardNo, content);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public CleanBoard cleanAllCategoryList(String category) {
		Connection conn = JDBCTemplate.getConnection();
		
		CleanBoard cb = new CleanDao().cleanAllCategoryList(conn, category);
		
		JDBCTemplate.close(conn);
		
		return cb;
	}

	public ArrayList<CleanBoard> selectNocleanList() {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<CleanBoard> clist = new CleanDao().selectNocleanList(conn);
		
		JDBCTemplate.close(conn);
		
		return clist;
	}
	
	
}
