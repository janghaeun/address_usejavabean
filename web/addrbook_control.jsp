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

    if (action.equals("insert")){
        if (ad.insertDB(addrbook)){
            out.println("<script>alert(action)</script>");
            response.sendRedirect("addrbook_control.jsp?action=list");
        }else {
            try {
                throw new Exception("DB ERROR");
            } catch (Exception e) {

                e.printStackTrace();
            }

        }
    }else {
        out.println("<script>alert('action 파라미터를 확인해주세요!!!')</script>");
    }

%>