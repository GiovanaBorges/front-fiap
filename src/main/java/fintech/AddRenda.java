package fintech;

import br.com.fiapchallenge.dao.GastosDAO.GastosDAO;
import br.com.fiapchallenge.dao.RendaMensalDAO.RendaMensalDAO;
import br.com.fiapchallenge.infra.ConnectionFactory;
import br.com.fiapchallenge.model.Gastos;
import br.com.fiapchallenge.model.RendaMensal;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;

@WebServlet("/addRenda")
public class AddRenda extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String rendaDescricao = req.getParameter("dsc_renda");
        Date data = Date.valueOf(req.getParameter("data"));
        double valor = Double.parseDouble(req.getParameter("valor"));
        int conta = Integer.parseInt(req.getParameter("conta"));
        int usuario = Integer.parseInt(req.getParameter("usuario"));

        RendaMensal renda = new RendaMensal(valor,data,rendaDescricao,conta,usuario);
        Connection connection = ConnectionFactory.getConnection();
        RendaMensalDAO dao = new RendaMensalDAO(connection);
        dao.save(renda);

        String contextPath = req.getContextPath();
        String homePath = contextPath + "/home";
        req.setAttribute("link",homePath);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/rendaMensal-adicionada.jsp");
        dispatcher.forward(req,resp);
    }
}
