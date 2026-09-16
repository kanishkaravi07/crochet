package com.crochet.servlet;

import java.io.*;
import java.util.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/active")
public class ActiveUsersServlet extends HttpServlet {


static ArrayList<HttpSession> sessions =
new ArrayList<>();


protected void doGet(HttpServletRequest request,
HttpServletResponse response)
throws IOException {


HttpSession session=request.getSession();

sessions.add(session);


response.setContentType("text/html");

PrintWriter out=response.getWriter();


out.println("<h2>Active Users</h2>");

out.println(
"Currently Logged Users : "
+sessions.size());

}

}