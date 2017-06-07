<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
</head>
<body>
    <table class="board_view">
        <colgroup>
            <col width="15%"/>
            <col width="35%"/>
            <col width="15%"/>
            <col width="35%"/>
        </colgroup>
        <caption>게시글 상세</caption>
        <tbody>
            <tr>
                <th scope="row">글 번호</th>
                <td>${map.num }</td>
                <th scope="row">조회수</th>
                <td>${map.hit_count }</td>
            </tr>
            <tr>
                <th scope="row">작성자</th>
                <td>${map.writer }</td>
                <th scope="row">작성시간</th>
                <td>${map.date }</td>
            </tr>
            <tr>
                <th scope="row">제목</th>
                <td colspan="3">${map.title }</td>
            </tr>
            <tr>
                <td colspan="4">${map.content }</td>
            </tr>
            <tr>
                <th scope="row">첨부파일</th>
                <td colspan="3">
                    <c:forEach var="row" items="${list }">
                        <input type="hidden" id="IDX" value="${row.num }">
                        <a href="#this" name="file">${row.original_name }</a>
                        (${row.file_size }kb)</br>
                    </c:forEach>
                </td>
            </tr>

        </tbody>
    </table>
     
    <a href="#this" class="btn" id="list">목록으로</a>
    <a href="#this" class="btn" id="update">수정하기</a>
     
    <%@ include file="/WEB-INF/include/include-body.jsp" %>
    
    <script type="text/javascript">
    
        $(document).ready(function(){
            $("#list").on("click", function(e){ //목록으로 버튼
                e.preventDefault();
                fn_openBoardList();
            });
             
            $("#update").on("click", function(e){
                e.preventDefault();
                fn_openBoardUpdate();
            });
              
        	$("a[name='file']").on("click", function(e){
        	e.preventDefault();
        	fn_downloadFile($(this));
      	  });
        });
        
        function fn_openBoardList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />");
            comSubmit.submit();
        }
         
        function fn_openBoardUpdate(){
            var idx = "${map.num}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/sample/openBoardUpdate.do' />");
            comSubmit.addParam("IDX", idx);
            alert(idx);
            comSubmit.submit();
        }
        
        function fn_downloadFile(obj){
        	var idx = obj.parent().find("#IDX").val();
        	var comSubmit = new ComSubmit();
        	comSubmit.setUrl("<c:url value='/common/downloadFile.do' />");
        	comSubmit.addParam("IDX", idx);
        	alert("<c:url value='/common/downloadFile.do' />");
        	comSubmit.submit();
        }
    </script>
</body>
</html>
