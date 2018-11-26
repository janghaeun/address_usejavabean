<%--
  Created by IntelliJ IDEA.
  User: haeun
  Date: 2018-11-26
  Time: 오후 1:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.*" %>
<%@page import="jspbook.*" %>
<html>
<head>

    <meta charset="utf-8">
    <link rel="stylesheet" href="addrbook.css" type="text/css" media="screen"/>
    <script type="text/javascript">
        function check(id) {
            pwd = prompt('수정/삭제 하려면 비밀번호를 넣으세요.');
            document.location.href="addrbook_control.jsp?action=edit&id"+id+"&upassword="+pwd;
            }
            </script>
</head>
<body>
    <jsp:useBean id="dataset" scope="request" class="java.util.ArrayList"/>

    <div align="center">
        <h2>주소록: 주소록내용</h2>
        <hr>

        <form>
            <a href="addrbook_form.jsp">주소록 등록</a> <p>
            <table border="1">
                <tr>
                    <th>번 호</th><th>이 름</th><th>전화번호</th><th>회 사</th>
                </tr>
            <%
                for(AddrBook ab : (ArrayList<AddrBook>)dataset) {
            %>
            <tr>
                <td><a href="javascript:check(<%=ab.getId()%>)"><%=ab.getId()%></a> </td>
                <td><%=ab.getName()%></td>
                <td><%=ab.getTel()%></td>
                <td><%=ab.getCompany()%></td>
            </tr>
            <%
                }
            %>

        </table>
        </form>
    </div>
</body>
</html>
