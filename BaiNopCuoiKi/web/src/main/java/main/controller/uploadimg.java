package main.controller;

import main.services.useService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.Iterator;
import java.util.List;
import main.bean.User;


@WebServlet(name = "UploadDownloadFileServlet", value = "/UploadDownloadFileServlet")
public class uploadimg extends HttpServlet {
        private static final long serialVersionUID = 1L;
        private ServletFileUpload uploader = null;

        @Override
        public void init() throws ServletException {
            DiskFileItemFactory fileFactory = new DiskFileItemFactory();
            File filesDir = (File) getServletContext().getAttribute("FILES_DIR_FILE");
            fileFactory.setRepository(filesDir);
            this.uploader = new ServletFileUpload(fileFactory);
        }

        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String fileName = request.getParameter("fileName");


            if (fileName == null || fileName.equals("")) {
                throw new ServletException("File Name can't be null or empty");
            }
            File file = new File(request.getServletContext().getAttribute("FILES_DIR") + File.separator + fileName);
            if (!file.exists()) {
                throw new ServletException("File doesn't exists on server.");
            }
            ServletContext ctx = getServletContext();
            InputStream fis = new FileInputStream(file);
            String mimeType = ctx.getMimeType(file.getAbsolutePath());
            response.setContentType(mimeType != null ? mimeType : "application/octet-stream");
            response.setContentLength((int) file.length());
            response.setHeader("Contenṭ-Disposition", "attachment; filename=\"" + fileName + "\"");

            ServletOutputStream os = response.getOutputStream();
            byte[] bufferData = new byte[1024];
            int read = 0;
            while ((read = fis.read(bufferData)) != -1) {
                os.write(bufferData, 0, read);
            }


            os.flush();
            os.close();
            fis.close();

        }

        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            if(!ServletFileUpload.isMultipartContent(request)){
                throw new ServletException("Content type is not multipart/form-data");
            }

            PrintWriter out = response.getWriter();

            try {
                List<FileItem> fileItemsList = uploader.parseRequest(request);
                Iterator<FileItem> fileItemsIterator = fileItemsList.iterator();
                while(fileItemsIterator.hasNext()){
                    FileItem fileItem = fileItemsIterator.next();

                    File file = new File(request.getServletContext().
                            getAttribute("FILES_DIR")+File.separator+fileItem.getName());
                    fileItem.write(file);
                    HttpSession session=request.getSession();
                    User user = (User) session.getAttribute("auth");
                    useService.getInstance().upImg(user.getUserId(), "img"+File.separator+"IMG"+File.separator+fileItem.getName());
                    User userinfor = useService.getInstance().getAllUserByID(user.getUserId());
                    session.setAttribute("userID", userinfor);
                    request.getRequestDispatcher("Chinhsuathongtin.jsp").forward(request,response);
                }
            } catch (FileUploadException e) {
              e.printStackTrace();
            } catch (Exception e) {
              e.printStackTrace();
            }

        }




}
