package com.briup.bean;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.springframework.stereotype.Component;
@Data
public class ShippingAddress {
    private Long id;
    private String name;
    private String address;
    private String phoneNum;
    private boolean defaultValue;
    private User user;

    @Override
    public String toString() {
        return "ShippingAddress{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", address='" + address + '\'' +
                ", phoneNum='" + phoneNum + '\'' +
                ", defaultValue=" + defaultValue +
                '}';
    }

    public ShippingAddress(Long id) {
        this.id = id;
    }

    public ShippingAddress() {
    }

    public ShippingAddress(Long id, String name, String address, String phoneNum, boolean defaultValue, User user) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.phoneNum = phoneNum;
        this.defaultValue = defaultValue;
        this.user = user;
    }
}
