package com.web.webapplication.model;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

// Specifying the order of the elements in the XML file
@XmlType(propOrder = {"addressNo", "streetNo", "city", "country"})
public class Address {

    private String addressNo;
    private String streetNo;
    private String city;
    private String country;

    @XmlElement(name = "address-no")
    public String getAddressNo() {
        return addressNo;
    }

    public void setAddressNo(String addressNo) {
        this.addressNo = addressNo;
    }
    @XmlElement(name = "street-no")
    public String getStreetNo() {
        return streetNo;
    }

    public void setStreetNo(String streetNo) {
        this.streetNo = streetNo;
    }
    @XmlElement(name = "city")
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
    @XmlElement(name = "country")
    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}
