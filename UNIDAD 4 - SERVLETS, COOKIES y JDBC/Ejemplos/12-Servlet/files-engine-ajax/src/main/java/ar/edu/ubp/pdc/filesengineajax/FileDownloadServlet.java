package ar.edu.ubp.pdc.filesengineajax;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;

public class FileDownloadServlet extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "uploads";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Recibo parámetro con el nombre del archivo
        String fileName = req.getParameter("file");

        //Determino si el archivo existe en el directorio
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        File file = new File(uploadPath + File.separator + fileName);
        if (file.exists() && file.isFile()) {
            //Configuro la respuesta HTTP para la descarga del archivo
            resp.setContentType(Files.probeContentType(file.toPath()));
            resp.setContentLength((int) file.length());
            resp.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

            //Leo el archivo y escribo en el OutputStream de la respuesta
            try (FileInputStream fileInputStream = new FileInputStream(file);
                 OutputStream outputStream = resp.getOutputStream()) {

                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                while ((bytesRead = fileInputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
            }
        }
        else {
            //En caso de error, establezco el mensaje y devuelvo la página de error
            resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
            req.setAttribute("error", "El archivo no existe");
            req.getRequestDispatcher("/error-page.jsp").forward(req, resp);
        }
    }

}