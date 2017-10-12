package org.dimigo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(description = "첫번째 서블릿", urlPatterns = { "/hello" })
public class HelloServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    public HelloServlet() {
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        //요청 데이터 처리
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        System.out.printf("id : %s, name : %s\n", id, name);

        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet Test</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Hello, Servlet</h1>");
        out.println("<h2>안녕, 서블릿</h2>");
        out.println("<h2>id : " + id + ", name : " + name + "</h2>");
        out.println("</body>");
        out.println("</html>");

        out.close();
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doPost() 호출 됨");
        doGet(request, response);

    }
    @Override
    public void init() throws ServletException {
        System.out.println("init()");
    }

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        System.out.println("service()");
        super.service(req, res);
    }

    @Override
    public void destroy() {
        System.out.println("destroy()1111");
    }
}