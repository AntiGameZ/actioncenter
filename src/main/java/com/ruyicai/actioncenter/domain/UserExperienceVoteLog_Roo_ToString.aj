// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.actioncenter.domain;

import java.lang.String;

privileged aspect UserExperienceVoteLog_Roo_ToString {
    
    public String UserExperienceVoteLog.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Userno: ").append(getUserno()).append(", ");
        sb.append("Voteruserno: ").append(getVoteruserno()).append(", ");
        sb.append("Votetime: ").append(getVotetime());
        return sb.toString();
    }
    
}
