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
    String sql_ID = request.getParameter("ID");
    JSONObject obj=new JSONObject();
    
    if(request.getParameter("ID") != null){
        Connection connect = null;
        Statement s = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connect =  DriverManager.getConnection("jdbc:mysql://chidethailand.com:3306/chidetha_db?user=chakioman&password=Wxwsomujiyd99");
            s = connect.createStatement();
            String sql = "SELECT * FROM  member WHERE  ID = '" + sql_ID + "' ";
            ResultSet rec = s.executeQuery(sql);
                                if(sql_ID.length()!=9){   
                                    obj.put("text","<font color=red>รหัสสมาชิกผู้แนะนำไม่ครบ 9 ตัว !!</font>");
                                    obj.put("validate_HeaderID",new Boolean(false));
                                    out.print(obj);
                                    out.flush();
                                }else if(!rec.next()){   
                                    obj.put("text","<font color=red>รหัสสมาชิกผู้แนะนำไม่ถูกต้อง !!</font>");
                                    obj.put("validate_HeaderID",new Boolean(false));
                                    out.print(obj);
                                    out.flush();
                                } else{
                                    String name = rec.getString("Name");                
                                    obj.put("text","<font color=blue>รหัสสมาชิกผู้แนะนำถูกต้อง ชื่อผู้แนะนำคือ "+name+"</font>");
                                    obj.put("validate_HeaderID",new Boolean(true));
                                    out.print(obj);
                                    out.flush();
                                }
        } catch (Exception e) {
            out.println(e.getMessage());
            e.printStackTrace();
        }
        try {
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
