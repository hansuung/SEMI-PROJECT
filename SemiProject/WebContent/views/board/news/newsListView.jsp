<%@page import="com.udong.common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.udong.board.news.model.vo.NewsBoard"%>
<%
	ArrayList<NewsBoard> nlist = (ArrayList<NewsBoard>)request.getAttribute("nlist");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동네 소식</title>
<style>
	@font-face {
    font-family: 'BMJUA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	
	}
	div{
            /* border: 1px solid black; */
            box-sizing: border-box;
        }

        /* 전체 틀 (가로 1500 세로 2000) */
        .wrap{ 
        	position:relative;
            z-index:1;
            height: 1530px;
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
            /* background-color: green; */
            position: relative;
        }

        #content_1>p{ /*정보공유 글씨, 위치*/
            position: absolute;
            top: 40px;
            left: 52px;
            font-size: 50px;
/*             font-weight: 700; */
            font-family: 'BMJUA';
            
        }

        #line_1 {
            position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 115px;
            left: 30px;
        }

        #news{ /*동네 소식 글씨, 위치*/
            position: absolute;
            font-size: 35px;
            text-decoration: none;
            color: black;
            left: 52px;
            top: 130px;
            font-family: 'BMJUA';
            
        }

        #line_2 {
            position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 190px;
            left: 30px;
        }

        #clean { /*살림 꿀팁 글씨, 위치*/
            position: absolute;
            font-size: 35px;
            text-decoration: none;
            color: black;
            left: 52px;
            top: 205px;
            font-family: 'BMJUA';
        }

        #line_3 {
            position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 265px;
            left: 30px;
        }

        #recipe{ /*자취 레시피 글씨, 위치*/
            position: absolute;
            font-size: 35px;
            text-decoration: none;
            color: black;
            left: 52px;
            top: 280px;
            font-family: 'BMJUA';
        }

        #line_4 {
            position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 345px;
            left: 30px;
        }

        /*content2 안에 크기 지정 (가로 1100 세로 1500)*/
        #content_2>#content_2_1{ 
            width: 1100px;
            height: 1500px;
            border: 4px solid #C8EDC9;
            border-radius : 20px;
            position: absolute;
            top: 15px;
            left: 12px;
        }

        /*contente2 안에 있는 동네소식 글씨 , 위치*/
        #content_2_1>p{ 
            position: absolute;
            top: 45px;
            left: 54px;
            font-size: 45px;
            font-weight: 500;
            font-family: 'BMJUA';
            
        }

        #line_5 {
            position: absolute;
            border: 1px solid black;
            width: 1010px;
            height: 0px;
            top: 120px;
            left: 45px;
        }

        /*지역선택, 카테고리 들어가는 박스*/
        #box{ 
            position: absolute;
            border: 1px solid black; 
            width: 1010px;
            height: 18%;
            top: 135px;
            left: 45px;
            border-radius: 30px;
        }

        /*지역선택 글씨, 위치*/
        #b1{ 
            float: left;
            font-size: 25px;
            font-weight: 600;
            margin : 30px 0 0 50px;
        }

        /*카테고리 글씨, 위치*/
        #b2{ 
            float: left;
            font-size: 25px;
            font-weight: 600;
            margin: 0 0 0 50px;
        }

        /*지역선택 안에 있는 form을 감싸는 div*/
        #location { 
            font-size: 18px;
            margin: 24px 0 0 165px;
        }

        /*지역선택하는 select 태그들*/
        .input, .select { 
            width: 200px;
            border: 1px solid #C4C4C4;
            box-sizing: border-box;
            border-radius: 10px;
            padding: 11px 13px;
            font-family: 'Roboto';
            font-style: normal;
            font-weight: 400;
            font-size: 14px;
            line-height: 16px;
            margin-right: 15px; 
        }

        /*checkbox들을 감싸고 있는 div*/
        #category{ 
            float: left;
            font-size: 18px;
            margin: 5px 0 0 16px;
            vertical-align: super;
            accent-color: darkgray; /*체크박스 색깔 바꾸기*/
        }

        /* 체크박스 사이 간격 조절 */
        label{
            margin-right: 15px;
        }

        #line_6 {
            position: absolute;
            border: 1px solid black;
            width: 1010px;
            height: 0px;
            top: 420px;
            left: 45px;
        }

        /* 게시글 테이블 */
        .list-area{
            /*border: 1px solid black;*/
            text-align: center;
            margin: 450px 0 0 80px;
            font-size: 17px;
        }
        
        .list-area>tbody>tr:hover{
        background-color: #DEF5DE;
        cursor: pointer;
    	}

        /* 글쓰기 버튼 */
        #write_btn{
            margin: 0 70px;
        }
        
</style>
</head>
<body>
	<%@ include file = "../../common/menubar.jsp" %>
	
	<div class="wrap">
        <div id="content">
            <div id="content_1">
                <p>정보 공유</p>
                <div id="line_1"></div>
                
                <a href="<%=contextPath %>/newsList.bo?currentPage=1" id="news">동네 소식</a>
                <div id="line_2"></div>
                
                <a href="<%=contextPath %>/cleanList.bo?currentPage=1" id="clean">살림 꿀팁</a>
                <div id="line_3"></div>
                
<!--                 <a href="" id="recipe">자취 레시피</a> -->
<!--                 <div id="line_4"></div> -->
            </div>
            <div id="content_2">
                <div id="content_2_1">
                    <p>동네 소식</p>
                    <div id="line_5"></div>

                    <div id="box">
                        <p id="b1">지역선택</p>
                        <form action="<%=contextPath %>/newsList.bo" id="newsSearch">
	                            <input type="hidden" name="currentPage" value="<%=pi.getCurrentPage() %>">
	                        <div id="location">
	                                	시/도:
	                                <select name="city" id="city" onchange="change(this.selectedIndex);"  class=input >
	                                    <option value='전체'>전체</option>
	                                    <option value='서울'>서울특별시</option>
	                                    <option value='부산'>부산광역시</option>
	                                    <option value='대구'>대구광역시</option>
	                                    <option value='인천'>인천광역시</option>
	                                    <option value='광주'>광주광역시</option>
	                                    <option value='대전'>대전광역시</option>
	                                    <option value='울산'>울산광역시</option>
	                                    <option value='경기'>경기도</option>
	                                    <option value='강원'>강원도</option>
	                                    <option value='충북'>충청북도</option>
	                                    <option value='충남'>충청남도</option>
	                                    <option value='전북'>전라북도</option>
	                                    <option value='전남'>전라남도</option>
	                                    <option value='경북'>경상북도</option>
	                                    <option value='경남'>경상남도</option>
	                                    <option value='제주'>제주도</option>
	                                </select>                                                  
	                                	구/군:
	                                <select name="county" id="county" class=select>
	                                    <option value=''>전체</option>
	                                </select>
	                            
	                        </div>
	                        <br><br><br>
	                        <p id="b2">카테고리</p>
	                        
	                        <div id="category" name="category">
	                            <input type="checkbox" class="check" id="real_time" value="실시간 우동"> <label for="real_time">실시간 우동</label> 
	                            <input type="checkbox" class="check" id="event" value="행사"><label for="event">행사</label> 
	                            <input type="checkbox" class="check" id="festival"  value="축제"> <label for="festival">축제</label> 
	                            <input type="checkbox" class="check" id="open"  value="신장 개업"> <label for="open">신장 개업</label>
	                            <input type="checkbox" class="check" id="danger"  value="사건/사고"> <label for="danger">사건/사고</label>
	                            <input type="checkbox" class="check" id="lost"  value="분실"> <label for="lost">분실</label>
	                           	<input type="checkbox" class="check" id="none"  value="실종"> <label for="none">실종</label>
	                           	<input type="checkbox" class="check" id="others"  value="기타"> <label for="others">기타</label>
	                           	
	                        </div>
	                        <br><br><br>
	                        
	
	                        <div align="center">
	                            <button type="reset" class="btn btn-light">초기화</button>
	                            <button type="button" class="btn btn-primary" onclick="newsSearch();">검색</button>
	                        </div>
	                        </form>
                    </div>
                    <div id="line_6"></div>
					
                    <table class="list-area" border="0" align="center">
                        <thead style="height: 50px; border-top:3px solid black; border-bottom:3px solid black;">
                        <tr>
                            <th width="80">No.</th>
                            <th width="465">제목</th>
                            <th width="160">작성자</th>
                            <th width="160">작성일</th>
                            <th width="75">조회</th>
<!--                             <th width="65">좋아요</th> -->
                        </tr>
                        </thead>
                        <tbody>
                        	<!-- 리스트 10개씩 출력? -->
                        	<%if(nlist.isEmpty()) {%> <!-- 만약 리스트가 비어있다면 -->
                        		<tr>
                        			<td colspan="6">글이 존재하지 않습니다</td>
                        		</tr>
                        	<%} else {%> <!-- 목록이 있으면 (반복문으로 전부 출력해주기) -->
                        		<%for(NewsBoard nb : nlist) {%> <!-- 순차적으로 전부 접근할 것이기 때문에 향상된 for문 사용 -->
		                        	<tr style="height: 40px; border-bottom:1px solid black;">
		                                <td><%=nb.getBoardNo() %></td> <!-- No. -->
		                                <td class="goDetail1"><%=nb.getBoardTitle() %></td> <!-- 제목 -->
		                                <td><a id="nicknameHover" onclick="whoareyou();"><%=nb.getBoardWriter() %></a> </td> <!-- 작성자  닉네임 -->
		                                <td><%=nb.getCreateDate() %></td> <!-- 작성한 날짜 -->
		                                <td><%=nb.getCount() %></td> <!-- 조회수 -->
<%-- 		                                <td><%=nb.getLikeCount() %></td> <!-- 좋아요한 수 --> --%>
		                            </tr>
                        		<%} %> 
                        	<%} %>
                        
                        </tbody>
                        </table>
                        <br>
                        <!-- 회원, 관리자만 글쓰기 가능 -->
                        <%if(loginUser != null) { %> 
	                        <div align="right" id="write_btn">
                            	<a onclick="goWrite();" class="btn btn-light">글쓰기</a>
                            	<script>
	                                function goWrite(){
	                                	var boardName = $(document).find("title").eq(0).text();
	                                	location.href="<%=contextPath %>/insert.bo?boardName="+boardName;
	                                };
                            	</script>
	                        </div>
                        <%} %>
                        <br>

                        <div align="center" class="paging-area">
    
                        	<%if(pi.getCurrentPage() != 1) {%>
                            	<button class="btn btn-outline-dark" onclick="location.href='<%=contextPath %>/newsList.bo?currentPage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
                            <%} %>
                            
                            <%for(int i = pi.getStartPage(); i <= pi.getEndPage(); i++) { %>
                            	<%if(i != pi.getCurrentPage()) {%>
                            	<button class="btn btn-outline-dark" onclick="location.href='<%=contextPath %>/newsList.bo?currentPage=<%=i%>';"><%=i %></button>
                            	<%} else {%>
                            		<button class="btn btn-outline-dark" disabled><%=i %></button>
                            	<%} %>
                            <%} %>
                            
                            <%if(pi.getCurrentPage() != pi.getMaxPage()) { %>
	                            <button class="btn btn-outline-dark" onclick="location.href='<%=contextPath %>/newsList.bo?currentPage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
                            <%} %>
                        </div>
                </div>
            </div>
        </div>
        </div>
    <script>
    
    $(function(){
    	//.list-area클래스 자손tbody 자손tr 클릭됐을때
// 	    $(".goDetail1").click(function(){
	        
// 	        var bno = $(this).parent().children().first().text();
// // 	        var nno = $(this).siblings().eq(0).text();
// // 	        console.log(nno);
	        
<%-- 	       	location.href = '<%=contextPath %>/newsDetail.bo?bno='+bno; --%>
// 	    });
    	
    	 $(".list-area>tbody").on("click","tr",function(){
    		var bno = $(this).children().first().text();
    		location.href = '<%=contextPath %>/newsDetail.bo?bno='+bno;
    	});
    });
    
    function newsSearch() {
    	var city = $("#city").val();
    	var county = $("#county").val();
    	
    	var str = ""
    	$("input[class=check]:checked").each(function() {
    		str += "NC=" + $(this).val() + "&";
    	});
    		str += "city=" + city + "&county=" + county
//     		console.log(str);
    		$.ajax({
    			url : "newsCategoryList.bo?"+str,
    			data : {
    				city : city,
    				county : county
    			},
    			type : "post",
    			success : function(nlist) {
    				$(".list-area").children("tbody").children().remove();
    				$(".paging-area").children().remove();
    				if(nlist[0] == null){
    					alert("검색된 게시물이 없습니다.");
    				}else {
    					var str = "";
    					var str2 = "";
    					var str3 = "";
    					if(nlist.length > 9) {
    						for(var i = 0; i < nlist.length; i++) {
    							if(i < 10) {
    								str += "<tr style='height: 40px; border-bottom:1px solid black;'>"
    									+ "<td>"+ nlist[i].boardNo +"</td>"
    									+ "<td class='goDetail1'>"+ nlist[i].boardTitle +"</td>"
    									+ "<td><a id='nicknameHover' onclick='hoareyou();'>"+ nlist[i].boardWriter +"</a></td>"
    									+ "<td>"+ nlist[i].createDate +"</td>"
    									+ "<td>"+ nlist[i].count +"</td>"
    									+ "<td>"+ nlist[i].likeCount +"</td>"
    									+ "<tr>"
    							}
    							if(i>9 && i< 19) {
    								str2 += "<tr style='height: 40px; border-bottom:1px solid black;'>"
    									+ "<td>"+ nlist[i].boardNo +"</td>"
    									+ "<td class='goDetail1'>"+ nlist[i].boardTitle +"</td>"
    									+ "<td><a id='nicknameHover' onclick='hoareyou();'>"+ nlist[i].boardWriter +"</a></td>"
    									+ "<td>"+ nlist[i].createDate +"</td>"
    									+ "<td>"+ nlist[i].count +"</td>"
    									+ "<td>"+ nlist[i].likeCount +"</td>"
    									+ "<tr>"
    							}
    							if(i>18) {
    								str3 += "<tr style='height: 40px; border-bottom:1px solid black;'>"
    									+ "<td>"+ nlist[i].boardNo +"</td>"
    									+ "<td class='goDetail1'>"+ nlist[i].boardTitle +"</td>"
    									+ "<td><a id='nicknameHover' onclick='hoareyou();'>"+ nlist[i].boardWriter +"</a></td>"
    									+ "<td>"+ nlist[i].createDate +"</td>"
    									+ "<td>"+ nlist[i].count +"</td>"
    									+ "<td>"+ nlist[i].likeCount +"</td>"
    									+ "<tr>"
    							}
    						}
    						
    					}else {
    						for(var i in nlist) {
    							str += "<tr style='height: 40px; border-bottom:1px solid black;'>"
									+ "<td>"+ nlist[i].boardNo +"</td>"
									+ "<td class='goDetail1'>"+ nlist[i].boardTitle +"</td>"
									+ "<td><a id='nicknameHover' onclick='hoareyou();'>"+ nlist[i].boardWriter +"</a></td>"
									+ "<td>"+ nlist[i].createDate +"</td>"
									+ "<td>"+ nlist[i].count +"</td>"
									+ "<td>"+ nlist[i].likeCount +"</td>"
									+ "<tr>"
    						}
    						$(".list-area").append(str);
    					}
    				}
    			},
    			error : function() {
    				alert("카테고리 조회 실패");
    			}
    		});
    		
    }
        
    window.onpageshow = function(event) {
	    if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
	        // Back Forward Cache로 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우
	        location.reload();
	    }
	}
	    
        var cnt = new Array();
        cnt[0] = new Array('전체');
        cnt[1] = new Array('전체','강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');
        cnt[2] = new Array('전체','강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');
        cnt[3] = new Array('전체','남구','달서구','동구','북구','서구','수성구','중구','달성군');
        cnt[4] = new Array('전체','계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군');
        cnt[5] = new Array('전체','광산구','남구','동구','북구','서구');
        cnt[6] = new Array('전체','대덕구','동구','서구','유성구','중구');
        cnt[7] = new Array('전체','남구','동구','북구','중구','울주군');
        cnt[8] = new Array('전체','고양시','과천시','광명시','구리시','군포시','남양주시','동두천시','부천시','성남시','수원시','시흥시','안산시','안양시','오산시','의왕시','의정부시','평택시','하남시','가평군','광주시','김포시','안성시','양주군','양평군','여주군','연천군','용인시','이천군','파주시','포천시','화성시');
        cnt[9] = new Array('전체','강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','황성군');
        cnt[10] = new Array('전체','제천시','청주시','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');
        cnt[11] = new Array('전체','공주시','보령시','서산시','아산시','천안시','금산군','논산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');
        cnt[12] = new Array('전체','군산시','김제시','남원시','익산시','전주시','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');
        cnt[13] = new Array('전체','광양시','나주시','목포시','순천시','여수시','여천시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','여천군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');
        cnt[14] = new Array('전체','경산시','경주시','구미시','김천시','문겅시','상주시','안동시','영주시','영천시','포항시','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군');
        cnt[15] = new Array('전체','거제시','김해시','마산시','밀양시','사천시','울산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','양산시','의령군','창녕군','하동군','함안군','함양군','합천군');
        cnt[16] = new Array('전체','서귀포시','제주시','남제주군','북제주군');
        function change(add) {
//         sel=document.getElementById("location")>county
//           /* 옵션메뉴삭제 */
//           for (i=sel.length-1; i>=0; i--){
//             sel.options[i] = null
//             }
//           /* 옵션박스추가 */
//           for (i=0; i < cnt[add].length;i++){                     
//                             sel.options[i] = new Option(cnt[add][i], cnt[add][i]);
//             }        
		for (i=$("#county").children().length-1; i>=0; i--){
			$("#county").children().remove();
		}
		for (i=0; i < cnt[add].length;i++){
			$("#county").append("<option>"+cnt[add][i]+"</option>");
		}
        }
        
   </script>
   <%@ include file = "../../common/footer.jsp" %>
</body>
</html>