// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.actioncenter.domain;

import com.ruyicai.actioncenter.domain.Tactivity;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Tactivity_Roo_Json {
    
    public String Tactivity.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static Tactivity Tactivity.fromJsonToTactivity(String json) {
        return new JSONDeserializer<Tactivity>().use(null, Tactivity.class).deserialize(json);
    }
    
    public static String Tactivity.toJsonArray(Collection<Tactivity> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<Tactivity> Tactivity.fromJsonArrayToTactivitys(String json) {
        return new JSONDeserializer<List<Tactivity>>().use(null, ArrayList.class).use("values", Tactivity.class).deserialize(json);
    }
    
}
