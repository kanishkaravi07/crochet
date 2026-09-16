package com.crochet.servlet;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/deleteCookie")
public class DeleteCookieServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {


        Cookie cookie = new Cookie("visitCount", "");

        // Delete cookie
        cookie.setMaxAge(0);

        response.addCookie(cookie);


        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        out.println("<h2>Cookie Deleted Successfully</h2>");

    }

}