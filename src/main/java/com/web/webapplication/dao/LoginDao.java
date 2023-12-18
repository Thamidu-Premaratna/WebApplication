package com.web.webapplication.dao;

import com.web.webapplication.model.Login;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import java.io.File;
import java.io.FileNotFoundException;

public class LoginDao {
    private final String filePath;
    public LoginDao(String rootPath){

        // relative path of the xml file
        String relativePath = "xml/LoginXML/web-login.xml";
        this.filePath = rootPath + relativePath;
    }
    // Convert the saved user login data from XML -> object
    public boolean convertXMLtoObject() throws JAXBException,FileNotFoundException{
        System.out.println("Converting XML to Object");
        JAXBContext context = JAXBContext.newInstance(Login.class);
        Unmarshaller um = context.createUnmarshaller();
        Login loginUM = (Login) um.unmarshal(new File(filePath));
        System.out.println(loginUM.getUsername()+" "+loginUM.getPassword());
        return loginUM.validate();
    }


}
