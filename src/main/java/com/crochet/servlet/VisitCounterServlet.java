package com.crochet.servlet;

import java.io.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/visit")
public class VisitCounterServlet extends HttpServlet {

protected void doGet(HttpServletRequest request,
HttpServletResponse response) throws IOException {


int count=1;

Cookie cookies[]=request.getCookies();


if(cookies!=null){

for(Cookie c:cookies){

if(c.getName().equals("visitCount")){

count=Integer.parseInt(c.getValue())+1;

}

}

}


Cookie cookie=new Cookie(
"visitCount",
String.valueOf(count));


response.addCookie(cookie);


response.setContentType("text/html");

PrintWriter out=response.getWriter();


out.println("<h2>Welcome to Crochet World</h2>");

out.println(
"You visited this page "+count+" times");

}

}