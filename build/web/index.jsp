<%-- 
    Document   : index
    Created on : 27 ก.ค. 2558, 15:52:27
    Author     : kamchaipoonpanitupatum

        <frame src="head.jsp" noresize="noresize" scrolling="no">
        <frame src="body.jsp" >       
        
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link type="text/css" rel="stylesheet" href="css/container.css"/>
            
        <title>chidethailand</title>
    </head>
    <body>
        <div id="all">
            <div id="box_login">
                <div class="item_login">
                    <%
                    String strUser = String.valueOf(session.getAttribute("sesUserID"));
                    String strOrank = String.valueOf(session.getAttribute("sesOrank"));
                    int n = 1;
                    if( strUser == "null" ){%>
                       <a class="login" id="login_home" href="container_login.jsp" target="_top">ลงชื่อเข้าสู่ระบบ</a><%
                    }
                    else{
                       out.print("User : " + strUser);
                       out.print("<br>");
                       out.print("rank :"+ strOrank);
                       out.print("<br>");
                       %><a href="delete.jsp">logout</a><%
                    }%>
                </div>
            </div> 
                         
                
                
            </div>        
        </div>
    </body>    
</html>