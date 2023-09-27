package com.example.ss10bt2;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculator-servlet")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double firstOperand = Double.parseDouble(request.getParameter("firstOperand"));
        String calculation = request.getParameter("calculation");
        double secondOperand = Double.parseDouble(request.getParameter("secondOperand"));
        String result= Calculator.calculate(firstOperand,calculation,secondOperand);
        request.setAttribute("result",result);
        request.setAttribute("firstOperand",firstOperand);
        request.setAttribute("calculation",calculation);
        request.setAttribute("secondOperand",secondOperand);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        requestDispatcher.forward(request,response);
    }
}
