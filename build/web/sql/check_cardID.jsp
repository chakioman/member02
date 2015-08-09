<%-- 
    Document   : check_ID
    Created on : 5 ส.ค. 2558, 12:14:56
    Author     : kamchaipoonpanitupatum
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="org.json.simple.JSONObject"%>
<%
    String sql_CardID = request.getParameter("cardID_get");
    JSONObject obj=new JSONObject();
    
    if(request.getParameter("cardID_get") != null){
        Connection connect = null;
        Statement s = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connect =  DriverManager.getConnection("jdbc:mysql://chidethailand.com:3306/chidetha_db?user=chakioman&password=Wxwsomujiyd99");
            s = connect.createStatement();
            String sql = "SELECT * FROM  member WHERE  CardID = '" + sql_CardID + "' ";
            ResultSet rec = s.executeQuery(sql);

            if(sql_CardID.length()!=13){
                obj.put("text","<font color=red>เลขประจำตัวประชาชนไม่ครบ 13 ตัว !!</font>");
                obj.put("validate_CardID",new Boolean(false));
                out.print(obj);
                out.flush();
            }else if(!rec.next()) {   
                obj.put("text","<font color=blue>เลขประจำตัวนี้สามารถใช้ได้</font>");
                obj.put("validate_CardID",new Boolean(true));
                out.print(obj);
                out.flush();
            } else{
                obj.put("text","<font color=red>มีผู้ใช้เลขประจำตัวนี้แล้ว!</font>");
                obj.put("validate_CardID",new Boolean(false));
                out.print(obj);
                out.flush();
            }
        }catch (Exception e) {
            out.println(e.getMessage());
            e.printStackTrace();
            }try {
                if(s!=null){
                s.close();
                connect.close();
                }
            } catch (SQLException e) {
                out.println(e.getMessage());
                e.printStackTrace();
            }
    }
%>
