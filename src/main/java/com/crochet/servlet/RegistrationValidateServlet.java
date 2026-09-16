package com.crochet.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/validateRegistration")
public class RegistrationValidateServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");

        if (name == null) {
            name = "";
        }

        if (email == null) {
            email = "";
        }

        name = name.trim();
        email = email.trim();


        if (name.isEmpty()) {

            response.getWriter().print(
                    "Name is required"
            );

        }
        else if (!name.matches("[a-zA-Z ]+")) {

            response.getWriter().print(
                    "Name must contain only letters"
            );

        }
        else if (email.isEmpty()) {

            response.getWriter().print(
                    "Email is required"
            );

        }
        else if (!email.matches(
                "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {

            response.getWriter().print(
                    "Enter a valid email address"
            );

        }
        else {

            response.getWriter().print(
                    "VALID"
            );

        }
    }
}