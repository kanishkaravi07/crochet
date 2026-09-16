package com.crochet.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/timeout")
public class SessionTimeoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession();

        // 2 minutes
        session.setMaxInactiveInterval(120);

        response.setContentType("text/html");

        PrintWriter out=response.getWriter();

        out.println("<h2>Art Of Crochet</h2>");
        out.println("<p>Your session expires after 2 minutes inactivity</p>");
    }
}