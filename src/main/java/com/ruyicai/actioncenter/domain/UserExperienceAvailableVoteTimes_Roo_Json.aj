// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.actioncenter.domain;

import com.ruyicai.actioncenter.domain.UserExperienceAvailableVoteTimes;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect UserExperienceAvailableVoteTimes_Roo_Json {
    
    public String UserExperienceAvailableVoteTimes.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static UserExperienceAvailableVoteTimes UserExperienceAvailableVoteTimes.fromJsonToUserExperienceAvailableVoteTimes(String json) {
        return new JSONDeserializer<UserExperienceAvailableVoteTimes>().use(null, UserExperienceAvailableVoteTimes.class).deserialize(json);
    }
    
    public static String UserExperienceAvailableVoteTimes.toJsonArray(Collection<UserExperienceAvailableVoteTimes> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<UserExperienceAvailableVoteTimes> UserExperienceAvailableVoteTimes.fromJsonArrayToUserExperienceAvailableVoteTimeses(String json) {
        return new JSONDeserializer<List<UserExperienceAvailableVoteTimes>>().use(null, ArrayList.class).use("values", UserExperienceAvailableVoteTimes.class).deserialize(json);
    }
    
}
