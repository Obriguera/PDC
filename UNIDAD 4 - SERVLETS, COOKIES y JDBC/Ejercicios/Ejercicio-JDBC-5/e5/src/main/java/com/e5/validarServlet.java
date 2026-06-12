package com.e5;

import com.e5.reservaBean;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/validar")
public class validarServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String documento = req.getParameter("documento");
        String codReserva = req.getParameter("cod_reserva");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=pdc;encrypt=false", "sa", "123");
                 CallableStatement stmt = conn.prepareCall("{call dbo.val_reserva(?, ?)}")) {

                stmt.setString(1, documento);
                stmt.setString(2, codReserva);

                ResultSet rs = stmt.executeQuery();
                reservaBean reserva = new reservaBean();
                if (rs.next()) {
                    reserva.setApellido(rs.getString("apellido"));
                    reserva.setNombre(rs.getString("nombre"));
                    reserva.setNroCliente(rs.getInt("nroCliente"));
                    reserva.setTipoClaseDesc(rs.getString("tipoClaseDesc"));
                    reserva.setTipoClase(rs.getString("tipoClase"));
                    reserva.setFechaReserva(rs.getString("fechaReserva"));
                    reserva.setNroReserva(rs.getInt("nroReserva"));
                }

                req.setAttribute("reserva", reserva);
                req.getRequestDispatcher("datos.jsp").forward(req, resp);
            }
        } catch (ClassNotFoundException | SQLException e) {
            resp.setStatus(400);
            req.setAttribute("error", e.getMessage());
            resp.getWriter().write(e.getMessage());
        }
    }

}
