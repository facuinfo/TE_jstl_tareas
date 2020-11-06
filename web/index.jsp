<%-- 
    Document   : index
    Created on : 05-nov-2020, 19:25:01
    Author     : facu_
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.emergentes.modelo.Tarea" %>
<%@page import="com.emergentes.modelo.GestorTareas" %>
<%
    if (session.getAttribute("agenda")==null) {
        GestorTareas objeto1=new GestorTareas();
        objeto1.insertarTarea(new Tarea(1, "Reunion con los estudiantes de la carrera","Alta"));
        objeto1.insertarTarea(new Tarea(2, "Estudiar para el examen de estadistica","Alta"));
        objeto1.insertarTarea(new Tarea(3, "Partido de futsal","Baja"));
        
        session.setAttribute("agenda", objeto1);
}
    %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Tarea</title>
    </head>
    <body>
        <h1>Lista de tareas</h1>
        <a href="controller?op=nuevo">Nuevo</a>
        <table border="1">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Tarea</th>
                    <th>Prioridad</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${sessionScope.agenda.getLista()}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.tarea}</td>
                    <td>${item.prioridad}</td>
                    <td><a href="controller?op=modificar&id=${item.id}">Modifocar</a></td>
                    <td><a href="controller?op=eliminar&id=${item.id}">Eliminar</a></td>
                </tr>
                </c:forEach>
                
            </tbody>
        </table>

    </body>
</html>
