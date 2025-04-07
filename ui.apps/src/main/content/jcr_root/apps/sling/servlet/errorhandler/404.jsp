<%@page session="false" %>
<%@page import="com.day.cq.wcm.api.PageManager, com.day.cq.wcm.api.Page, org.apache.sling.api.resource.Resource" %>

<%
    Resource resource = request.getResource();
    PageManager pageManager = resource.getResourceResolver().adaptTo(PageManager.class);
    
    // Set path to your 404 error page
    String errorPagePath = "/content/mysite/error-pages/404";
    Page errorPage = (pageManager != null) ? pageManager.getPage(errorPagePath) : null;
    
    // Fetch title or default to "Page Not Found"
    String pageTitle = (errorPage != null) ? errorPage.getTitle() : "Page Not Found";
%>

<!DOCTYPE html>
<html>
<head>
    <title><%= pageTitle %></title>
</head>
<body>
    <h1><%= pageTitle %></h1>
    <p>Sorry, the page you are looking for does not exist.</p>
    <a href="/">Go to Homepage</a>
</body>
</html>
