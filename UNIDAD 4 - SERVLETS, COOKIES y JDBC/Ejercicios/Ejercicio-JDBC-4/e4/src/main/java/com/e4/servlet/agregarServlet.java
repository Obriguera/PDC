package com.e4.servlet;

import com.e4.bean.productoBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.LinkedList;

@WebServlet("/agregarProducto")
public class agregarServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            String codBarra = req.getParameter("inputCodigo");

            Integer nroCarrito = (req.getSession().getAttribute("nroCarrito") != null) ? (Integer) req.getSession().getAttribute("nroCarrito") : 0;

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try(Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=pdc;encrypt=false", "sa", "123")) {
                conn.setAutoCommit(false);
                try(CallableStatement stmt = conn.prepareCall("{call dbo.ins_producto_carrito(?, ?)}"))
                {

                    if (nroCarrito == 0){
                        stmt.setNull(1, Types.INTEGER);
                    }
                    else {
                        stmt.setInt(1, nroCarrito);
                    }

                    //Le digo a JBC que la database va a devolver un valor en este parámetro
                    stmt.registerOutParameter(1, Types.INTEGER);

                    stmt.setString(2, codBarra);


                    productoBean nuevoProducto = new productoBean();
                    try (ResultSet rs = stmt.executeQuery()) {
                        if (rs.next()) {
                            nuevoProducto.setNroDetalle(rs.getInt("nroDetalle"));
                            nuevoProducto.setNomProducto(rs.getString("nomProducto"));
                            nuevoProducto.setCodBarra(rs.getString("codBarra"));
                            nuevoProducto.setPrecio(rs.getString("precio"));
                        }
                    }
                    int nuevoNroCarrito = stmt.getInt(1);
                    req.getSession().setAttribute("nroCarrito", nuevoNroCarrito);

                    conn.commit();
                    req.setAttribute("producto", nuevoProducto);
                    req.getRequestDispatcher("productoNuevo.jsp").forward(req, resp);
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

