// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.actioncenter.domain;

import com.ruyicai.actioncenter.domain.UserExperienceVoteLog;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect UserExperienceVoteLog_Roo_Json {
    
    public String UserExperienceVoteLog.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static UserExperienceVoteLog UserExperienceVoteLog.fromJsonToUserExperienceVoteLog(String json) {
        return new JSONDeserializer<UserExperienceVoteLog>().use(null, UserExperienceVoteLog.class).deserialize(json);
    }
    
    public static String UserExperienceVoteLog.toJsonArray(Collection<UserExperienceVoteLog> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<UserExperienceVoteLog> UserExperienceVoteLog.fromJsonArrayToUserExperienceVoteLogs(String json) {
        return new JSONDeserializer<List<UserExperienceVoteLog>>().use(null, ArrayList.class).use("values", UserExperienceVoteLog.class).deserialize(json);
    }
    
}
