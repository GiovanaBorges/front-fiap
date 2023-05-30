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
import java.sql.Date;
import java.util.List;
import java.util.Optional;

@WebServlet("/editRenda")
public class EditRenda extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection connection = ConnectionFactory.getConnection();
        RendaMensalDAO rendadao = new RendaMensalDAO(connection);
        String id = req.getParameter("id");

        Optional<RendaMensal> rendas = rendadao.findById(Long.valueOf(id));
        req.setAttribute("renda",rendas);


        System.out.println("ID => " + rendas.get().getId());
        System.out.println("Data => " + rendas.get().getData());
        System.out.println("Descricao => " + rendas.get().getRenda());
        System.out.println("Valor => " + rendas.get().getRendaMensal());
        System.out.println("Usuario => " + rendas.get().getUsuario());
        System.out.println("Numero conta => " + rendas.get().getConta());
        System.out.println("---------------");
        RequestDispatcher dispatcher = req.getRequestDispatcher("/editRenda.jsp");
        dispatcher.forward(req,resp);
    }

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
        dao.update(renda);

        String contextPath = req.getContextPath();
        String homePath = contextPath + "/home";
        req.setAttribute("link",homePath);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/rendaMensal-editada.jsp");
        dispatcher.forward(req,resp);
    }
}
