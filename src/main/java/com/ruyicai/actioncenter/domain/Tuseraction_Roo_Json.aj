// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.actioncenter.domain;

import com.ruyicai.actioncenter.domain.Tuseraction;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Tuseraction_Roo_Json {
    
    public String Tuseraction.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static Tuseraction Tuseraction.fromJsonToTuseraction(String json) {
        return new JSONDeserializer<Tuseraction>().use(null, Tuseraction.class).deserialize(json);
    }
    
    public static String Tuseraction.toJsonArray(Collection<Tuseraction> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<Tuseraction> Tuseraction.fromJsonArrayToTuseractions(String json) {
        return new JSONDeserializer<List<Tuseraction>>().use(null, ArrayList.class).use("values", Tuseraction.class).deserialize(json);
    }
    
}
