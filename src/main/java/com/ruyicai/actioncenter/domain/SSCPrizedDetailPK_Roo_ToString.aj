// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.actioncenter.domain;

import java.lang.String;

privileged aspect SSCPrizedDetailPK_Roo_ToString {
    
    public String SSCPrizedDetailPK.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Day: ").append(getDay()).append(", ");
        sb.append("Userno: ").append(getUserno());
        return sb.toString();
    }
    
}
