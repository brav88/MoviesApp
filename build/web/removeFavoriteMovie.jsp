<%-- 
    Document   : saveFavoriteMovie
    Created on : 29 oct. 2024, 20:14:09
    Author     : Samuel
--%>

<%@page import="movies.database.module.databaseHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String email = request.getParameter("email");
    int idMovie = Integer.parseInt(request.getParameter("idMovie"));    
    String path;
    databaseHelper dt = new databaseHelper();

    if (dt.removeFavoriteMovie(email, idMovie)) {        
        path = "/myFavorites.jsp?msg=Movie removed";
    } else {
        path = "/myFavorites.jsp?msg=Error removing the Movie";
    }

    dt.Close();
    RequestDispatcher dispatcher = request.getRequestDispatcher(path);
    dispatcher.forward(request, response);
%>
