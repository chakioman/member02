<%-- 
    Document   : delete
    Created on : 18 ก.ค. 2558, 11:16:03
    Author     : kamchaipoonpanitupatum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>ThaiCreate.Com JSP Tutorial</title>
        <link type="text/css" rel="stylesheet" href="css/container.css"/>
    </head>
    <body>
        <div id="all">
            
        
        <div id="box_login">
            <div class="item_login">
                <%
                session.invalidate ();
                %>             
                ออกจากระบบแล้ว<br><br>
                <a href="../home">กลับสู่หน้าหลัก</a>
            </div>
        </div> 
        </div>
    </body>
</html>