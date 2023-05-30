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
import java.text.DecimalFormat;
import java.util.List;

@WebServlet("/home")
public class ListGastosAndRendaServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection connection = ConnectionFactory.getConnection();
        GastosDAO dao = new GastosDAO(connection);
        List<Gastos> gastos = dao.findAll();

        RendaMensalDAO rendadao = new RendaMensalDAO(connection);
        List<RendaMensal> rendas = rendadao.findAll();

        double resultGastos = 0;
        double resultRenda = 0;


        for(Gastos gasto : gastos) {
            resultGastos += gasto.getValor();
        }

        for(RendaMensal rendatotal : rendas) {
            resultRenda += rendatotal.getRendaMensal();
        }

        req.setAttribute("gastos",gastos);
        req.setAttribute("rendas",rendas);
        DecimalFormat df = new DecimalFormat("#.##");
        req.setAttribute("gastosTotal",Double.parseDouble(df.format(resultGastos)));
        req.setAttribute("rendasTotal",Double.parseDouble(df.format(resultRenda)));

        RequestDispatcher dispatcher = req.getRequestDispatcher("/home.jsp");
        dispatcher.forward(req,resp);



    }

}
