<%-- 
    Document   : login
    Created on : 27 ก.ค. 2558, 16:31:36
    Author     : kamchaipoonpanitupatum

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ThaiCreate.Com JSP Tutorial</title>
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link type="text/css" rel="stylesheet" href="css/container_login.css">       
    </head>
    <body>	
            <div id="login_center" >
                <%   
                if(request.getParameter("Action") != null)	
                {

                        Connection connect = null;
                        Statement s = null;

                        try {
                                Class.forName("com.mysql.jdbc.Driver");

                                connect =  DriverManager.getConnection("jdbc:mysql://chidethailand.com:3306/chidetha_db?user=chakioman&password=Wxwsomujiyd99");

                                String username = request.getParameter("txtUsername");
                                String password = request.getParameter("txtPassword");

                                //String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
                                //System.out.println(gRecaptchaResponse);
                                //boolean verify = VerifyRecaptcha.verify(gRecaptchaRqesponse);

                                s = connect.createStatement();

                                String sql = "SELECT * FROM  member WHERE " +
                                " Username = '" + username + "' AND " + 
                                " Password = '" + password + "' ";

                                ResultSet rec = s.executeQuery(sql);

                                if(!rec.next())
                                {
                                        out.print("<font color=red>Username and Password Incorrect!</font>");

                                } else {

                                        String Orank = rec.getString("OrganizationRank");

                                        rec.first();
                                        session.setAttribute("sesUserID",rec.getString("Name"));	
                                        session.setAttribute("sesOrank",Orank);


                                        if(Orank.equals("admin")){
                                            response.sendRedirect("container_admin.jsp");
                                        }else if(Orank.equals("cd")){
                                            response.sendRedirect("container_cd.jsp");
                                        }else if(Orank.equals("al")){
                                            response.sendRedirect("container_al.jsp");
                                        }else if(Orank.equals("ld")){
                                            response.sendRedirect("container_ld.jsp");
                                        }


                                }

                                } catch (Exception e) {
                                        // TODO Auto-generated catch block
                                        out.println(e.getMessage());
                                        e.printStackTrace();
                                }

                                try {
                                        if(s!=null){
                                                s.close();
                                                connect.close();
                                        }
                                } catch (SQLException e) {
                                        // TODO Auto-generated catch block
                                        out.println(e.getMessage());
                                        e.printStackTrace();
                                }

                }
                %>
                <form class="center" name="frmLogin" method="post" action="container_login.jsp?Action=Login">
                    <p>Login</p>
                    Username
                    <br>
                    <input name="txtUsername" type="text" id="txtUsername">
                    <br>
                    Password
                     <br>
                    <input name="txtPassword" type="password" id="txtPassword">

                    <br>
                    <br>
                    <input type="submit" name="Submit" value="Login">
              </form>        
            </div>
    </body>
</html>
