// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.lottery.dto;

import java.lang.String;

privileged aspect OrderRequest_Roo_ToString {
    
    public String OrderRequest.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Accountnomoneysms: ").append(getAccountnomoneysms()).append(", ");
        sb.append("Agencyno: ").append(getAgencyno()).append(", ");
        sb.append("Amt: ").append(getAmt()).append(", ");
        sb.append("Batchcode: ").append(getBatchcode()).append(", ");
        sb.append("BetRequests: ").append(getBetRequests() == null ? "null" : getBetRequests().size()).append(", ");
        sb.append("Bettype: ").append(getBettype()).append(", ");
        sb.append("Blessing: ").append(getBlessing()).append(", ");
        sb.append("Buyuserno: ").append(getBuyuserno()).append(", ");
        sb.append("Cancancel: ").append(getCancancel()).append(", ");
        sb.append("CaseLotRequest: ").append(getCaseLotRequest()).append(", ");
        sb.append("Channel: ").append(getChannel()).append(", ");
        sb.append("Deduct: ").append(getDeduct()).append(", ");
        sb.append("Desc: ").append(getDesc()).append(", ");
        sb.append("Drawway: ").append(getDrawway()).append(", ");
        sb.append("Endsms: ").append(getEndsms()).append(", ");
        sb.append("Leijiprizeendamt: ").append(getLeijiprizeendamt()).append(", ");
        sb.append("Lotmulti: ").append(getLotmulti()).append(", ");
        sb.append("Lotno: ").append(getLotno()).append(", ");
        sb.append("LotsType: ").append(getLotsType()).append(", ");
        sb.append("Memo: ").append(getMemo()).append(", ");
        sb.append("Oneamount: ").append(getOneamount()).append(", ");
        sb.append("Paytype: ").append(getPaytype()).append(", ");
        sb.append("Prizeend: ").append(getPrizeend()).append(", ");
        sb.append("Prizeendamt: ").append(getPrizeendamt()).append(", ");
        sb.append("Subaccount: ").append(getSubaccount()).append(", ");
        sb.append("Subchannel: ").append(getSubchannel()).append(", ");
        sb.append("SubscribeRequests: ").append(getSubscribeRequests() == null ? "null" : getSubscribeRequests().size()).append(", ");
        sb.append("Userno: ").append(getUserno());
        return sb.toString();
    }
    
}
