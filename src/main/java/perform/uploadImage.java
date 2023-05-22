package perform;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "uploadImage", urlPatterns = {"/uploadImage"})
@MultipartConfig(maxFileSize = 16177216)//1.5mb
public class uploadImage extends HttpServlet {

    PrintWriter out;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        out = res.getWriter();
        String url = "jdbc:mysql://localhost:3306/itmini?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String user = "root";
        String pass = "Rishik@123";
        int result = 0;
        Part part = req.getPart("image");
        String name = req.getParameter("name");
        String desc = req.getParameter("desc");
        String cate = req.getParameter("cate");
        int price = Integer.parseInt(req.getParameter("price"));
        int stock = Integer.parseInt(req.getParameter("stock"));
        if (part != null) {
            try {
                Connection con = DriverManager.getConnection(url,user,pass);
                PreparedStatement ps = con.prepareStatement("insert into items(name,category,price,description,pic,stock) values(?,?,?,?,?,?)");
                InputStream is = part.getInputStream();
                ps.setBlob(5, is);
                ps.setString(1, name);
                ps.setString(2, cate);
                ps.setInt(3,price);
                ps.setString(4, desc);
                ps.setInt(6,stock);
                result = ps.executeUpdate();
                RequestDispatcher rd = req.getRequestDispatcher("home.jsp");
                rd.include(req,res);
                if (result > 0) {
                	out.println("<html><head></head><body onload = \"alert('Item Added')\"></body></html>");
                }
            } catch (Exception e) {
                out.println(e);
            }
        }
    }

}