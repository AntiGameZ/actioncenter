// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.actioncenter.domain;

import com.ruyicai.actioncenter.domain.CouponBatchUsageDetailPK;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect CouponBatchUsageDetailPK_Roo_Json {
    
    public String CouponBatchUsageDetailPK.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static CouponBatchUsageDetailPK CouponBatchUsageDetailPK.fromJsonToCouponBatchUsageDetailPK(String json) {
        return new JSONDeserializer<CouponBatchUsageDetailPK>().use(null, CouponBatchUsageDetailPK.class).deserialize(json);
    }
    
    public static String CouponBatchUsageDetailPK.toJsonArray(Collection<CouponBatchUsageDetailPK> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<CouponBatchUsageDetailPK> CouponBatchUsageDetailPK.fromJsonArrayToCouponBatchUsageDetailPKs(String json) {
        return new JSONDeserializer<List<CouponBatchUsageDetailPK>>().use(null, ArrayList.class).use("values", CouponBatchUsageDetailPK.class).deserialize(json);
    }
    
}
