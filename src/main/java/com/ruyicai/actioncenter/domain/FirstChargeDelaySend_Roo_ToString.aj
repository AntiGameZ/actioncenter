// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.actioncenter.domain;

import java.lang.String;

privileged aspect FirstChargeDelaySend_Roo_ToString {
    
    public String FirstChargeDelaySend.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Amt: ").append(getAmt()).append(", ");
        sb.append("BusinessId: ").append(getBusinessId()).append(", ");
        sb.append("CreateTime: ").append(getCreateTime()).append(", ");
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Memo: ").append(getMemo()).append(", ");
        sb.append("SendState: ").append(getSendState()).append(", ");
        sb.append("SendTime: ").append(getSendTime()).append(", ");
        sb.append("Userno: ").append(getUserno());
        return sb.toString();
    }
    
}
