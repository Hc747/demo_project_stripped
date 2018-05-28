<%@page import="java.util.ArrayDeque"%>
<%@page import="java.util.Deque"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="au.edu.uts.wsd.Constants"%>
<%@page import="au.edu.uts.wsd.model.Person"%>
<%
    final Person person = (Person) session.getAttribute(Person.KEY);
%>
<header>
    <div>
        <div>
            <div>

                <div>
                    <h4>
                        About
                    </h4>
                    <p>
                        This project demonstrates the following:
                    <ul>
                        <li>
                            Rendering data dynamically via JSP and Java Code
                        </li>
                        <li>
                            Rendering data dynamically via JSP and XSLT
                        </li>
                        <li>
                            Linked an XML Schema to Java Beans, XML Stylesheets and an XML File
                        </li>
                        <li>
                            Basic Client-sided data validation
                        </li>
                        <li>
                            Basic Server-sided data validation
                        </li>
                        <li>
                            A basic ReST API
                        </li>
                        <li>
                            Code designed in a modular and reusable manner
                        </li>
                    </ul>
                    </p> 
                </div>

                <div>
                    <h4>
                        Actions
                    </h4>
                    <ul>

                        <%
                            if (person == null) {
                        %>

                        <li>
                            <a href="<%= Constants.BASE_URL %>login/">
                                Login
                            </a>
                        </li>
                        <li>
                            <a href="<%= Constants.BASE_URL %>register/">
                                Register
                            </a>
                        </li>

                        <% } else { %>

                        <li>
                            <a href="<%= Constants.BASE_URL %>logout/">
                                Logout
                            </a>
                        </li>

                        <% }%>

                    </ul>
                </div>

            </div>
        </div>
    </div>

    <div>
        <div>

            <a href="<%= Constants.BASE_URL%>">
                <strong>

                    <%
                        
                        //Used to print your current location, i.e, home > login
                        
                        final StringBuilder location = new StringBuilder();

                        location.append(Constants.APPLICATION_NAME);

                        final String current = request.getServletPath().replace(Constants.BASE_URL, "");

                        if (current.contains("/")) {

                            final Deque<String> paths = new ArrayDeque<>(Arrays.asList(current.split("/")));

                            paths.removeFirst(); //get rid of the empty context path component
                            paths.removeLast(); //get rid of the filename (index.jsp etc)

                            //equivalent to an 'enhanced for loop'
                            paths.forEach(path -> location.append(" > ").append(path));

                        }

                    %>
                    <%= location %>
                </strong>
            </a>
            <div>
                <strong>
                    <%
                        String greeting = String.format("Welcome, %s!", person == null ? "Guest" : person.getName());
                    %>
                    <%= greeting %>
                </strong> 
            </div>
        </div>
    </div>

</header>