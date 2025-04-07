<%@page session="false" %>
<%@page import="com.day.cq.wcm.api.PageManager, com.day.cq.wcm.api.Page, org.apache.sling.api.resource.Resource" %>

<%
    Resource resource = request.getResource();
    PageManager pageManager = resource.getResourceResolver().adaptTo(PageManager.class);
    
    // Set path to your default error page (500 error)
    String errorPagePath = "/content/mysite/error-pages/500";
    Page errorPage = (pageManager != null) ? pageManager.getPage(errorPagePath) : null;
    
    // Fetch title or default to "Internal Server Error"
    String pageTitle = (errorPage != null) ? errorPage.getTitle() : "Internal Server Error";
%>

<!DOCTYPE html>
<html>
<head>
    <title><%= pageTitle %></title>
</head>
<body>
    <h1><%= pageTitle %></h1>
    <p>Sorry, something went wrong on our end. Please try again later.</p>
    <a href="/">Go to Homepage</a>
</body>
</html>
