/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package hoan.servlet;

import hoan.registration.HistoryDAO;
import hoan.registration.RegistrationDAO;
import hoan.registration.RenterDTO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;

/**
 *
 * @author Mr Viet
 */
public class RegistrationServlet_for_renter extends HttpServlet {

    private final String REGISTRATION_PAGE = "registration_for_renter.jsp";
    private final String VIEW_FOR_HOST_PAGE = "view_for_host.jsp";

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
        String fullName = request.getParameter("txtFullName");
        String username = request.getParameter("txtUsername");
        String pass1 = request.getParameter("txtPassword1");
        String pass2 = request.getParameter("txtPassword2");
        String room = request.getParameter("room");
        String host = request.getParameter("host");
        String ms = "";
        String url = "";
        RenterDTO renter = null;

        try {

            RegistrationDAO dao = new RegistrationDAO();
            HistoryDAO history = new HistoryDAO();

            if (username.equals("") || pass1.equals("") || pass2.equals("") || fullName.equals("")) {
                ms = "please fill in all the blanks";
            } else if (!pass1.equals(pass2)) {
                ms = "confrim wrong password";
            } else if (dao.getAccount_for_renter(username) != null) {
                ms = "account already exists";
            } else {
                boolean rs = dao.addAccount_for_renter(username, pass2, fullName, room, host);
                if (rs) {
                    url = VIEW_FOR_HOST_PAGE;
                    renter = new RenterDTO(username, pass1, fullName, room, host, false);
                   

                    history.add_begin_date(host, fullName, room, username);
                } else {
                    url = REGISTRATION_PAGE;
                    ms = "An error occur";
                }
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
//            response.sendRedirect(url);

            if (url.equals(REGISTRATION_PAGE)) {
                request.setAttribute("ms", ms);
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else {
                request.getSession().getAttribute("renters_infor");
                HttpSession session = request.getSession();
                ArrayList<RenterDTO> renter_infor = (ArrayList<RenterDTO>) request.getSession().getAttribute("renters_infor");
                renter_infor.add(renter);
                session.removeAttribute("renters_infor");

                session.setAttribute("renters_infor", renter_infor);
                response.sendRedirect(url);
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
