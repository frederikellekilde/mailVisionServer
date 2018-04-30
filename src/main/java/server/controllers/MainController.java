package server.controllers;

import server.database.DBConnection;

/**
 * Class responsible for all logic related to general operations
 * @author Group YOLO
 */

public class MainController {


    /**
     * Constructor for main controller
     */
    public MainController() {
        DBConnection dbConnection = new DBConnection();
    }

}