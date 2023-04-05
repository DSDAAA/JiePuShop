package com.briup.bean;

import lombok.Data;
import org.springframework.stereotype.Component;
import org.springframework.util.DigestUtils;

import java.util.List;

@Data
@Component
public class User {
    private Long id;
    private String nickName;
    private String loginName;
    private String passwordMd5;
    private String phone;
    private String eMail;
    private String address;
    private  boolean isLock;
    private List<ShippingAddress> addresses;
}
