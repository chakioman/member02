<%-- 
    Document   : container_admin
    Created on : 30 ก.ค. 2558, 18:43:38
    Author     : kamchaipoonpanitupatum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/container.css">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String Orank = String.valueOf(session.getAttribute("sesOrank"));
            if(!Orank.equals("admin"))response.sendRedirect("error.jsp"); 
            //if((session.getAttribute("sesOrank")=="null")||(session.getAttribute("sesUserID")=="null"))response.sendRedirect("error.jsp");
        %>
        <div id="all">
            <div id="box_login">
            <div class="item_login">
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
            </div>
                
            <div id="box_body">    
            <div id="box_linklist">  
                <a href="box/home_admin.jsp" target="frame_box">home</a><br>
                <a href="box/register_admin.jsp" target="frame_box">register</a>
            </div>
            
            <iframe id="iframe_inbox" src="box/home_admin.jsp" name="frame_box" ></iframe>
            </div>
        </div>
        
    </body>
</html>
