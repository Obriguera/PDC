

package com.e1.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/validar")
public class validarServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String chasis = req.getParameter("chasis");
        String patente = req.getParameter("patente");

        // Configurar la respuesta como texto plano
        resp.setContentType("text/plain");
        resp.setCharacterEncoding("UTF-8");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try(Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=pdc;encrypt=false", "sa", "123");
                CallableStatement stmt = conn.prepareCall("{call dbo.val_vehiculo(?,?,?)}")) {
                stmt.setString(1, chasis.trim());

                if(patente == null || patente.trim().isEmpty())
                {
                    stmt.setNull(2, Types.VARCHAR);
                }
                else
                {
                    stmt.setString(2, patente.trim());
                }

                stmt.registerOutParameter(3, Types.CHAR);
                stmt.execute();

                String existe = stmt.getString(3);

                // 5. Responder directamente al JavaScript del Front-end
                try (PrintWriter out = resp.getWriter()) {
                    out.write(existe);
                }
            }
        }
        catch (ClassNotFoundException | SQLException e) {
            resp.setStatus(500);
            resp.setContentType("text/plain");
            resp.setCharacterEncoding("UTF-8");
            try (PrintWriter out = resp.getWriter()) {
                out.write(e.getMessage()); // Envía solo el texto del error al fetch
            }
        }
    }

}