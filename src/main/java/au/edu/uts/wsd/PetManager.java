package au.edu.uts.wsd;

import au.edu.uts.wsd.model.People;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.Serializable;
import javax.servlet.ServletContext;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

public final class PetManager implements Serializable {

    public static final String KEY = "PetManager";
    public static final String BASE_FILEPATH = "/WEB-INF/";
    public static final String DEFAULT_STORE = "/PetOwners.xml";

    private String baseFilepath, peopleFilepath;
    private People people;

    public PetManager() {
    }

    public PetManager(String peopleFilepath) {
        this(BASE_FILEPATH, peopleFilepath);
    }

    public PetManager(String baseFilepath, String peopleFilepath) {
        setBaseFilepath(baseFilepath);
        setPeopleFilepath(peopleFilepath);
    }

    public void save() {
        marshal(People.class, peopleFilepath, people);
    }

    /**
     * @param <T>:
     *      The type of object to be returned; declared on the left hand side of the function.
     *      I.e., Integer i = unmarshal(Integer.class, ...);
     * @param clazz
     *      The class of the type of object to be returned;
     *      I.e., Integer.class
     * @param filepath
     *      The location of the file to unmarshal
     * @return 
     */
    private <T> T unmarshal(Class<T> clazz, String filepath) {
        try (FileInputStream stream = new FileInputStream(baseFilepath + filepath)) {
            JAXBContext context = JAXBContext.newInstance(clazz);
            Unmarshaller unmarshaller = context.createUnmarshaller();
            
            return (T) unmarshaller.unmarshal(stream);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * @param <T>:
     *      The type of object to be marshalled; declared on the left hand side of the function.
     *      I.e., Integer i = marshal(Integer.class, ..., 42);
     * @param clazz
     *      The class of the type of object to be marshalled;
     *      I.e., Integer.class
     * @param filepath
     *      The location of the file to marshal XML output into
     * @param object
     *      The object to be used as the input data for the marshalling process
     * @return 
     */
    private <T> void marshal(Class<T> clazz, String filepath, T object) {
        try (FileOutputStream stream = new FileOutputStream(baseFilepath + filepath)) {
            JAXBContext context = JAXBContext.newInstance(clazz);
            Marshaller marshaller = context.createMarshaller();

            marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
            marshaller.setProperty(Marshaller.JAXB_ENCODING, "UTF-8");
            marshaller.setProperty(Marshaller.JAXB_SCHEMA_LOCATION, "https://au.edu.uts.wsd/pet-manager PetOwners.xsd");

            marshaller.marshal(object, stream);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public String getBaseFilepath() {
        return baseFilepath;
    }

    public void setBaseFilepath(String baseFilepath) {
        this.baseFilepath = baseFilepath;
    }

    public String getPeopleFilepath() {
        return peopleFilepath;
    }

    public void setPeopleFilepath(String peopleFilepath) {
        this.peopleFilepath = peopleFilepath;
        this.people = unmarshal(People.class, peopleFilepath);
    }

    public People getPeople() {
        return people;
    }

    public void setPeople(People people) {
        this.people = people;
    }

    /**
     * @param application
     *      The ServletContext for which we are producing a singleton PetManager instance.
     * @return 
     *      The ServletContexts PetManager singleton.
     */
    public static PetManager getInstance(ServletContext application) {
        PetManager app = (PetManager) application.getAttribute(KEY);
        if (app == null) {
            app = (PetManager) application.getAttribute(KEY);
            if (app == null) {
                app = new PetManager(application.getRealPath(BASE_FILEPATH), DEFAULT_STORE);
                application.setAttribute(KEY, app);
            }
        }
        return app;
    }

}
