<%-- 
    Document   : insert_member
    Created on : 31 ก.ค. 2558, 21:10:50
    Author     : kamchaipoonpanitupatum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
 
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ThaiCreate.Com JSP Tutorial</title>
        
</head>
<body>
	
	<%
          
    
	
       
	Connection connect = null;
	Statement s = null;
	
	try {
		
		Class.forName("com.mysql.jdbc.Driver");
		connect =  DriverManager.getConnection("jdbc:mysql://chidethailand.com:3306/chidetha_db?user=chakioman&password=Wxwsomujiyd99");
		
		s = connect.createStatement();
		
                request.setCharacterEncoding("UTF-8");
                
                
                String sql_CardID = request.getParameter("frm_CardID");
                String sql_Name = request.getParameter("frm_Name");
                String sql_Lastname = request.getParameter("frm_Lastname");
                String sql_Nickname = request.getParameter("frm_Nickname");
                String sql_DateOfBirth = request.getParameter("frm_DateOfBirth");
                
                String sql_Address = request.getParameter("frm_Address");
                String sql_Phonenumber = request.getParameter("frm_Phonenumber");
                String sql_Email = request.getParameter("frm_Email");
                String sql_LineID = request.getParameter("frm_LineID");
                String sql_IG = request.getParameter("frm_IG");
                
                String sql_Facebookname = request.getParameter("frm_Facebookname");
                String sql_SaleArea1 = request.getParameter("frm_SaleArea1");
                String sql_SaleArea2 = request.getParameter("frm_SaleArea2");
                String sql_SaleArea3 = request.getParameter("frm_SaleArea3");
                String sql_SaleArea4 = request.getParameter("frm_SaleArea4");
                
                String sql_ProfileStudy = request.getParameter("frm_ProfileStudy");
                String sql_ProfileWork = request.getParameter("frm_ProfileWork");
                String sql_Studyrank = request.getParameter("frm_Studyrank");
                String sql_Workrank = request.getParameter("frm_Workrank");
                String sql_InterrestingProducts = request.getParameter("frm_InterrestingProducts");
                
                String sql_InterrestingIncone = request.getParameter("frm_InterrestingIncone");
                String sql_InterrestingUsing = request.getParameter("frm_InterrestingUsing");
                String sql_InterrestingOther = request.getParameter("frm_InterrestingOther");
                String sql_RuleOfOrganization = request.getParameter("frm_RuleOfOrganization");
                String sql_Username = request.getParameter("frm_Username");
                
                String sql_Password = request.getParameter("frm_Password");
                String sql_Team = request.getParameter("frm_Team");
                String sql_Country = request.getParameter("frm_Country");
                String sql_Zone = request.getParameter("frm_Zone");
                String sql_MemberID = request.getParameter("frm_MemberID");
                
                String sql_DateOfApprove = request.getParameter("frm_DateOfApprove");
                String sql_OrganizationRank = request.getParameter("frm_OrganizationRank");
                String sql_PicProfile = request.getParameter("frm_PicProfile");
                String sql_ScaneRegister = request.getParameter("frm_ScaneRegister");
                String sql_Header = request.getParameter("frm_Header");
                
                String sql_Pointer = "11111";
       
                
                
                
                
                String sql2 = "INSERT INTO `chidetha_db`.`member` ("
                        + "`CardID`, `Name`, `Lastname`, `Nickname`, `DateOfBirth`, "
                        + "`Address`, `Phonenumber`, `Email`, `LineID`, `IG`, "
                        + "`Facebookname`, `SaleArea1`, `SaleArea2`, `SaleArea3`, `SaleArea4`, "
                        + "`ProfileStudy`, `ProfileWork`, `Studyrank`, `Workrank`, `InterrestingProducts`, "
                        + "`InterrestingIncone`, `InterrestingUsing`, `InterrestingOther`, `RuleOfOrganization`, `Username`, "
                        + "`Password`, `Team`, `Country`, `Zone`, `MemberID`, "
                        + "`DateOfApprove`, `OrganizationRank`, `PicProfile`, `ScaneRegister`, `Header`, "
                        + "`Pointer`) VALUES ("
                        + "'"+sql_CardID+"', '"+sql_Name+"', '"+sql_Lastname+"', '"+sql_Nickname+"', '"+sql_DateOfBirth+"', "
                        + "'"+sql_Address+"', '"+sql_Phonenumber+"', '"+sql_Email+"', '"+sql_LineID+"', '"+sql_IG+"', "
                        + "'"+sql_Facebookname+"', '"+sql_SaleArea1+"', '"+sql_SaleArea2+"', '"+sql_SaleArea3+"', '"+sql_SaleArea4+"', "
                        + "'"+sql_ProfileStudy+"', '"+sql_ProfileWork+"', '"+sql_Studyrank+"', '"+sql_Workrank+"', '"+sql_InterrestingProducts+"', "
                        + "'"+sql_InterrestingIncone+"', '"+sql_InterrestingUsing+"', '"+sql_InterrestingOther+"', '"+sql_RuleOfOrganization+"', '"+sql_Username+"', "
                        + "'"+sql_Password+"', '"+sql_Team+"', '"+sql_Country+"', '"+sql_Zone+"', '"+sql_MemberID+"', "
                        + "'"+sql_DateOfApprove+"', '"+sql_OrganizationRank+"', '"+sql_PicProfile+"', '"+sql_ScaneRegister+"', '"+sql_Header+"', "
                        + "'"+sql_Pointer+"');";
                
                
                
         //s.execute(sql2);
        
         out.print(sql2);
        
	  		
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
	%>
</body>
</html>