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
@WebServlet(name = "check_cardID", urlPatterns = {"/check_cardID"})
public class check_cardID extends HttpServlet {

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
                    obj.put("validate_CardID",false);
                    out.print(obj);
                    out.flush();
                }else if(!rec.next()) {   
                    obj.put("text","<font color=blue>เลขประจำตัวนี้สามารถใช้ได้</font>");
                    obj.put("validate_CardID",true);
                    out.print(obj);
                    out.flush();
                } else{
                    obj.put("text","<font color=red>มีผู้ใช้เลขประจำตัวนี้แล้ว!</font>");
                    obj.put("validate_CardID",false);
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
