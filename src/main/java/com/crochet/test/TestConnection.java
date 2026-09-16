package com.crochet.test;

import java.sql.Connection;
import com.crochet.util.DBConnection;

public class TestConnection {

    public static void main(String[] args) {

        Connection con = DBConnection.getConnection();

        if (con != null)
            System.out.println("Database Connected Successfully!");
        else
            System.out.println("Connection Failed!");

    }
}