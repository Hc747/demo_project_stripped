<%@page import="au.edu.uts.wsd.Constants"%>
<div>
    <p>
        <a href="<%= Constants.BASE_URL%>?renderer=POJO">
            Render using Java Code
        </a>
    </p>
    <p>
        <a href="<%= Constants.BASE_URL%>?renderer=XSLT">
            Render using XSLT
        </a>
    </p>
</div>