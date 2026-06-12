package com.e5;

import com.e5.reservaBean;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/enviar")
public class enviarServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try(Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=pdc;encrypt=false", "sa", "123")) {
                conn.setAutoCommit(false);

                try(PreparedStatement stmt = conn.prepareStatement("insert into dbo.mejoras_reservas(nro_reserva, tipo_clase, monto) values(?, ?, ?)") )
                {
                    stmt.setInt(1, Integer.parseInt(req.getParameter("nro_reserva")));
                    stmt.setString(2, req.getParameter("tipo_clase"));
                    stmt.setDouble(3, Double.parseDouble(req.getParameter("monto")));

                    stmt.executeUpdate();
                    conn.commit();

                    req.getRequestDispatcher("mensaje.jsp").forward(req, resp);
                }
                catch (SQLException ex) {
                    conn.rollback();
                    throw ex;
                }

            }
        }
        catch (ClassNotFoundException | SQLException e) {
            resp.setStatus(400);
            req.setAttribute("error", e.getMessage());
            resp.getWriter().write(e.getMessage());
        }
    }
}
