package server.database;

import server.models.Lead;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

import server.config.Config;

/**
 * Class responsible for establishing connection between the database and the server
 * @author Group YOLO
 */

public class DBConnection {

    private static Connection connection = null;

    /**
     * Attempts to create the connection to database
     * Gets variables from config file
     */
    public DBConnection() {
        Config config = new Config();
        try {
            config.initConfig();
        } catch (IOException e) {
            e.printStackTrace();
        }

        try {
            try {
                //Calls a new instance of the Class com.mysql.jdbc.Driver.class with no parameters
                Class.forName("com.mysql.jdbc.Driver").newInstance();
            } catch (InstantiationException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            connection = DriverManager.getConnection(("jdbc:mysql://" + config.getDatabaseHost() + ":"
                            + config.getDatabasePort() + "/" + config.getDatabaseName()),
                    config.getDatabaseUser(), config.getDatabasePassword());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Method responsible for terminating the database connection.
     */
    private static void close() {
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Method responsible for adding a lead to the database.
     * <p>
     * Lead Parameter is inserted into the database using PreparedStatements.
     *
     * @return returns whether or not the user was added to the database by using "rowsAffected".
     */
    public int addLead(Lead lead) {
        int rowsAffected = 0;

        try {
            PreparedStatement addLead = connection.prepareStatement("INSERT INTO AllLists (firstName, surname, email) VALUES (?, ?, ?)");
            addLead.setString(1, lead.getFirstName());
            addLead.setString(2, lead.getSurname());

            rowsAffected = addLead.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowsAffected;
    }
}


