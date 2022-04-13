import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ListCustomerServlet", value = "/listCustomer")
public class ListCustomerServlet extends HttpServlet {
    List<Customer> customerList;

    @Override
    public void init(ServletConfig config) throws ServletException {
        customerList = new ArrayList<>();
        customerList.add(new Customer("Hải", "13/08/1998", "94 lê quang đạo", "https://picsum.photos/536/354"));
        customerList.add(new Customer("Hồng", "07/08/1931", "94 lê quang đạo", "https://picsum.photos/536/354"));
        customerList.add(new Customer("Giảng", "13/08/1998", "94 lê quang đạo", "https://picsum.photos/536/354"));
        customerList.add(new Customer("Khoa", "13/08/1998", "94 lê quang đạo", "https://picsum.photos/536/354"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("list", customerList);
        request.getRequestDispatcher("listCustomer.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
