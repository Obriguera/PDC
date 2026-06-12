package com.e2.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet("/GuardarSubtipos")
public class GuardarSubtipos extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String[] codigosTipo = req.getParameterValues("arrCodTipo");
        String[] numerosSubtipo = req.getParameterValues("arrNroSubtipo");
        String[] estadosHabilitado = req.getParameterValues("arrHabilitado");

        if (codigosTipo == null || codigosTipo.length == 0) {
            resp.setStatus(400);
            resp.getWriter().write("No hay datos para modificar.");
            return;
        }

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=pdc;encrypt=false", "sa", "123");
                 PreparedStatement stmt = conn.prepareStatement("UPDATE sc SET habilitado = ? " +
                         "FROM dbo.subtipos_clientes sc " +
                         "WHERE cod_tipo_cliente = ? AND nro_subtipo = ?")
            )
            {
                conn.setAutoCommit(false);
                try {

                    for (int i = 0; i < codigosTipo.length; i++) {
                        stmt.setString(1, estadosHabilitado[i]);
                        stmt.setString(2, codigosTipo[i]);
                        stmt.setInt(3, Integer.parseInt(numerosSubtipo[i]));

                        // Encolamos en memoria (Batch)
                        stmt.addBatch();
                    }

                    // 4. Enviamos todas las actualizaciones juntas a la base de datos
                    stmt.executeBatch();

                    // Si t0do salio bien, consolidamos los cambios
                    conn.commit();
                    resp.setStatus(200);

                } catch (SQLException e) {
                    conn.rollback();
                    throw e;
                }
            }

        } catch (ClassNotFoundException | SQLException e) {
            resp.setStatus(400);
            resp.getWriter().write("Error al actualizar la base de datos: " + e.getMessage());
        }
    }
}