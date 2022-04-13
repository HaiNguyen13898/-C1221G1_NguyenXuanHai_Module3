import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ProductDiscountServlet", value = "/ProductDiscount")
public class ProductDiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float productPrice = Float.parseFloat(request.getParameter("product-price"));
        String description = request.getParameter("product-name");
        int productDiscount = Integer.parseInt(request.getParameter("product-discount"));
        float discountAmount = (float) (productPrice * productDiscount * 0.01);
        float discountPrice = productPrice - discountAmount;
        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1> Product Description: " + description + "</h1>");
        writer.println("<h1> Product price: " + productPrice + " (VND)" + "</h1>");
        writer.println("<h1> Product discount: " + productDiscount + " (%)" + "</h1>");
        writer.println("<h1>Discount Amount: " + discountAmount + " (VND)" + "</h1>");
        writer.println("<h1>Discount Price: " + discountPrice + " (VND)" + "</h1>");
        writer.println("</html>");

    }
}
