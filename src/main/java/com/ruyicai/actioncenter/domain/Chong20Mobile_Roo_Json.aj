// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.actioncenter.domain;

import com.ruyicai.actioncenter.domain.Chong20Mobile;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Chong20Mobile_Roo_Json {
    
    public String Chong20Mobile.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static Chong20Mobile Chong20Mobile.fromJsonToChong20Mobile(String json) {
        return new JSONDeserializer<Chong20Mobile>().use(null, Chong20Mobile.class).deserialize(json);
    }
    
    public static String Chong20Mobile.toJsonArray(Collection<Chong20Mobile> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<Chong20Mobile> Chong20Mobile.fromJsonArrayToChong20Mobiles(String json) {
        return new JSONDeserializer<List<Chong20Mobile>>().use(null, ArrayList.class).use("values", Chong20Mobile.class).deserialize(json);
    }
    
}
