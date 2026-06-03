package ar.edu.ubp.pdc.filesengineajax;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/index.jsp")
public class FilesServlet extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "uploads";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        List<String> fileList = new LinkedList<>();

        //Verifico que el directorio principal exista
        File uploadDir = new File(uploadPath);
        if (uploadDir.exists()) {
            //Obtengo la lista de archivos subidos
            fileList = Files.list(Paths.get(uploadPath))
                    .map(path -> path.getFileName().toString())
                    .collect(Collectors.toList());
        }

        //Despacho la lista de archivos a la página JSP
        req.setAttribute("fileList", fileList);
        req.getRequestDispatcher("/files.jsp").forward(req, resp);
    }

}
