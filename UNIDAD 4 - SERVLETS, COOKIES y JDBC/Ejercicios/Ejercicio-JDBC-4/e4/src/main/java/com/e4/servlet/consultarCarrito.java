package com.e4.servlet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

import com.e4.bean.productoCarritoBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;
import java.util.LinkedList;

@WebServlet("/consultarCarrito")
public class consultarCarrito extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        Integer nroCarrito = (Integer) session.getAttribute("nroCarrito");

        LinkedList<productoCarritoBean> listaProductos = new LinkedList<>();

        if (nroCarrito != null && nroCarrito > 0){
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

                String sqlSelect = "SELECT nroDetalle = d.nro_detalle, " +
                        "codBarra = p.cod_barra, " +
                        "nomProducto = p.nom_producto, " +
                        "precio = p.precio " +
                        "FROM dbo.detalle_carritos d (nolock) " +
                        "JOIN dbo.productos p (nolock) ON d.nro_producto = p.nro_producto " +
                        "WHERE d.nro_carrito = ? " +
                        "ORDER BY d.fecha_hora_registro";

                try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=pdc;encrypt=false", "sa", "123");
                     PreparedStatement stmt = conn.prepareStatement(sqlSelect)) {

                    stmt.setInt(1, nroCarrito);

                    try(ResultSet rs = stmt.executeQuery()){
                        while (rs.next()){
                            productoCarritoBean p = new productoCarritoBean();
                            p.setNroDetalle(rs.getInt("nroDetalle"));
                            p.setCodBarra(rs.getString("codBarra"));
                            p.setNomProducto(rs.getString("nomProducto"));
                            p.setPrecio(rs.getDouble("precio"));
                            listaProductos.add(p);
                        }
                    }
                }

            } catch (ClassNotFoundException | SQLException e) {
                resp.setStatus(400);
                resp.getWriter().write("Error en PreparedStatement: " + e.getMessage());
            }
        }
        // Enviamos la lista al JSP (puede ir vacía si es un carrito nuevo)
        req.setAttribute("listaCarrito", listaProductos);
        req.getRequestDispatcher("/listaProductos.jsp").forward(req, resp);
    }
}
