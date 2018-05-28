package au.edu.uts.wsd;

public final class Constants {
    
    public static final String APPLICATION_NAME = "Web Services Development: Pet Manager";
    
    public static final String APPLICATION_DESCRIPTION = "This application was created as an example for students of Web Services Development (31284) in 2018.";
    
    //TODO: change this to match the name of the deployed WAR file.
    public static final String BASE_URL = "http://localhost:8080/demo_project_stripped/";
    
    private Constants() {
        throw new IllegalStateException("Unable to create an instance of the Constants class");
    }
    
}
