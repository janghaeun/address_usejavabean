<%--
  Created by IntelliJ IDEA.
  User: haeun
  Date: 2018-11-26
  Time: 오전 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@page import="jspbook.*" %>
<%--<%@ page import="jspbook.AddrBean" %>--%>
<%--<%@page import="jspbook.AddrBook" %>--%>
<%@ page import="java.util.*" %>
<%request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="ad" class ="jspbook.AddrBean"/>

<jsp:useBean id="addrbook" class="jspbook.AddrBook"/>
<jsp:setProperty name="addrbook" property="*"/>

<%

    String action = request.getParameter("action");

    //주소록 목록을 출력하는 addrbook_list문서로 분기
    if (action.equals("list")) {

        ArrayList<AddrBook> datalist = ad.getDBList();
        request.setAttribute("dataset", datalist);
        pageContext.forward("addrbook_list.jsp");
    }

    //회원 정보를 database에 입력하고 addrbook_control.jsp를 통해 addrbook_list.jsp를 출력
    if(action.equals("insert")){
        if (ad.insertDB(addrbook)){
            out.println("<script>alert(action)</script>");
            response.sendRedirect("addrbook_control.jsp?action=list");
        }else {
            throw new Exception("DB ERROR");
        }
    }else {
        out.println("<script>alert('action 파라미터를 확인해주세요!!!')</script>");
    }

%>