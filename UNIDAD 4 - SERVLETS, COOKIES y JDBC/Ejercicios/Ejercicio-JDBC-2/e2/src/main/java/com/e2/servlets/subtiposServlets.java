package com.e2.servlets;

import com.e2.beans.SubtipoClienteBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.LinkedList;

@WebServlet("/subtipos")
public class subtiposServlets extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String codUnidadNegocio = req.getParameter("codUnidadNegocio");

        LinkedList<SubtipoClienteBean> listaSubtipos = new LinkedList<>();

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try(Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=pdc;encrypt=false", "sa", "123");
                CallableStatement stmt = conn.prepareCall("{call dbo.get_subtipos_clientes (?)}")) {

                if (codUnidadNegocio == null || codUnidadNegocio.trim().isEmpty()){
                    stmt.setNull(1, Types.VARCHAR);
                }else {
                    stmt.setString(1, codUnidadNegocio);
                }

                ResultSet rs = stmt.executeQuery();

                while (rs.next()) {
                    SubtipoClienteBean subtipo = new SubtipoClienteBean();

                    subtipo.setCod_tipo_cliente(rs.getString("cod_tipo_cliente"));
                    subtipo.setHabilitado(rs.getString("habilitado"));
                    subtipo.setNom_tipo_cliente(rs.getString("nom_tipo_cliente"));
                    subtipo.setNro_subtipo(rs.getString("nro_subtipo"));
                    listaSubtipos.add(subtipo);
                }
                req.setAttribute("listaSubtipos", listaSubtipos);
                req.getRequestDispatcher("/subtiposTabla.jsp").forward(req, resp);
            }
        }
        catch (ClassNotFoundException | SQLException e) {
            resp.setStatus(400);
            req.setAttribute("error", e.getMessage());
            req.getRequestDispatcher("error-modal.jsp").forward(req, resp);
        }
    }
}
