<%@ page pageEncoding="UTF-8" %>
<%@ page import="br.com.fiapchallenge.infra.ConnectionFactory,java.sql.Connection,br.com.fiapchallenge.dao.GastosDAO.GastosDAO,br.com.fiapchallenge.dao.RendaMensalDAO.RendaMensalDAO,java.util.*,br.com.fiapchallenge.model.Gastos,br.com.fiapchallenge.model.RendaMensal" %>
<%@ include file="navbar.jsp" %>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<head>
    <style>
        table {
          font-family: arial, sans-serif;
          border-collapse: collapse;
          width: 100%;
        }

        td, th {
          border: 1px solid #dddddd;
          text-align: left;
          padding: 8px;
        }

        tr:nth-child(even) {
          background-color: #dddddd;
        }
    </style>
</head>
<body>
    <h1>
           Gastos Total R$ : - ${gastos}
    </h1>

        <h1>
               Entrada Total R$ : ${renda}
        </h1>

<a href="add-gasto.html" >adicionar novo gasto</a>
<a href="add-rendaMensal.html" >adicionar nova entrada</a>

    <table>
    <h1>Gastos</h1>
        <tr>
            <th>Descricao</th>
            <th>Data</th>
            <th>Valor</th>
            <th>conta</th>
        </tr>
    <%
        Connection connection = ConnectionFactory.getConnection();
              GastosDAO dao = new GastosDAO(connection);
              List<Gastos> gastos = dao.findAll();

              for(Gastos gasto : gastos){
    %>
    <tr>
        <td><%= gasto.getGastos() %></td>
        <td><%= gasto.getData() %></td>
        <td><%= gasto.getValor() %></td>
        <td><%= gasto.getConta() %></td>
    </tr>

    <%
    }
    %>
    </table>

     <table>
          <h1>Entrada</h1>
            <tr>
                <th>Descricao</th>
                <th>Data</th>
                <th>Valor</th>
                <th>conta</th>
                <th>usuario</th>
            </tr>
        <%

               RendaMensalDAO rendadao = new RendaMensalDAO(connection);
               List<RendaMensal> rendas = rendadao.findAll();


                  for(RendaMensal renda : rendas){
        %>
        <tr>
            <td><%= renda.getRenda() %></td>
            <td><%= renda.getData() %></td>
            <td><%= renda.getRendaMensal() %></td>
            <td><%= renda.getConta() %></td>
            <td><%= renda.getUsuario() %></td>
        </tr>

        <%
        }
        %>
        </table>
</body>
</html>
