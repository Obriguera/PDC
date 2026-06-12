package com.e1.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/carga")
public class cargaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String preguntaChasis = req.getParameter("preguntaChasis");
        String chasis = req.getParameter("chasis");
        String patente = req.getParameter("patente");
        String kmStr = req.getParameter("kilometros");

        String apellido = req.getParameter("apellido");
        String nombre = req.getParameter("nombre");
        String email = req.getParameter("email");
        String telefono = req.getParameter("telefono");
        String contactar = req.getParameter("preguntaVendedor");
        String reclamoTexto = req.getParameter("reclamo");

        if ("no".equals(preguntaChasis)) {
            chasis = null;
            patente = null;
            kmStr = null;
        }

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try(Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=pdc;encrypt=false", "sa", "123");
                PreparedStatement stmt = conn.prepareCall("insert into dbo.reclamos(nro_chasis, dominio, km, apellido, nombre, email, telefono, contactar, reclamo) values(?, ?, ?, ?, ?, ?, ?, ?, ?)")) {

                if (chasis == null || chasis.trim().isEmpty()) { stmt.setNull(1, Types.VARCHAR); }
                else stmt.setString(1, chasis.trim());

                if (patente == null || patente.trim().isEmpty()) { stmt.setNull(2, Types.VARCHAR); }
                else stmt.setString(2, patente.trim());

                if (kmStr == null || kmStr.trim().isEmpty()) { stmt.setNull(3, Types.INTEGER); }
                else stmt.setInt(3, Integer.parseInt(kmStr.trim()));

                stmt.setString(4, apellido.trim());
                stmt.setString(5, nombre.trim());
                stmt.setString(6, email.trim());

                if (telefono == null || telefono.trim().isEmpty()) { stmt.setNull(7, Types.VARCHAR); }
                else stmt.setString(7, telefono.trim());

                stmt.setString(8, "yes".equals(contactar) ? "S" : "N");
                stmt.setString(9, reclamoTexto.trim());

                int filasAfectadas = stmt.executeUpdate();

                resp.setContentType("text/plain");
                if(filasAfectadas > 0)
                {
                    resp.getWriter().write("OK");
                }
                else {
                    resp.getWriter().write("ERROR");
                }
            }
        }
        catch (ClassNotFoundException | SQLException e) {
            resp.setStatus(500);
            resp.getWriter().write("Error en la base de datos: " + e.getMessage());
            e.printStackTrace();
        }
    }

}