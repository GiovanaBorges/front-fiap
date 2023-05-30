<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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



        @import 'https://fonts.googleapis.com/css?family=Open+Sans:600,700';

        * {font-family: 'Open Sans', sans-serif;}

        .rwd-table {
          margin: auto;
          min-width: 300px;
          max-width: 100%;
          border-collapse: collapse;
        }

        .rwd-table tr:first-child {
          border-top: none;
          background: #428bca;
          color: #fff;
        }

        .rwd-table tr {
          border-top: 1px solid #ddd;
          border-bottom: 1px solid #ddd;
          background-color: #f5f9fc;
        }

        .rwd-table tr:nth-child(odd):not(:first-child) {
          background-color: #ebf3f9;
        }

        .rwd-table th {
          display: none;
        }

        .rwd-table td {
          display: block;
        }

        .rwd-table td:first-child {
          margin-top: .5em;
        }

        .rwd-table td:last-child {
          margin-bottom: .5em;
        }

        .rwd-table td:before {
          content: attr(data-th) ": ";
          font-weight: bold;
          width: 120px;
          display: inline-block;
          color: #000;
        }

        .rwd-table th,
        .rwd-table td {
          text-align: left;
        }

        .rwd-table {
          color: #333;
          border-radius: .4em;
          overflow: hidden;
        }

        .rwd-table tr {
          border-color: #bfbfbf;
        }

        .rwd-table th,
        .rwd-table td {
          padding: .5em 1em;
        }
        @media screen and (max-width: 601px) {
          .rwd-table tr:nth-child(2) {
            border-top: none;
          }
        }
        @media screen and (min-width: 600px) {
          .rwd-table tr:hover:not(:first-child) {
            background-color: #d8e7f3;
          }
          .rwd-table td:before {
            display: none;
          }
          .rwd-table th,
          .rwd-table td {
            display: table-cell;
            padding: .25em .5em;
          }
          .rwd-table th:first-child,
          .rwd-table td:first-child {
            padding-left: 0;
          }
          .rwd-table th:last-child,
          .rwd-table td:last-child {
            padding-right: 0;
          }
          .rwd-table th,
          .rwd-table td {
            padding: 1em !important;
          }
        }


        /* THE END OF THE IMPORTANT STUFF */

        /* Basic Styling */
        body {
         background: #303030;

        }
        h1 {
          text-align: center;
          font-size: 2.4em;

        }
        .container {
          display: block;
          text-align: center;
        }
        h3 {
          display: inline-block;
          position: relative;
          text-align: center;
          font-size: 1.5em;
          color: #cecece;
        }

/* 13 */
.btn-13 {
  background-color: #89d8d3;
background-image: linear-gradient(315deg, #89d8d3 0%, #03c8a8 74%);
  border: none;
  z-index: 1;
  color:black;
}
.btn-13:after {
  position: absolute;
  content: "";
  width: 100%;
  height: 0;
  bottom: 0;
  left: 0;
  z-index: -1;
  border-radius: 5px;
   background-color: #4dccc6;
background-image: linear-gradient(315deg, #4dccc6 0%, #96e4df 74%);
  box-shadow:
   -7px -7px 20px 0px #fff9,
   -4px -4px 5px 0px #fff9,
   7px 7px 20px 0px #0002,
   4px 4px 5px 0px #0001;
  transition: all 0.3s ease;
}
.btn-13:hover {
  color: #fff;
}
.btn-13:hover:after {
  top: 0;
  height: 100%;
}
.btn-13:active {
  top: 2px;
}

button {
  margin: 20px;
}
.custom-btn {
  width: auto;
  height: 40px;
    color:black;

  border-radius: 5px;
  padding: 10px 25px;
  font-family: 'Lato', sans-serif;
  font-weight: 700;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
}


/* 5 */
.btn-5 {
  width: 130px;
  height: 40px;
  line-height: 42px;
  padding: 0;
  border: none;
  background: rgb(255,27,0);
background: linear-gradient(0deg, rgba(255,27,0,1) 0%, rgba(251,75,2,1) 100%);
}
.btn-5:hover {
  color: #f0094a;
  background: transparent;
   box-shadow:none;
}
.btn-5:before,
.btn-5:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #f0094a;
  box-shadow:
   -1px -1px 5px 0px #fff,
   7px 7px 20px 0px #0003,
   4px 4px 5px 0px #0002;
  transition:400ms ease all;
}
.btn-5:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.btn-5:hover:before,
.btn-5:hover:after{
  width:100%;
  transition:800ms ease all;
}

.links{
    display :flex;
    justify-content:center;
    align-items:center;

    margin:1rem;
    padding:0.5rem;
}

.container-glass {
   margin-top: 5em;
   padding: 20px 20px 20px 20px;
   background: rgba(255, 255, 255, 0.3);
   border-radius: 30px;
   backdrop-filter: blur(3px);
}

/*              Card           */

.card{
    background-color: white;
    padding:1.5rem 2rem;
    border-radius: 0.25rem;
    margin-bottom: 2rem;
    margin-top: 2rem;
    color: #363f5f;
}

.card h3{
    font-weight: normal;
    font-size: 1rem;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.card p{
    font-size: 2rem;
    line-height: 3rem;
    margin-top: 1rem;
}
.card.total{
    background-color: #49aa26;
    color: white;
}


/*              Balance           */
#balance{
    margin-top: -8rem;
}

#balance h2{
    color: white;
    margin-top: 0;
}

.sr-only{
    position: absolute;
    width: 1px;
    height:1px;
    border:solid 1px red;
    padding: 0;
    margin : -1px;
    overflow: hidden;
    clip : rect(0,0,0,0);
    white-space: nowrap;
    border-width: 0;
}

/*              Container           */

.container{
    width: min(90vw, 800px);
    margin:auto;
}

/*               header                 */
header{
    background: linear-gradient(to right top, #6596f6, #65dfc9);
    padding: 2rem 0 10rem;
    text-align: center;
}

    </style>
</head>
<body>

    <header>

        <h1>Fintech</h1>
        <h2>Seu sistema de controle financeiro</h2>
    </header>
  <main class="container">
 <section id="balance">


        <div class="card">
            <h3>
                <span>Entradas</span>

                <img width="50" height="50" src="https://img.icons8.com/ios/50/1FC554/circled-up-2.png" alt="Imagem de entradas"/>
            </h3>
            <p id='incomeDisplay'>R$ ${rendasTotal}</p>
    </div>
    <div class="card">
        <h3>
            <span>Saídas</span>

            <img width="50" height="50" src="https://img.icons8.com/ios/50/FF0808/circled-down-2.png" alt="Imagem de Saídas"/>
        </h3>
        <p id="expenseDisplay">R$ - ${gastosTotal}</p>
    </div>

    </section>
    </main>


        <div class="container">
           <div class="container container-glass">
                  <h1>Tabela dos gastos</h1>
                </div>


       <div class="container links">

            <a href="add-gasto.html" class="custom-btn btn-13">Novo gasto</a>
                    <a href="add-rendaMensal.html" class="custom-btn btn-5"><span>Nova entrada</span></a>
        </div>



          <table class="rwd-table">
            <tbody>
              <tr>
                <th>Descricao</th>
                <th>Data</th>
                <th>Valor</th>
                <th>Editar</th>
                <th>Deletar</th>
              </tr>

             <c:forEach var="gasto" items="${gastos}">
              <tr>
                <td data-th="Supplier Code">
                 ${gasto.getGastos()}
                </td>
                <td data-th="Supplier Name">
                  ${gasto.getData()}
                </td>
                <td data-th="Invoice Number">
                   ${gasto.getValor()}
                </td>
                 <td>
                            <img width="30" height="30" src="https://img.icons8.com/ios-glyphs/30/edit--v1.png" alt="edit--v1"/>
                                </td>
                                <td>
                                    <a href="removeGasto?id=${gasto.getId()}"><img width="30" height="30" src="https://img.icons8.com/ios-glyphs/30/FF0808/filled-trash.png" alt="filled-trash"/></a>
                                </td>


              </tr>
              </c:forEach>
            </tbody>
          </table>

</div>
<div class="container">

          <div class="container container-glass">
              <h1>Tabela das Entradas </h1>
              </div>

       <div class="container links">

            <a href="add-gasto.html" class="custom-btn btn-13">Novo gasto</a>
                    <a href="add-rendaMensal.html" class="custom-btn btn-5"><span>Nova entrada</span></a>
        </div>


  <table class="rwd-table">
            <tbody>
              <tr>
                <th>Descricao</th>
                <th>Data</th>
                <th>Valor</th>
                 <th>Editar</th>
                 <th>Deletar</th>
              </tr>

           <c:forEach var="renda" items="${rendas}">
              <tr>

                <td data-th="Supplier Code">
                 ${renda.getRenda()}
                </td>
                <td data-th="Supplier Name">
                 ${renda.getData()}
                </td>
                <td data-th="Invoice Number">
               ${renda.getRendaMensal()}
                </td>
                <td>
                         <a href="editRenda?id=${renda.getId()}"><img width="30" height="30" src="https://img.icons8.com/ios-glyphs/30/edit--v1.png" alt="edit--v1"/></a>
                </td>
                <td>
                    <a href="removeRenda?id=${renda.getId()}"><img width="30" height="30" src="https://img.icons8.com/ios-glyphs/30/FF0808/filled-trash.png" alt="filled-trash"/></a>
                </td>
              </tr>

              </c:forEach>
            </tbody>
          </table>

          </div>

</body>
</html>
