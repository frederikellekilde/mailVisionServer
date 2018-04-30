package server.controllers;

import server.database.DBConnection;
import server.models.Lead;


import java.util.ArrayList;

/**
 * Class responsible for all logic related to user operations
 * @author Group YOLO
 */
public class UserController {

    /**
     * Constructor for the user controller
     */
    public UserController() {

    }

    /**
     * Method to add a user to the database
     * @param lead
     * @return boolean
     */
    public boolean addLead(Lead lead) {

        DBConnection dbConnection = new DBConnection();
        int result = dbConnection.addLead(lead);

        if(result>0){
            return true;
        }

        return false;
    }
}
