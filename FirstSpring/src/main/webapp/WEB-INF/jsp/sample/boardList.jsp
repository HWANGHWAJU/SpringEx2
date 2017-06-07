<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
</head>
<body>
    <h2>게시판 목록</h2>
    <table class="board_list">
        <colgroup>
            <col width="10%"/>
            <col width="*"/>
            <col width="15%"/>
            <col width="20%"/>
        </colgroup>
        <thead>
            <tr>
                <th scope="col">글번호</th>
                <th scope="col">제목</th>
                <th scope="col">조회수</th>
                <th scope="col">작성일</th>
            </tr>
        </thead>
        <tbody>
  

        </tbody>
    </table>

	<div id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
	
    <br/>
    <a href="#this" class="btn" id="write">글쓰기</a>
     
    <%@ include file="/WEB-INF/include/include-body.jsp" %>
    
    <script type="text/javascript">
        $(document).ready(function(){
        	 fn_selectBoardList(1);
        	
            $("#write").on("click", function(e){ //글쓰기 버튼
                e.preventDefault();
                fn_openBoardWrite();
            });
             
            $("a[name='title']").on("click", function(e){ //제목
                e.preventDefault();
                fn_openBoardDetail($(this));
            });
        });
         
         
        function fn_openBoardWrite(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/sample/openBoardWrite.do' />");
            comSubmit.submit();
        }
         
        function fn_openBoardDetail(obj){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/sample/openBoardDetail.do' />");
            comSubmit.addParam("IDX", obj.parent().find("#IDX").val());
            comSubmit.submit();
        }

        function fn_selectBoardList(pageNo){
            var comAjax = new ComAjax();
            comAjax.setUrl("<c:url value='/sample/selectBoardList.do' />");
             comAjax.setCallback("fn_selectBoardListCallback");
            comAjax.addParam("PAGE_INDEX",pageNo);
            comAjax.addParam("PAGE_ROW", 15);
            comAjax.ajax();
        }
         
        function fn_selectBoardListCallback(data){
            var total = data.TOTAL;
            var body = $("table>tbody");
            
            body.empty();
            
            if(total == 0){
            	
                var str = "<tr>" +
                                "<td colspan='4'>조회된 결과가 없습니다.</td>" +
                            "</tr>";
                body.append(str);
                
            }
            else{
            	var str="<tr>"+"<td colspan='4'>"+total+"</td>"+"</tr>";
            	body.append(str);
   	
                var params = {
                    divId : "PAGE_NAVI",
                    pageIndex : "PAGE_INDEX",
                    totalCount : total,
                    eventName : "fn_selectBoardList"
                };
                
                gfn_renderPaging(params);
                 
                var str = "";
                $.each(data.list, function(key, value){
                    str += "<tr>" +
                                "<td>" + value.num + "</td>" +
                                "<td class='title'>" +
                                    "<a href='#this' name='title'>" + value.title + "</a>" +
                                    "<input type='hidden' name='title' value=" + value.num + ">" +
                                "</td>" +
                                "<td>" + value.hit_count + "</td>" +
                                "<td>" + value.date + "</td>" +
                            "</tr>";
                });
                body.append(str);
                 
                $("a[name='title']").on("click", function(e){ //제목
                    e.preventDefault();
                    fn_openBoardDetail($(this));
                });
            }
        }

   
	
        
    </script>
</body>
</html>
