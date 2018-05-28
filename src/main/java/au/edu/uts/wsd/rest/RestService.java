package au.edu.uts.wsd.rest;

import au.edu.uts.wsd.PetManager;
import au.edu.uts.wsd.model.People;
import au.edu.uts.wsd.model.Person;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

@Path("/api")
public class RestService {
    
    @Context
    private ServletContext application;
    
    private PetManager getPetManager() throws Exception {
        return PetManager.getInstance(application);
    }
    
    @GET
    @Path("people")
    @Produces(MediaType.APPLICATION_XML)
    public People getAll() throws Exception {
        
        List<Person> values = new ArrayList<>(getPetManager().getPeople().getPeople());
        
        //TODO: apply filtering logic
        
        return new People(values);
    }
    
}
