package ar.edu.ubp.pdc.filesengineajax;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@MultipartConfig
public class FileUploadServlet extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "uploads";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            //Creo el directorio de archivos si no existe
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            //Proceso la subida del archivo
            String fileName = null;
            for (Part part : req.getParts()) {
                if(part.getSubmittedFileName() != null) {
                    fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                    part.write(uploadPath + File.separator + fileName);
                }
            }

            //Valido si el archivo pudo ser procesado
            if (fileName != null) {
                req.setAttribute("file", fileName);
                req.getRequestDispatcher("/file.jsp").forward(req, resp);
            }
            else {
                throw new ServletException("El archivo es innaccesible");
            }
        }
        catch(Exception e) {
            //En caso de error, establezco el mensaje y devuelvo el modal de error
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            req.setAttribute("error", e.getMessage());
            req.getRequestDispatcher("/error-modal.jsp").forward(req, resp);
        }
    }

}
