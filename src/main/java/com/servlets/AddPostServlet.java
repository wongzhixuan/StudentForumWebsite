/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.dao.PostDao;
import com.entities.Post;
import com.entities.User;
import com.helper.ConnectionProvider;
import com.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 *
 * @author Durgesh
 */
@MultipartConfig
public class AddPostServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            int cid = Integer.parseInt(request.getParameter("cid"));
            String pTitle = request.getParameter("pTitle");
            String pContent = request.getParameter("pContent");
            String pCode = request.getParameter("pCode");
            Part part = request.getPart("pic");
//            getting currentuser id
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");

//            out.println("your post title is " + pTitle);
//            out.println(part.getSubmittedFileName());
            Post p = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), null, cid, user.getId());
            if (PostDao.savePost(p) > 0) {

                String path = request.getRealPath("/") + "blog_pics" + File.separator + part.getSubmittedFileName();
                Helper.saveFile(part.getInputStream(), path);
                out.println("done");
            } else {
                out.println("error");
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
