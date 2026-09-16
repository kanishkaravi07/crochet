package com.crochet.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crochet.util.DBConnection;

@WebServlet("/placeOrder")
public class PlaceOrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String customerName = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        int userId = 1;

        Connection con = null;

        try {

            con = DBConnection.getConnection();

            // Calculate total from cart
            String totalSql =
                    "SELECT SUM(p.price * c.quantity) AS total " +
                    "FROM cart c " +
                    "JOIN products p ON c.product_id = p.id " +
                    "WHERE c.user_id = ?";

            PreparedStatement totalPs =
                    con.prepareStatement(totalSql);

            totalPs.setInt(1, userId);

            ResultSet rs = totalPs.executeQuery();

            double total = 0;

            if (rs.next()) {
                total = rs.getDouble("total");
            }

            rs.close();
            totalPs.close();

            // Insert order
            String orderSql =
                    "INSERT INTO orders " +
                    "(customerName, email, address, total) " +
                    "VALUES (?, ?, ?, ?)";

            PreparedStatement orderPs =
                    con.prepareStatement(
                            orderSql,
                            java.sql.Statement.RETURN_GENERATED_KEYS
                    );

            orderPs.setString(1, customerName);
            orderPs.setString(2, email);
            orderPs.setString(3, address);
            orderPs.setDouble(4, total);

            orderPs.executeUpdate();

            // Get generated order ID
            ResultSet keys = orderPs.getGeneratedKeys();

            int orderId = 0;

            if (keys.next()) {
                orderId = keys.getInt(1);
            }

            keys.close();
            orderPs.close();

            // Clear cart after successful order
            String deleteSql =
                    "DELETE FROM cart WHERE user_id = ?";

            PreparedStatement deletePs =
                    con.prepareStatement(deleteSql);

            deletePs.setInt(1, userId);

            deletePs.executeUpdate();

            deletePs.close();
            con.close();

            // Send order details to confirmation page
            request.setAttribute("orderId", orderId);
            request.setAttribute("total", total);
            request.setAttribute("customerName", customerName);

            request.getRequestDispatcher("confirmation.jsp")
                   .forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "Error placing order: " + e.getMessage()
            );
        }
    }
}