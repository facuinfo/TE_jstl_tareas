<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : editar
    Created on : 05-nov-2020, 21:08:19
    Author     : facu_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTL Tarea</title>
    </head>
    <body>
        <h1>
            <c:if test="${requestScope.op=='nuevo'}" var="res" scope="request">
                Registro de 
            </c:if>
            <c:if test="${requestScope.op=='modificar'}"var="res" scope="request">
                Modificar
            </c:if>
            tarea
        </h1>
        <jsp:useBean id="mitarea" scope="request" class="com.emergentes.modelo.Tarea"/>
        <form action="controller" method="post">
            <table>
                <tr>
                    <td>Id</td>
                    <td><input type="text" name="id" value="<jsp:getProperty name="miTarea" property="id"/>"></td>
                </tr>
                <tr>
                    <td>Tarea</td>
                    <td><input type="text" name="tarea" value="<jsp:getProperty name="miTarea" property="tarea"/>"></td>
                </tr>
                <tr>
                    <td>Prioridad</td>
                    <td>
                        <select name="prioridad">
                            <option value="Alta"
                                    <c:if test="${mitarea.prioridad=='Alta'}"
                                          var="res" scope="request">
                                        selected
                                          </c:if>
                                        >Alta</option>
                            <option value="Media"
                                    <c:if test="${mitarea.prioridad=='Media'}"
                                          var="res" scope="request">
                                        selected
                                          </c:if>
                                        >Media</option>
                            <option value="Baja"
                                    <c:if test="${mitarea.prioridad=='Baja'}"
                                          var="res" scope="request">
                                        selected
                                          </c:if>
                                        >Baja</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="Hidden" name="opg" value="${requestScope.op}"/>
                        <input type="Hidden" name="opg" value="grabar"/>
                    </td>
                    <td>
                        <input type="submit" value="Enviar"/>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>