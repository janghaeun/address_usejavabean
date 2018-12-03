<%--
  Created by IntelliJ IDEA.
  User: haeun
  Date: 2018-11-26
  Time: 오후 2:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="addrbook.css" type="text/css" media="screen"/>

    <script type="text/javascript">
        function delcheck() {
            result = confirm("정말로 삭제하시겠습니까?");

            if(result==true){
                document.form1.action.value="delete";
                document.form1.submit();
            }else {
                return;
            }
        }
    </script>
</head>
<body>
    <jsp:useBean id="address" class="jspbook.AddrBook" scope="request"/>

    <div align="center">
        <h2>주소록: 주소 수정/삭제 </h2>
        <hr>
        [ <a href="addrbook_control.jsp?action=list">주소록 목록으로</a>]<p>
        <form name="form1" method="post" action="addrbook_control.jsp">
           <input type="hidden" name="id" value="<%=address.getId()%>">
            <input type="hidden" name="action" value="update">

            <table border="1">
                <tr>
                    <th>이 름</th>
                    <td><input type="text" name="name" value="<%=address.getName()%>"> </td>
                </tr>
                <tr>
                    <th>email</th>
                    <td><input type="text" name="email" value="<%=address.getEmail()%>"></td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td><input type="text" name="tel" value="<%=address.getTel()%>"> </td>
                </tr>
                <tr>
                    <th>회 사</th>
                    <td><input type="text" name="company" value="<%=address.getCompany()%>"> </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="저장">
                        <input type="reset" value="취소">
                        <input type="button" value="삭제" onclick="delcheck()">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
