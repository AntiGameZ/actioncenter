// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.lottery.domain;

import com.ruyicai.lottery.domain.Tuserachievement;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Tuserachievement_Roo_Json {
    
    public String Tuserachievement.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static Tuserachievement Tuserachievement.fromJsonToTuserachievement(String json) {
        return new JSONDeserializer<Tuserachievement>().use(null, Tuserachievement.class).deserialize(json);
    }
    
    public static String Tuserachievement.toJsonArray(Collection<Tuserachievement> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<Tuserachievement> Tuserachievement.fromJsonArrayToTuserachievements(String json) {
        return new JSONDeserializer<List<Tuserachievement>>().use(null, ArrayList.class).use("values", Tuserachievement.class).deserialize(json);
    }
    
}
