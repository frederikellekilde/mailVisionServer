package server.endpoints;

import com.google.gson.Gson;
import server.controllers.UserController;
import server.models.Lead;

import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import java.util.ArrayList;


@Path("/user")
public class UserEndpoint {

    private UserController ucontroller = new UserController();

    /**
     * @param jsonLead
     * @return Response true or false
     * Creates a lead in the database
     */
    @POST
    @Path("/createLead")
    public Response createUser(String jsonLead) {
        int status = 0;
        boolean result = false;
        try {
            Lead leadCreated = new Gson().fromJson(jsonLead, Lead.class);
            result = ucontroller.addLead(leadCreated);
            status = 200;

        } catch (Exception e) {
            if (e.getClass() == BadRequestException.class) {
                status = 400;

            } else if (e.getClass() == InternalServerErrorException.class) {
                status = 500;
            }
        }

        return Response
                .status(status)
                .type("application/json")
                .entity(("{\"leadCreated\":\"" + result + "\"}"))
                .build();
    }
}