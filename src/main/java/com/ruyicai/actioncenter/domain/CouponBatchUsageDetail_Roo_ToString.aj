// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.actioncenter.domain;

import java.lang.String;

privileged aspect CouponBatchUsageDetail_Roo_ToString {
    
    public String CouponBatchUsageDetail.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Usetime: ").append(getUsetime());
        return sb.toString();
    }
    
}