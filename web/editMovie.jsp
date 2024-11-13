<%-- 
    Document   : saveFavoriteMovie
    Created on : 29 oct. 2024, 20:14:09
    Author     : Samuel
--%>

<%@page import="movies.database.module.databaseHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int idMovie = Integer.parseInt(request.getParameter("txtId"));
    String title = request.getParameter("txtTitle");
    String releaseDate = request.getParameter("txtDate");    
    String photoPath = request.getParameter("txtPhoto");
    String path;
    databaseHelper dt = new databaseHelper();

    if (dt.editMovie(idMovie, title, releaseDate, photoPath)) {
        path = "/index.jsp?msg=Movie updated";
    } else {
        path = "/index.jsp?msg=Error updating the Movie";
    }

    dt.Close();
    RequestDispatcher dispatcher = request.getRequestDispatcher(path);
    dispatcher.forward(request, response);
%>