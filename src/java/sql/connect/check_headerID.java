/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sql.connect;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import org.json.simple.JSONObject;

/**
 *
 * @author kamchaipoonpanitupatum
 */
@WebServlet(name = "check_headerID", urlPatterns = {"/check_headerID"})
public class check_headerID extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
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
            Boolean x ;
            
            
                                if(sql_ID.length()!=9){   
                                    
                                    obj.put("text","<font color=red>รหัสสมาชิกผู้แนะนำไม่ครบ 9 ตัว !!</font>");
                                    obj.put("validate_HeaderID",false);
                                    out.print(obj);
                                    out.flush();
                                }else if(!rec.next()){
                                    
                                    obj.put("text","<font color=red>รหัสสมาชิกผู้แนะนำไม่ถูกต้อง !!</font>");
                                    obj.put("validate_HeaderID",false);
                                    out.print(obj);
                                    out.flush();
                                } else{
                                    String name = rec.getString("Name");                
                                    obj.put("text","<font color=blue>รหัสสมาชิกผู้แนะนำถูกต้อง ชื่อผู้แนะนำคือ "+name+"</font>");
                                    obj.put("validate_HeaderID",true);
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
        
        
        
        
        
        
        out.close();
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
