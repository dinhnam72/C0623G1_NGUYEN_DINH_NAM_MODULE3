package com.example.ss10;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "customer", value = "")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();

    static {
        Customer customer1 = new Customer(1, "Mai Văn Hoàn", "1983-08-20", "Hà Nội","https://i.ex-cdn.com/mgn.vn/files/content/2022/09/18/lmht-5-trang-phuc-dinh-nhat-cua-dong-skin-hoc-vien-chien-binh_4-2145.jpg");
        Customer customer2 = new Customer(2, "Nguyễn Văn Nam", "1983-08-21", "Bắc Giang","https://i.ex-cdn.com/mgn.vn/files/content/2022/11/26/lmht-gragas-rat-can-mot-ban-rework-visual-nhu-the-nay-1504.jpg");
        Customer customer3 = new Customer(3, "Nguyễn Thái Hòa", "1983-08-22", "Nam Định","https://i.ex-cdn.com/mgn.vn/files/news/2022/09/28/lmht-visual-va-bo-ki-nang-moi-cua-ahri-chinh-thuc-duoc-lo-dien-101717.jpg");
        Customer customer4 = new Customer(4, "Trần Đăng Khoa", "1983-08-17", "Hà Tây","https://www.jbo247.com/wp-content/uploads/2022/09/LMHT-12.19-1.jpg");
        Customer customer5 = new Customer(5, "Nguyễn Đình Thi", "1983-08-19", "Hà Nội","https://toigingiuvedep.vn/wp-content/uploads/2021/07/nhung-hinh-anh-nen-zed-dep-5.jpg");
        customerList.add(customer1);
        customerList.add(customer2);
        customerList.add(customer3);
        customerList.add(customer4);
        customerList.add(customer5);
    }

    ;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList", customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/list.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
