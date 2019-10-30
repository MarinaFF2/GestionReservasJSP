<%-- 
    Document   : controladorInsertarFranjas
    Created on : 24-oct-2019, 10:02:52
    Author     : daw207
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getParameter("insertarFranjas")!=null){
    //insertar franjas la primera vez del curso
    InsertarFranjas f = new InsertarFranjas(2019,2020);
    //franja1
    f.hacerFranjasFranjas1_aula101();
    f.hacerFranjasFranjas1_aula201();
    f.hacerFranjasFranjas1_aula301();
    //franja2
    f.hacerFranjasFranjas2_aula101();
    f.hacerFranjasFranjas2_aula201();
    f.hacerFranjasFranjas2_aula301();
    //franja3
    f.hacerFranjasFranjas3_aula101();
    f.hacerFranjasFranjas3_aula201();
    f.hacerFranjasFranjas3_aula301();
    //franja4
    f.hacerFranjasFranjas4_aula101();
    f.hacerFranjasFranjas4_aula201();
    f.hacerFranjasFranjas4_aula301();
    //franja5
    f.hacerFranjasFranjas5_aula101();
    f.hacerFranjasFranjas5_aula201();
    f.hacerFranjasFranjas5_aula301();
    //franja6
    f.hacerFranjasFranjas6_aula101();
    f.hacerFranjasFranjas6_aula201();
    f.hacerFranjasFranjas6_aula301();
    }
%>
