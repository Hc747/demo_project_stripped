<%@page import="au.edu.uts.wsd.model.Animal"%>
<%@page import="au.edu.uts.wsd.model.Person"%>
<%@page import="java.io.IOException"%>
<%@page import="au.edu.uts.wsd.model.Species"%>
<%@page import="au.edu.uts.wsd.model.Animals"%>
<%@page import="au.edu.uts.wsd.PetManager"%>
<%
    final PetManager manager = PetManager.getInstance(application);
%>
<div>
    <div>
        <% for (Person person : manager.getPeople().getPeople()) { %>
        <div>
            <div id="person-<%= person.getId()%>">
                <div>
                    <div>
                        User Profile
                    </div>
                    <div>
                        <p>
                            <strong>
                                <%= person.getName()%>
                            </strong>
                        </p>
                        <p>
                            Contact: <a href="mailto:<%= person.getEmail()%>">
                                <%= person.getEmail()%>
                            </a>
                        </p>
                        <%
                            final Animals pets = person.getPets();

                            final int dogs = pets.lookupAll(pet -> pet.getSpecies().equals(Species.DOG)).size();
                            final int cats = pets.lookupAll(pet -> pet.getSpecies().equals(Species.CAT)).size();
                            final int birds = pets.lookupAll(pet -> pet.getSpecies().equals(Species.BIRD)).size();

                            final int total = pets.getAnimals().size();
                        %>
                        <div>
                            <small>Dogs: <%= dogs%></small>
                            <small>Cats: <%= cats%></small>
                            <small>Birds: <%= birds%></small>
                            <small>Total: <%= total%></small>
                        </div>
                    </div>
                    <% if (total > 0) {%>
                    <div>
                        <button>
                            Toggle
                        </button>
                    </div>
                    <% }%>
                </div> 
            </div>
        </div>
        <div id="pets-<%= person.getId()%>">
            <% for (Animal animal : pets.getAnimals()) {%>
            <div>
                <div>
                    <img src="<%= animal.getImageURL()%>" width="192" height="192"/>
                    <div>
                        <p>
                            <strong>
                                <%= animal.getName()%>
                            </strong>
                            <span>, <%= animal.getSpecies()%></span>
                        </p>
                        <small>
                            Microchip: <%= animal.getMicrochip()%>
                        </small>

                        <div>
                            <a href="#person-<%= person.getId()%>">Owners Profile</a>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>      
        <% } %>
    </div>
</div>
    
<section>
    <div>
        <h1>
            The data above was rendered using JSP and Java Code.
        </h1>
    </div>
</section>