<%-- 
    Document   : register_admin
    Created on : 31 ก.ค. 2558, 15:25:42
    Author     : kamchaipoonpanitupatum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="../css/box_register.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/le-frog/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script>
            //var for validate input
            var validate_Header = false;
            var validate_CardID = false;
            
            function fncSubmit(){//run for validate input before sent to sql/insert_member.jsp
                if(!validate_Header){
                    $('#input_HeaderID').focus();
                    return false;
                }else if(!validate_CardID){
                    $('#input_cardID').focus();
                    return false;
                }      
                $('form#form_background').submit();
            }

            function chkNumber(ele){//for contorl in put interger
                var vchar = String.fromCharCode(event.keyCode);
                if ((vchar<'0' || vchar>'9')) return false;
                ele.onKeyPress=vchar;
            }
            
            $(document).ready(function(){//run for check input
                change_ipout_header();
                change_input_cardID();
            });
            
            //check headerID and return name header
            function change_ipout_header(){
                $('#input_HeaderID').change(function(){
                    getNameHerader();   
                });
            }
            function getNameHerader(){
               var inputIDheader = $('#input_HeaderID').val();
               $.ajax({
                   url:'../sql/check_HeaderID.jsp',
                   data : {ID:inputIDheader},
                   dataType : 'json',
                   success: function(data){
                        $('div#showresult_HeaderID').html(data.text);                      
                        validate_Header = data.validate_HeaderID;
                   }                 
               });
            }
            
            //check cardID 
            function change_input_cardID(){
                $('#input_cardID').change(function(){
                    check_cardID();    
                });
            }
            function check_cardID(){
               var cardID_set = $('#input_cardID').val();
                $.ajax({
                   url:'../sql/check_cardID.jsp',
                   data : {cardID_get:cardID_set},
                   dataType : 'json',
                   success: function(data){
                        $('div#showresult_cardID').html(data.text);                    
                        validate_CardID = data.validate_CardID;
                   }  
               });
            }
        </script>
        
    </head>
    <body>
        <%
                request.setCharacterEncoding("UTF-8");//for language
                String strUser = String.valueOf(session.getAttribute("sesUserID"));
                String strOrank = String.valueOf(session.getAttribute("sesOrank"));             
        %>
        
        <form id="form_register_admin" name="register_admin" method="post" onSubmit="return fncSubmit();"action="../sql/insert_member.jsp?Action=Login" > 
                <table>
                    <tr>
                        <td><h2>เพิ่มสมาชิกโดยผู้ดูแลระบบ</h2></td> 
                    </tr>
                    <tr class="validate_input_Header">
                        <td>คนแนะนำ</td>                                   
                        <td><input type="text" id="input_HeaderID" name="frm_Header" size="10" OnKeyPress="return chkNumber(this)"></td>
                        <td><div id="showresult_HeaderID"></div></td>
                    </tr>
                    <tr>
                        <td>หมายเลขบัตรประชาชน</td>                          
                        <td><input type="text" id="input_cardID" class="" name="frm_CardID" OnKeyPress="return chkNumber(this)"></td>
                        <td><div id="showresult_cardID"></div></td>
                    </tr>
                
                    <tr>
                        <td>เพศ</td>                        
                        <td><input type="radio" id="" name="frm_bile">ชาย
                            <input type="radio" id="" name="frm_bile">หญิง
                        </td><td>
                    </tr>                      
                    <tr>
                    <tr>
                        <td>ชื่อ</td>                                         
                        <td><input type="text" class="" name="frm_Name"></td>
                    </tr>
                    <tr>
                        <td>นามสกุล</td>                                     
                        <td><input type="text" id="" name="frm_Lastname"></td>
                    </tr>
                    <tr>
                        <td>ชื่อเล่น</td>                                      
                        <td><input type="text" id="" name="frm_Nickname"></td>
                    </tr>
                    <tr>
                        <td>วันเกิด</td>                                      
                        <td><input type="text" id="" name="frm_DateOfBirth"></td>
                    </tr>
                    <tr>
                        <td>ที่อยู่</td>                                        
                        <td><input type="text" id="" name="frm_Address"></td>
                    </tr>
                    <tr>
                        <td>หมายเลขโทรสัพย์</td>                              
                        <td><input type="text" id="" name="frm_Phonenumber"</td>
                    </tr>
                    <tr>
                        <td>email</td>                                      
                        <td><input type="text" id="" name="frm_Email"></td>
                    </tr>
                    <tr>
                        <td>line id</td>                                    
                        <td><input type="text" id="" name="frm_LineID"></td>
                    </tr>    
                    <tr>
                        <td>IG</td>                                         
                        <td><input type="text" id="" name="frm_IG"></td>
                    </tr>    
                    <tr>
                        <td>facebook name</td>                              
                        <td><input type="text" id="" name="frm_Facebookname"></td>
                    </tr>    
                    <tr>
                        <td>พื้นที่สนใจจำหน่าย<br/><br/><br/><br/></td>          
                        <td>1. <input type="text" id="" name="frm_SaleArea1"><br/>
                            2. <input type="text" id="" name="frm_SaleArea2"><br/>
                            3. <input type="text" id="" name="frm_SaleArea3"><br/>
                            4. <input type="text" id="" name="frm_SaleArea4"></td>
                    </tr>    
                    <tr>
                        <td>ประวัติการทำงาน</td><br/>                         
                        <td><input type="radio" id="" name="frm_ProfileStudyOrWork">กำลังศึกษา<br/>
                            <input type="radio" id="" name="frm_ProfileStudyOrWork">ทำงาน</td><td>
                    </tr>    
                    <tr>
                        <td>สถานศึกษาหรือสถานที่ทำงาน</td>                      
                        <td><input type="text" id="" name="frm_Studyrank"></td>
                    </tr>    
                    <tr>
                        <td>ชั้นปีหรือตำแหน่ง</td>                               
                        <td><input type="text" id="" name="frm_Workrank"></td>
                    </tr>  
                    <tr>
                        <td>ความสนใจในการเข้าร่วมครอบครัว<br/>CHI'DE(ตอบได้มากกว่า 1 ข้อ) <br/><br/><br/> </td>
                        <td><input type="radio" id="" name="frm_InterrestingProducts">สนใจผลิตภันฑ์<br/>
                            <input type="radio" id="" name="frm_InterrestingIncone">สนใจ รายได้<br/>
                            <input type="radio" id="" name="frm_InterrestingUsing">สยใชซื้อใช้ในราคาถูก<br/>
                            อื่นๆ<input type="text" id="" name=""></td>
                    </tr>             
                    <tr>
                        <td>ประวัติการขาย<br/><br/><br/><br/></td>          
                        <td>1. <input type="text" id="" name="frm_SaleArea1"><br/>
                            2. <input type="text" id="" name="frm_SaleArea2"><br/>
                            3. <input type="text" id="" name="frm_SaleArea3"><br/>
                            4. <input type="text" id="" name="frm_SaleArea4"></td></tr>                            
                    <tr>
                        <td>ท่านยอมรับเงื่อนไขของทาง<br/>ครอบครัว CHI'DE หรือไม่</td>           
                        <td><input type="radio" id="" name="frm_RuleOfOrganization">ยอมรับ<br/>
                        <input type="radio" id="" name="frm_RuleOfOrganization">ไม่ยอมรับ</td>
                    </tr>  
                    <tr>
                        <td>Username</td>                                           
                        <td><input name="frm_Username" type="text" id="txtUsername"></td>
                    </tr>  
                    <tr>
                        <td>Password</td>                                           
                        <td><input name="frm_Password" type="password" id="txtPassword"></td>
                    </tr>                                     
                    <tr>
                        <td>อัพโหลดรูปภาพโปรไฟล์</td>                                           
                        <td><input type="text" id="" name="frm_PicProfile"></td>
                    </tr>  
                    <tr>
                        <td>อัพโหลดใบสมัครตัวจริง</td>                                           
                        <td><input type="text" id="" name="frm_ScaneRegister"></td>
                    </tr>              
                    <tr>
                        <td>จำนวนการเปิดบิลครั้งแรก</td>                        
                        <td><input type="radio" id="" name="frm_bile">10
                            <input type="radio" id="" name="frm_bile">20
                            <input type="radio" id="" name="frm_bile">50</td><td></tr>                      
                    <tr>
                        <td><h2>ส่วนของadmin</h2></td>
                    </tr>           
                    <tr>
                        <td>ทีม</td>                                                              
                        <td><input type="text" id="" name="frm_Team"><br/></td>
                    </tr>  
                    <tr>
                        <td>ภาค</td>                                                            
                        <td><input type="text" id="" name="frm_Country"></td>
                    </tr>  
                    <tr>
                        <td>จังหวัด</td>                                                             
                        <td><input type="text" id="" name="frm_Zone"></td>
                    </tr>  
                    <tr>
                        <td>ลำดับที่</td>                                                       
                        <td><input type="text" id="" name="frm_MemberID"></td>
                    </tr>  
                    <tr>
                        <td>ตำแหน่ง</td>                                                          
                        <td><input type="text" id="" name="frm_OrganizationRank"></td>
                    </tr>  
                    <tr>
                        <td>วันที่ยืนยัน</td>                                                         
                        <td><input type="text" id="" name="frm_DateOfApprove"></td>
                    </tr>     
                </table>
                <input type="submit" name="Submit" value="ยืนยัน">
                    
               
        </form>
    </body>
</html>

<%
/*
             * 
             *   $('tr').each(function(){
                var ss = $(this).hasClass("validate_input_Header");
                alert($(this).html()+" :is re "+ ss);
            });
           
             * 
             *  function fncSubmit(){
                var showresult_header ;
                 if(showresult_header!=""){
                     $('#input_Header').focus();
                        return false;
                 }       
                $('form#form_background').submit();
            }
             * function getNameHerader(){
               var inputIDhreader = $('#input_Header').val();
               $.get('../sql/check_ID_Header.jsp',{ID:inputIDhreader},function(data){
                   $('div#showresult_header').html(data);
               
                   });
            }
             */
               
                

%>