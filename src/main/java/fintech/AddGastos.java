package fintech;

import br.com.fiapchallenge.dao.GastosDAO.GastosDAO;
import br.com.fiapchallenge.infra.ConnectionFactory;
import br.com.fiapchallenge.model.Gastos;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet("/addGasto")
public class AddGastos extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException , IOException{
        String gastosDescricao = req.getParameter("gastos");
        Date data = Date.valueOf(req.getParameter("data"));
        String valor = req.getParameter("valor");
        int conta = Integer.parseInt(req.getParameter("conta"));
        int usuario = Integer.parseInt(req.getParameter("usuario"));

        Gastos gasto = new Gastos(data,gastosDescricao,conta,usuario, Double.parseDouble(valor));
        Connection connection = ConnectionFactory.getConnection();
        GastosDAO dao = new GastosDAO(connection);
        dao.save(gasto);

        String contextPath = req.getContextPath();
        String homePath = contextPath + "/home";
        req.setAttribute("link",homePath);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/gasto-adicionado.jsp");
        dispatcher.forward(req,resp);
    }
}
