// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.actioncenter.domain;

import com.ruyicai.actioncenter.domain.VipUserPK;
import java.math.BigDecimal;
import java.util.Date;

privileged aspect VipUser_Roo_JavaBean {
    
    public VipUserPK VipUser.getId() {
        return this.id;
    }
    
    public void VipUser.setId(VipUserPK id) {
        this.id = id;
    }
    
    public BigDecimal VipUser.getBuyamt() {
        return this.buyamt;
    }
    
    public void VipUser.setBuyamt(BigDecimal buyamt) {
        this.buyamt = buyamt;
    }
    
    public Date VipUser.getModifyTime() {
        return this.modifyTime;
    }
    
    public void VipUser.setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }
    
}
