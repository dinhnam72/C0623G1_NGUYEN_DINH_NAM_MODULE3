package com.example.ss09;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "servlet", value = "/servlet")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productPescription = request.getParameter("productPescription");
        double listPrice = Double.parseDouble(request.getParameter("listPrice"));
        double discountPercent = Double.parseDouble(request.getParameter("discountPercent"));
        double discountAmount  = listPrice*discountPercent* 0.01;
        double discountPrice = listPrice-discountAmount;
        request.setAttribute("productPescription",productPescription);
        request.setAttribute("listPrice",listPrice);
        request.setAttribute("discountPercent",discountPercent);
        request.setAttribute("discountAmount",discountAmount);
        request.setAttribute("discountPrice",discountPrice);
        RequestDispatcher requestDispatcher =request.getRequestDispatcher("/result.jsp");
        requestDispatcher.forward(request,response);

    }
}
