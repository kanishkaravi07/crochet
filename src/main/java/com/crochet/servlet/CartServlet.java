package com.crochet.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crochet.util.DBConnection;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String productId = request.getParameter("productId");

        // Temporary user ID for testing
        int userId = 1;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO cart (user_id, product_id, quantity) "
                       + "VALUES (?, ?, 1)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);
            ps.setInt(2, Integer.parseInt(productId));

            ps.executeUpdate();

            ps.close();
            con.close();

            response.sendRedirect("cart.jsp");

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                "Error adding product to cart: " + e.getMessage()
            );
        }
    }
}