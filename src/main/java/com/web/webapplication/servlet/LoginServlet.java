package com.web.webapplication.servlet;

import java.io.*;

import com.web.webapplication.dao.LoginDao;
import com.web.webapplication.model.Login;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.xml.bind.JAXBException;

@WebServlet(name = "loginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private final long serialVersionUID = 1L;

    public void init() {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
        resp.setContentType("text/html");

        //Storing the parameters as variables
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        //Create new Login object
        Login login = new Login();
        login.setUsername(username);
        login.setPassword(password);
        req.setAttribute("login", login);

        try {
            // Get the servlet context
            ServletContext context = getServletContext();

            // Use the servlet context's real path to the webapp root directory
            String rootPath = context.getRealPath("/");

            // Instantiate the class that handles the data access
            LoginDao ldao = new LoginDao(rootPath);
            System.out.println(ldao.convertXMLtoObject() ? "Login Success" : "Login not successful");
            ;
            System.out.println(req.getContextPath());
            resp.setHeader("Location", req.getContextPath() + "/employee.jsp");
        } catch (JAXBException e) {
            e.printStackTrace();
        }

    }

    public void destroy() {
    }
}
