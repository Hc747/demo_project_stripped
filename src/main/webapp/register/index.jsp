<%@page import="au.edu.uts.wsd.Constants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if ("register".equals(request.getParameter("action"))) {
        //TODO: handle server sided validation here, in addition to business logic.
        //Server sided validation pertains to the following:
        //Ensuring that expected values are present, and in a valid or expected format.
        //See more: https://docs.oracle.com/javase/7/docs/api/java/util/regex/package-summary.html
        //Once you have ensured that the users input is valid, you still need to ensure that 
        //the operations performed have returned a valid result. I.e.,
        //if you query your DAO in order to retrieve a model, just because the users
        //input was valid, doesn't necessarily mean that the returned model is valid.
    }
%>
<!DOCTYPE html>
<html lang="en">

    <jsp:include page="../WEB-INF/includes/common/head.jsp"/>

    <body>

        <jsp:include page="../WEB-INF/includes/common/header.jsp"/>

        <main role="main">

            <jsp:include page="../WEB-INF/includes/common/info.jsp"/>

            <div class="container">

                <form action="<%= Constants.BASE_URL%>register/?action=register" method="POST">
                    <div>
                        <label for="name">
                            Name
                        </label>
                        <input type="text" id="name" name="name" placeholder="Enter name" required>
                    </div>
                    <div>
                        <label for="email">
                            Email address
                        </label>
                        <input type="email" id="email" name="email" placeholder="Enter email" required>
                    </div>
                    <div>
                        <label for="password">
                            Password
                        </label>
                        <input type="password" id="password" name="password" placeholder="Password" required>
                    </div>
                    <div>
                        <input type="checkbox" id="remember" name="remember">
                        <label for="remember">Remember me</label>
                    </div>
                    <button type="submit">Submit</button>
                </form>
            </div>

        </main>

        <jsp:include page="../WEB-INF/includes/common/footer.jsp"/>

        <jsp:include page="../WEB-INF/includes/common/scripts.jsp"/>

    </body>
</html>
