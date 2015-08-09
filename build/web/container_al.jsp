<%-- 
    Document   : container_al
    Created on : 30 ก.ค. 2558, 18:44:18
    Author     : kamchaipoonpanitupatum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/box_login.css">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String Orank = String.valueOf(session.getAttribute("sesOrank"));
            if(!Orank.equals("al"))response.sendRedirect("error.jsp");
        %>
        <div id="all">
            <div id="box_login">
                <%
                String strUser = String.valueOf(session.getAttribute("sesUserID"));
                String strOrank = String.valueOf(session.getAttribute("sesOrank"));             
                out.print("User : " + strUser);
                out.print("<br>");
                out.print("rank :"+ strOrank);
                out.print("<br>");
                %>
                <a href="delete.jsp">logout</a>
            </div>             
            <div id="content">               
                
                
            </div>        
        </div>
        <h1>al</h1>
    </body>
</html>
