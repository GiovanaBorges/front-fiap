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
import java.util.List;

@WebServlet("/home")
public class Home extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection connection = ConnectionFactory.getConnection();
        GastosDAO dao = new GastosDAO(connection);
        List<Gastos> gastos = dao.findAll();
        double resultGastos = 0;

        RendaMensalDAO rendadao = new RendaMensalDAO(connection);
        List<RendaMensal> rendas = rendadao.findAll();
        double resultRenda = 0;

        String contextPath = req.getContextPath();


        for(Gastos gasto : gastos) {
            resultGastos += gasto.getValor();
        }

        for(RendaMensal rendatotal : rendas) {
            resultRenda += rendatotal.getRendaMensal();
        }

        req.setAttribute("gastos",resultGastos);
        req.setAttribute("renda",resultRenda);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/home.jsp");
        dispatcher.forward(req,resp);
        resp.sendRedirect("home.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPut(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doDelete(req, resp);
    }
}
