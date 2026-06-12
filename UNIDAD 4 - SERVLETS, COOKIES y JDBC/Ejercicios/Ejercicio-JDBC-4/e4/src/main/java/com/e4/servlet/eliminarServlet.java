package com.e4.servlet;

import com.e4.bean.productoBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;
import java.util.LinkedList;

@WebServlet("/eliminarProducto")
public class eliminarServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String nroDetalleStr = req.getParameter("nroDetalle");

        HttpSession session = req.getSession();
        Integer nroCarrito = (Integer) session.getAttribute("nroCarrito");

        if (nroCarrito == null || nroDetalleStr == null){
            resp.setStatus(400);
            resp.getWriter().write("Faltan datos para eliminar el producto");
            return;
        }

        int numeroDetalle = Integer.parseInt(nroDetalleStr);

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            String sqlModificacion = "DELETE d FROM dbo.detalle_carritos d where d.nro_carrito = ? and d.nro_detalle = ?";

            try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=pdc;encrypt=false", "sa", "123");
                 PreparedStatement stmt = conn.prepareStatement(sqlModificacion)
            ) {
                // 1. ACTIVAR TRANSACCIÓN MANUAL
                conn.setAutoCommit(false);

                try {
                    stmt.setInt(1, nroCarrito);
                    stmt.setInt(2, numeroDetalle);

                    int filasAfectadas = stmt.executeUpdate();

                    if (filasAfectadas == 0){
                        throw new SQLException("El producto no se encontró en el carrito.");
                    }

                    conn.commit();
                    resp.setStatus(200);

                } catch (SQLException e) {
                    conn.rollback();
                    throw e;
                }
            }

        } catch (ClassNotFoundException | SQLException e) {
            resp.setStatus(400);
            resp.getWriter().write("Error al eliminar producto: " + e.getMessage());
        }
    }
}

