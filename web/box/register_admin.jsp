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
            var validate_Header = true;
            var validate_CardID = true;
            var validate_frm_Sex = true;
            var validate_frm_ProfileStudyOrWork = false;
            var validate_Lastname = false;
            
            
            function fncSubmit(){//run for validate input before sent to sql/insert_member.jsp
                
                if(!validate_Header){
                    $('#input_HeaderID').focus();
                    return false;
                }else if(!validate_CardID){
                    $('#input_cardID').focus();
                    return false;
                }else if(!validate_frm_Sex){
                    $('#input_sexMale').focus();
                    return false;
                }else if($('#input_Name').val()==""){
                    $('#input_Name').focus();
                    return false;
                }else if($('#input_Lastname').val()==""){
                    $('#input_Lastname').focus();
                    return false;
                }else if($('#input_Nickname').val()==""){
                    $('#input_Nickname').focus();
                    return false;
                }else if($('#input_DateOfBirth_y').val()==0){
                    $('#input_DateOfBirth_y').focus();
                    return false;
                }else if($('#input_DateOfBirth_m').val()==0){
                    $('#input_DateOfBirth_m').focus();
                    return false;
                }else if($('#DateOfBirth_days').val()==0){
                    $('#DateOfBirth_days').focus();
                    return false;
                }else if($('#input_Address').val()==""){
                    $('#input_Address').focus();
                    return false;
                }else if($('#input_Phonenumber').val()==""){
                    $('#input_Phonenumber').focus();
                    return false;
                }else if($('#input_Email').val()==""){
                    $('#input_Email').focus();
                    return false;
                }else if($('#input_LineID').val()==""){
                    $('#input_LineID').focus();
                    return false;
                }else if($('#input_IG').val()==""){
                    $('#input_IG').focus();
                    return false;
                }else if($('#input_Facebookname').val()==""){
                    $('#input_Facebookname').focus();
                    return false;
                }else if($('#input_SaleArea1').val()==""){
                    $('#input_SaleArea1').focus();
                    return false;
                }else if(!validate_frm_ProfileStudyOrWork){
                    $('#input_ProfileStudy').focus();
                    return false;
                }else if($('#input_Studyrank').val()==""){
                    $('#input_Studyrank').focus();
                    return false;
                }else if($('#input_Workrank').val()==""){
                    $('#input_Workrank').focus();
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
                $('#input_cardID').change(function(){
                    check_cardID();    
                });
                
                change_input_Sex();
                
                $('#input_DateOfBirth_y').append($('<option />').val(0).html('ปี พ.ศ.'));
                for (i = new Date().getFullYear()+543; i > 1900; i--){
                    $('#input_DateOfBirth_y').append($('<option />').val(i).html(i));
                }
                //populate our months select box
                $('#input_DateOfBirth_m').append($('<option />').val(0).html('เดือน'));
                for (i = 1; i < 13; i++){
                    $('#input_DateOfBirth_m').append($('<option />').val(i).html(i));
                }
                updateNumberOfDays(); 

                //"listen" for change events
                $('#input_DateOfBirth_y, #input_DateOfBirth_m').change(function(){
                    updateNumberOfDays(); 
                });
                
                change_input_ProfileStudyOrWork();
            });
            //Sex
            function change_input_ProfileStudyOrWork(){
                $(':input[name="frm_ProfileStudyOrWork"]').change(function(){               
                    var x = document.getElementById("input_ProfileStudy").checked;
                    var y = document.getElementById("input_ProfileWork").checked;
                    if(x|y){
                        validate_frm_ProfileStudyOrWork = true;
                    }
                });

            }
            
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
            
            //Sex
            function change_input_Sex(){
                $(':input[name="frm_Sex"]').change(function(){               
                    var x = document.getElementById("input_sexMale").checked;
                    var y = document.getElementById("input_sexFemale").checked;
                    if(x|y){
                        validate_frm_Sex = true;
                    }
                });

            }
            
            //day
            
            function updateNumberOfDays(){
                $('#input_DateOfBirth_d').html('');
                month = $('#input_DateOfBirth_m').val();
                year = $('#input_DateOfBirth_y').val();
                days = daysInMonth(month, year);
                $('#input_DateOfBirth_d').append($('<option />').val('0').html('วัน'));    
                for(i=1; i < days+1 ; i++){
                        $('#input_DateOfBirth_d').append($('<option />').val(i).html(i));
                }
            }

            //helper function
            function daysInMonth(month, year) {
                return new Date(year, month, 0).getDate();
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
                        <td><input type="radio" id="input_sexMale" name="frm_Sex" value="ชาย">ชาย
                            <input type="radio" id="input_sexFemale" name="frm_Sex" value="หญิง">หญิง
                        </td><td>
                    </tr>                      
                    <tr>
                    <tr>
                        <td>ชื่อ</td>                                         
                        <td><input  type="text" id="input_Name" name="frm_Name"></td>
                    </tr>
                    <tr>
                        <td>นามสกุล</td>                                     
                        <td><input type="text" id="input_Lastname" name="frm_Lastname"></td>
                    </tr>
                    <tr>
                        <td>ชื่อเล่น</td>                                      
                        <td><input type="text" id="input_Nickname" name="frm_Nickname"></td>
                    </tr>
                    <tr>
                        <td>วันเกิด</td>                                      
                        <td>
                            <select id="input_DateOfBirth_y" name="frm_DateOfBirth_y"></select>
                            <select id="input_DateOfBirth_m" name="frm_DateOfBirth_m"></select>
                            <select id="input_DateOfBirth_d" name="frm_DateOfBirth_d"></select>
                        </td>
                    </tr>
                    <tr>
                        <td>ที่อยู่</td>                                        
                        <td><input type="text" id="input_Address" name="frm_Address"></td>
                    </tr>
                    <tr>
                        <td>หมายเลขโทรศัพท์</td>                              
                        <td><input type="text" id="input_Phonenumber" name="frm_Phonenumber" OnKeyPress="return chkNumber(this)"</td>
                    </tr>
                    <tr>
                        <td>email</td>                                      
                        <td><input type="text" id="input_Email" name="frm_Email"></td>
                    </tr>
                    <tr>
                        <td>line id</td>                                    
                        <td><input type="text" id="input_LineID" name="frm_LineID"></td>
                    </tr>    
                    <tr>
                        <td>IG</td>                                         
                        <td><input type="text" id="input_IG" name="frm_IG"></td>
                    </tr>    
                    <tr>
                        <td>facebook name</td>                              
                        <td><input type="text" id="input_Facebookname" name="frm_Facebookname"></td>
                    </tr>    
                    <tr>
                        <td>พื้นที่สนใจจำหน่าย<br/><br/><br/><br/></td>          
                        <td>1. <input type="text" id="input_SaleArea1" name="frm_SaleArea1"><br/>
                            2. <input type="text" id="input_SaleArea2" name="frm_SaleArea2"><br/>
                            3. <input type="text" id="input_SaleArea3" name="frm_SaleArea3"><br/>
                            4. <input type="text" id="input_SaleArea4" name="frm_SaleArea4"></td>
                    </tr>    
                    <tr>
                        <td>ประวัติการทำงาน</td><br/>                         
                        <td><input type="radio" id="input_ProfileStudy" name="frm_ProfileStudyOrWork">กำลังศึกษา
                            <input type="radio" id="input_ProfileWork" name="frm_ProfileStudyOrWork">ทำงาน</td><td>
                    </tr>    
                    <tr>
                        <td>สถานศึกษาหรือสถานที่ทำงาน</td>                      
                        <td><input type="text" id="input_Studyrank" name="frm_Studyrank"></td>
                    </tr>    
                    <tr>
                        <td>ชั้นปีหรือตำแหน่ง</td>                               
                        <td><input type="text" id="input_Workrank" name="frm_Workrank"></td>
                    </tr>  
                    <tr>
                        <td>ความสนใจในการเข้าร่วมครอบครัว<br/>CHI'DE(ตอบได้มากกว่า 1 ข้อ) <br/><br/><br/> </td>
                        <td><input type="radio" id="input_InterrestingProducts" name="frm_InterrestingProducts">สนใจผลิตภันฑ์<br/>
                            <input type="radio" id="input_InterrestingIncone" name="frm_InterrestingIncone">สนใจ รายได้<br/>
                            <input type="radio" id="input_InterrestingUsing" name="frm_InterrestingUsing">สยใชซื้อใช้ในราคาถูก<br/>
                            อื่นๆ<input type="text" id="input_InterrestingOther" name="frm_InterrestingOther"></td>
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