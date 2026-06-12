package com.e2.servlets;

import com.e2.beans.UnidadNegocioBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.LinkedList;

@WebServlet("/index.jsp")
public class inicioServlet extends HttpServlet{

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LinkedList<UnidadNegocioBean> unidadesNegocio = new LinkedList<>();

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=pdc;encrypt=false", "sa", "123");
                 Statement stmt = conn.createStatement();
                 ResultSet result = stmt.executeQuery(
                         "select cod_unidad_negocio = '-1', nom_unidad_negocio = 'No informada', nro_orden = 0 " +
                                 "union all " +
                                 "select cod_unidad_negocio = cod_unidad_negocio, nom_unidad_negocio = nom_unidad_negocio, " +
                                 "nro_orden = row_number() over(order by nom_unidad_negocio) " +
                                 "from dbo.unidades_negocio (nolock) " +
                                 "order by nro_orden"))
            {
                while (result.next()) {
                    UnidadNegocioBean unidad = new UnidadNegocioBean();
                    unidad.setCod_unidad_negocio(result.getString("cod_unidad_negocio"));
                    unidad.setNom_unidad_negocio(result.getString("nom_unidad_negocio"));
                    unidadesNegocio.add(unidad);
                }
            }

            request.setAttribute("unidadesNegocio", unidadesNegocio);
            request.getRequestDispatcher("/inicio.jsp").forward(request, response);
        }
        catch (ClassNotFoundException | SQLException e) {
            response.setStatus(400);
            request.getSession().setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/error-page.jsp").forward(request, response);
        }
    }

}



