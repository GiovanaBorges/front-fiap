package fintech;

import br.com.fiapchallenge.dao.RendaMensalDAO.RendaMensalDAO;
import br.com.fiapchallenge.infra.ConnectionFactory;
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

@WebServlet("/removeRenda")
public class RemoveRenda extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        Connection connection = ConnectionFactory.getConnection();
        RendaMensalDAO rendadao = new RendaMensalDAO(connection);

        rendadao.delete(Long.valueOf(id));

        RequestDispatcher dispatcher = req.getRequestDispatcher("/home");
        dispatcher.forward(req,resp);
    }
}
