package com.crochet.servlet;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Get form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");


        // Generate Workshop ID
        Random r = new Random();

        String id = "CR" + (1000 + r.nextInt(9000));


        // Create session
        HttpSession session = request.getSession();


        // Store data in session
        session.setAttribute("name", name);
        session.setAttribute("email", email);
        session.setAttribute("id", id);


        // Redirect to confirmation page
        response.sendRedirect("success.jsp");

    }

}