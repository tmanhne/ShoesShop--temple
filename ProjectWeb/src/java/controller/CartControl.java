/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Entity.Product;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DBConnection;
import model.Dao;

/**
 *
 * @author DELL
 */
@WebServlet(name = "CartControl", urlPatterns = {"/cart"})
public class CartControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DBConnection dbconn = new DBConnection();
        Dao dao = new Dao(dbconn);

        HttpSession session = request.getSession();

        if (session.getAttribute("listCart") == null) {
            String pid = request.getParameter("pid");
            List<Product> list = new ArrayList<>();
            Product p = dao.add(pid);
            list.add(p);
            session.setAttribute("listCart", list);
        } else {
            String pid = request.getParameter("pid");
            List<Product> list = (List<Product>) session.getAttribute("listCart");
            int index = dao.checkId(pid, list);

            if (index == -1) {
                Product p = dao.add(pid);
                list.add(p);
            } else {
                int quantity = list.get(index).getQuantity() + 1;
                list.get(index).setQuantity(quantity);
            }
            session.setAttribute("listCart", list);
        }

        RequestDispatcher dispth
                = request.getRequestDispatcher("home");
        dispth.forward(request, response);
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
