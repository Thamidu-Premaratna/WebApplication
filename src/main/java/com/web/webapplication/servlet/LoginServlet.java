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
        resp.setContentType("text/html");

        //Storing the parameters as variables
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        //Create new Login object to store the parameters
        Login login = new Login();
        login.setUsername(username);
        login.setPassword(password);

        //Setting the role of the user
        if(username.equals("admin")) {
            login.setRole("admin");
        } else {
            login.setRole("user");
        }
        try {
            // Get the servlet context
            ServletContext context = getServletContext();

            // Use the servlet context's real path to the webapp root directory
            String rootPath = context.getRealPath("/");

            // Instantiate the class that handles the data access
            LoginDao loginDao = new LoginDao(rootPath, login);

            //Check if the login is successful and get the role of the user
            String msg = loginDao.getLogin();
            if(msg.equals("ok")) {
                // Move to employeeview.jsp with the login attributes
                req.setAttribute("role", login.getRole());
                req.getRequestDispatcher("employeeview.jsp").forward(req, resp);
            } else {
                // Move to index.jsp with the error message
                req.setAttribute("error_msg", msg);
                req.getRequestDispatcher("index.jsp").forward(req, resp);
            }
        } catch (JAXBException e) {
            e.printStackTrace();
        }

    }

    public void destroy() {
    }
}
