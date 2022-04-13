import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "caculatorServlet", value = "/calculator")
public class caculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double firstNumber = Double.parseDouble(request.getParameter("first-number"));
        double secondNumber = Double.parseDouble(request.getParameter("second-number"));
        double result = 0;
        String mess = "";
        String operator = request.getParameter("operators");
        if (operator.equals("addition")) {
            result = firstNumber + secondNumber;
            PrintWriter printWriter = response.getWriter();
            printWriter.println("<html>");
            printWriter.println("<h1> Result: " + "</h1>");
            printWriter.println(firstNumber + " + " + secondNumber + " = " + result);
            printWriter.println("</html>");
        } else if (operator.equals("subtraction")) {
            result = firstNumber - secondNumber;
            PrintWriter printWriter = response.getWriter();
            printWriter.println("<html>");
            printWriter.println("<h1> Result: " + "</h1>");
            printWriter.println(firstNumber + " - " + secondNumber + " = " + result);
            printWriter.println("</html>");

        } else if (operator.equals("multiplication")) {
            result = firstNumber * secondNumber;
            PrintWriter printWriter = response.getWriter();
            printWriter.println("<html>");
            printWriter.println("<h1> Result: " + "</h1>");
            printWriter.println(firstNumber + " * " + secondNumber + " = " + result);
            printWriter.println("</html>");

        } else if (operator.equals("division")) {
            if (secondNumber != 0 ) {
                result = firstNumber / secondNumber;
                PrintWriter printWriter = response.getWriter();
                printWriter.println("<html>");
                printWriter.println("<h1> Result: " + "</h1>");
                printWriter.println(firstNumber + " / " + secondNumber + " = " + result);
                printWriter.println("</html>");
            } else {
                mess = "Khong duoc bang 0";
                PrintWriter printWriter = response.getWriter();
                printWriter.println("<html>");
                printWriter.println("<h1> Result: " + "</h1>");
                printWriter.println(mess);
                printWriter.println("</html>");
            }

        }


    }
}
