// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.actioncenter.domain;

import java.lang.String;

privileged aspect Coupon_Roo_ToString {
    
    public String Coupon.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Amount: ").append(getAmount()).append(", ");
        sb.append("Couponbatchchannelid: ").append(getCouponbatchchannelid()).append(", ");
        sb.append("Couponbatchid: ").append(getCouponbatchid()).append(", ");
        sb.append("Couponcode: ").append(getCouponcode()).append(", ");
        sb.append("Createtime: ").append(getCreatetime()).append(", ");
        sb.append("Mobile: ").append(getMobile()).append(", ");
        sb.append("Reusable: ").append(getReusable()).append(", ");
        sb.append("State: ").append(getState()).append(", ");
        sb.append("Userno: ").append(getUserno()).append(", ");
        sb.append("Usetime: ").append(getUsetime()).append(", ");
        sb.append("Validity: ").append(getValidity());
        return sb.toString();
    }
    
}