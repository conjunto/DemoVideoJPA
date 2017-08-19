<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="pojos.Personas"%>
<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="services.PersonasFacade"%>
<%@page import="services.PersonasFacadeLocal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    //ServicioLocal servicio;
    PersonasFacadeLocal servicio;
%>
<%
    InitialContext ctx = new InitialContext();
    //servicio = (ServicioLocal) ctx.lookup("java:global/GestionVenta/Servicio!cl.model.ServicioLocal");
    servicio = (PersonasFacadeLocal) ctx.lookup("java:global/DemoVideoJPA-ejb/PersonasFacade!services.PersonasFacadeLocal");
    List<Personas> lista = servicio.findAll();
    System.out.println("Nombre: " + lista.get(0).getNombres());
%>
<c:set scope="page" var="lista" value="<%=lista%>" />
<!DOCTYPE html>
<html>
    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>

    <body>
        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>

        <h1>PRODUCTO</h1>
        <div class="row">
            <div class="col s6">
                <form action="control.do" >
                    <div class="input-field">
                        <input id="nombre" type="text" name="nombre">
                        <label for="nombre">Nombre</label>
                    </div>
                    <div class="input-field">
                        <input id="precio" type="text" name="precio">
                        <label for="precio">Precio</label>
                    </div>
                    <button class="btn right" name="bt" value="addpro" type="submit">
                        Guardar
                    </button>
                </form>
                <br><br>
                <table class="bordered">
                    <tr>
                        <td>Código</td>
                        <td>Nombre</td>
                        <td>Precio</td>
                    </tr>
                    <c:forEach items="${lista}" var="p">
                        <tr>
                            <td>${p.id}</td>
                            <td>${p.nombres}</td>
                            <td>${p.apellidos}
                                <c:if test="${p.edad lt 25}">
                                    <a href="control.do?bt=editpro&codigo=${p.id}&precio=${p.nombres}&nombre=${p.apellidos}" class="btn-floating green">
                                        <i class="material-icons">replay</i>
                                    </a>
                                </c:if>
                                <c:if test="${p.edad ge 25}">
                                    <a href="control.do?bt=editpro&codigo=${p.id}&precio=${p.nombres}&nombre=${p.apellidos}" class="btn-floating red">
                                        <i class="material-icons">replay</i>
                                    </a>
                                </c:if>
                                
                            </td>
                        </tr>                    
                    </c:forEach>                    
                </table>

            </div>
        </div>
    </body>
</html>
