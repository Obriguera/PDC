package com.e3.servlets;

import com.e3.beans.TicketBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.LinkedList;

@WebServlet("/BuscarTickets")
public class BuscarTicketsServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String criterio = req.getParameter("criterio");
        String orden = req.getParameter("orden");

        LinkedList<TicketBean> tickets = new LinkedList<>();

        // Concatenación limpia y segura para Java 8 (fíjate en los espacios al final de cada línea)
        String sql = "SELECT " +
                "  ticket = CONVERT(VARCHAR(4), t.año_ticket) + '-' + REPLICATE('0', 5 - LEN(CONVERT(VARCHAR(5), t.nro_ticket))) + CONVERT(VARCHAR(5), t.nro_ticket), " +
                "  fecha_ticket = CONVERT(VARCHAR(10), t.fecha_ticket, 103) + ' ' + CONVERT(VARCHAR(5), t.fecha_ticket, 108), " +
                "  solicitante = s.nom_solicitante, " +
                "  asunto_ticket = t.asunto_ticket, " +
                "  texto_ticket = t.texto_ticket " +
                "FROM dbo.tickets t (NOLOCK) " +
                "JOIN dbo.solicitantes s (NOLOCK) ON t.nro_solicitante = s.nro_solicitante " +
                "WHERE (t.asunto_ticket LIKE '%' + ISNULL(LTRIM(RTRIM(?)), '') + '%' " +
                "   OR t.texto_ticket LIKE '%' + ISNULL(LTRIM(RTRIM(?)), '') + '%' " +
                "   OR s.nom_solicitante LIKE '%' + ISNULL(LTRIM(RTRIM(?)), '') + '%') " +
                "ORDER BY CASE ? " +
                "  WHEN 'F' THEN CONVERT(VARCHAR(10), t.fecha_ticket, 112) + ' ' + CONVERT(VARCHAR(5), t.fecha_ticket, 108) " +
                "  WHEN 'S' THEN s.nom_solicitante " +
                "  WHEN 'T' THEN CONVERT(VARCHAR(4), t.año_ticket) + '-' + REPLICATE('0', 5 - LEN(CONVERT(VARCHAR(5), t.nro_ticket))) + CONVERT(VARCHAR(5), t.nro_ticket) " +
                "  ELSE CONVERT(VARCHAR(10), t.fecha_ticket, 112) " +
                "END";

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=pdc;encrypt=false", "sa", "123");
                 PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setString(1, criterio);
                stmt.setString(2, criterio);
                stmt.setString(3, criterio);
                stmt.setString(4, orden); // Se mantiene la corrección de la variable 'orden'

                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        TicketBean ticket = new TicketBean();

                        ticket.setTicketNro(rs.getString("ticket"));
                        ticket.setFecha(rs.getString("fecha_ticket"));
                        ticket.setSolicitante(rs.getString("solicitante"));
                        ticket.setAsunto(rs.getString("asunto_ticket"));
                        ticket.setTexto(rs.getString("texto_ticket"));

                        tickets.add(ticket);
                    }
                }
            }

            req.setAttribute("listaTickets", tickets);
            req.getRequestDispatcher("/tablaTickets.jsp").forward(req, resp);

        } catch (ClassNotFoundException | SQLException e) {
            resp.setStatus(400);
            resp.setContentType("text/plain;charset=UTF-8");
            resp.getWriter().write("Error en la consulta de tickets: " + e.getMessage());
        }
    }
}