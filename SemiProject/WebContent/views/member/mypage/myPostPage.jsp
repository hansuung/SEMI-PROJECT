<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.udong.board.common.model.vo.BoardCommon, com.udong.common.model.vo.PageInfo"%>
<%
	ArrayList<BoardCommon> list = (ArrayList<BoardCommon>)request.getAttribute("myPostList");
	PageInfo pi = (PageInfo)request.getAttribute("pageInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성한 게시글</title>
<style>
	@font-face {
		font-family: 'BMJUA';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}
	.wrap {
		position:relative;
		z-index:1;
        height: 1000px;
        width: 1500px;
        margin: auto;
	}
	
	.wrap>div{
    	width: 100%;
    }
    
    #content{
    	width: 100%;
    	height: 100%;
    	position: relative;
    }

    #content>div{
    	height: 100%;
    	float: left;
    }

    #content_1{
        width: 25%;
        background-color: #C8EDC9;
    }

    #content_2{
    	width: 75%;
/*     	background-color: green; */
    	position: relative;
	}
	
	#content_1>p {
		position: absolute;
		top: 40px;
		left: 52px;
		font-size: 50px;
/* 		font-weight: 700; */
		font-family: 'BMJUA';
	}
	
	#line_1, #line_2, #line_3, #line_4, #line_5, #line_6, #line_8 {
		position: absolute;
		border: 1px solid black;
		width: 300px;
		height: 0px;
		top: 115px;
		left: 30px;
	}
	
	#my, #update, #write_board, #like_board, #out, #user_con, #blackList{
		position: absolute;
		font-size: 35px;
		text-decoration: none;
		color: black;
		left: 52px;
		top: 130px;
		font-family: 'BMJUA';
	}
	
	#line_2 { top: 190px; }
	#line_3 { top: 265px; }
	#line_4 { top: 345px; }
	#line_5 { top: 425px; }
	#line_6 { top: 505px; }
	#line_8 { top: 585px; }
	
	#update { top: 205px; }
	#write_board { top: 280px; }
	#like_board { top: 360px; }
	#out { top: 360px; }
	#user_con { top: 360px;}
	#blackList {top: 440px;}
	
	#content_2_1 {
		width: 1100px;
		height: 970px;
		border: 4px solid #C8EDC9;
        border-radius : 20px;
		position: absolute;
		top: 15px;
		left: 12px;
	}
	
	#pp {
		position: absolute;
		top: 45px;
		left: 54px;
		font-size: 45px;
		font-weight: 500;
		font-family: 'BMJUA';
	}
	
	#line_7 {
		position: absolute;
		border: 1px solid black;
		width: 1010px;
		height: 0px;
		top: 120px;
		left: 45px;
	}
	
	#list-area {
		width: 90%;
		margin: 0 auto;
		margin-top: 150px;
		font-size: 17px;
		text-align: center;
	}
	
	#list-area>tbody>tr:hover {
		background-color: #F5F5F5;
        cursor: pointer;
	}
	
	#button-area {
		width: 90%;
		margin: 0 auto;
	}
</style>
</head>
<body>
	<%@ include file = "../../common/menubar.jsp" %>
	<div class="wrap">
		<div id="content">
			<div id="content_1">
				<p>마이페이지</p>
				<div id="line_1"></div>
				<a href="<%=request.getContextPath() %>/views/member/mypage/myInfo.jsp" id="my">나의 정보</a>
				<div id="line_2"></div>
				<a href="<%=request.getContextPath() %>/views/member/mypage/myInfoUpdate.jsp" id="update">개인정보수정</a>
				<div id="line_3"></div>
				<a href="<%=contextPath %>/myPost.me?cPage=1" id="write_board">작성한 게시글</a>
				<div id="line_4"></div>
<%-- 				<a href="<%=contextPath %>/likeList.me?currentPage=1" id="like_board">좋아요한 게시글</a> --%>
				<div id="line_5"></div>
				
				<%if(loginUser != null && loginUser.getUserId().equals("admin") )  {%>
	                <a href="<%=contextPath %>/MemberList.me?" id="user_con">회원 관리</a>
					<div id="line_5"></div>
					
					<a href="<%=contextPath %>/BlackList.me?" id="blackList">블랙리스트</a>
					<div id="line_6"></div>
                <%}else {%>
                	<a href="<%=contextPath %>/UserDelete.me?userNo=" id="out">회원 탈퇴</a>
                	<div id="line_5"></div>
                <%} %>
			</div>
			<div id="content_2">
				<div id="content_2_1">
					<p id="pp">작성한 게시글</p>
					<div id="line_7"></div>
					<br>
					
					<table id="list-area" border="1">
						<thead>
							<tr height="50">
								<th style="width: 5%;"><input type="checkbox" id="checkAll" onclick="checkall();"></th>
								<th style="width: 10%;">No.</th>
								<th style="width: 15%">게시판</th>
								<th style="width: 50%;">제목</th>
								<th style="width: 15%;">작성일</th>
								<th style="width: 5%;">조회</th>
							</tr>
						</thead>
						<tbody>
							<%if(list.isEmpty()) {%>
								<tr height="40">
									<td colspan="6">조회된 게시글이 없습니다.</td>
								</tr>
							<%} else {%>
								<%for(BoardCommon bc : list) {%>
									<tr height="40">
										<td><input type="checkbox" class="check" name="bno" value="<%=bc.getBoardNo() %>"></td>
										<td><%=bc.getBoardNo() %></td>
										<td><%=bc.getBoardName() %></td>
										<td><%=bc.getBoardTitle() %></td>
										<td><%=bc.getCreateDate() %></td>
										<td><%=bc.getCount() %></td>
									</tr>
								<%} %>
							<%} %>
						</tbody>
					</table>
					<br>
					<div id="button-area" align="right">
						<a class="btn btn-light" onclick="deleteMypost();">삭제</a>
					</div>
					
					<br><br><br><br>
					
					<div align="center" id="paging-area">
						<%if(pi.getStartPage() != 1) {%>
							<button class="btn btn-outline-dark" onclick="location.href='<%=contextPath%>/myPost.me?cPage=<%=pi.getStartPage()-10 %>';">&lt;&lt;</button>
						<%} %>
						<%if(pi.getCurrentPage() != 1) {%>
							<button class="btn btn-outline-dark" onclick="location.href='<%=contextPath%>/myPost.me?cPage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
						<%} %>
					    <%for(int i=pi.getStartPage();i<=pi.getEndPage();i++) {%>
					    	<!-- 내가 보고있는 페이지 버튼은 비활성화 하기 -->
					    	<%if(i != pi.getCurrentPage()) {%>
					    		<button class="btn btn-outline-dark" onclick="location.href='<%=contextPath%>/myPost.me?cPage=<%=i%>';"><%=i %></button>
					    	<%} else { %> <!-- 내가 보고있는 페이지의 버튼을 누른다면 -->
					    		<button class="btn btn-outline-dark"><%=i %></button>
					    	<%} %>
					    <%} %>
					    <%if(pi.getCurrentPage() != pi.getMaxPage()) {%>
					    	<button class="btn btn-outline-dark" onclick="location.href='<%=contextPath%>/myPost.me?cPage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
					    <%} %>
					    <%if(pi.getEndPage() != pi.getMaxPage()) {%>
							<button class="btn btn-outline-dark" onclick="location.href='<%=contextPath%>/myPost.me?cPage=<%=pi.getStartPage()+10 %>';">&gt;&gt;</button>
						<%} %>
					</div>
				</div>
			</div>
			
			<script>
				var checkCount = 0;
				
				$(function() {
					
					$("input[class=check]").change(function() {
						if($(this).is(":checked")) {
							checkCount++;
							console.log(checkCount);
						}
						else {
							checkCount--;
							console.log(checkCount);
						}
						
						if(checkCount == $("input[class=check]").length) {
							$("#checkAll").prop("checked", true);
						}
						else {
							$("#checkAll").prop("checked", false);
						}
					});
					
					$("#list-area>tbody>tr>td").click(function() {
						var str = $(this).html();
						if(str.indexOf('input') == -1) {
							var bno = $(this).parent().children().eq(1).text(); // 게시글 번호
							var bname = $(this).parent().children().eq(2).text(); // 게시판 이름
							location.href = "<%=contextPath%>/searchBoard.bo?bno=" + bno + "&bname=" + bname;
						}
					});
				})
			
				function checkall() {
					if($("#checkAll").prop("checked")) {
						$("input[class=check]").prop("checked", true);
						checkCount=10;
					}
					else {
						$("input[class=check]").prop("checked", false);
						checkCount=0;
					}
				}
				
				function deleteMypost() {
					var str = "";
					$("input[class=check]:checked").each(function() {
						str += "bno=" + $(this).val() + "&";
					})
					
					if(str == "") {
						alert("선택된 게시글이 없습니다.");
					}
					else {
						if(confirm("정말 삭제하시겠습니까?")) {
							location.href = "<%=contextPath%>/deletePost.bo?" + str;
						}
					}
				}
			</script>
		</div>
	</div>
	<%@ include file = "../../common/footer.jsp" %>
</body>
</html>