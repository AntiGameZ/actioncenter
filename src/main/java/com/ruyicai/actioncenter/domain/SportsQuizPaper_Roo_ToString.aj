// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.actioncenter.domain;

import java.lang.String;

privileged aspect SportsQuizPaper_Roo_ToString {
    
    public String SportsQuizPaper.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Answerid: ").append(getAnswerid()).append(", ");
        sb.append("Createtime: ").append(getCreatetime()).append(", ");
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Mobileid: ").append(getMobileid()).append(", ");
        sb.append("State: ").append(getState());
        return sb.toString();
    }
    
}