// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.actioncenter.domain;

import com.ruyicai.actioncenter.domain.CouponBatchUsageDetail;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect CouponBatchUsageDetail_Roo_Json {
    
    public String CouponBatchUsageDetail.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static CouponBatchUsageDetail CouponBatchUsageDetail.fromJsonToCouponBatchUsageDetail(String json) {
        return new JSONDeserializer<CouponBatchUsageDetail>().use(null, CouponBatchUsageDetail.class).deserialize(json);
    }
    
    public static String CouponBatchUsageDetail.toJsonArray(Collection<CouponBatchUsageDetail> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<CouponBatchUsageDetail> CouponBatchUsageDetail.fromJsonArrayToCouponBatchUsageDetails(String json) {
        return new JSONDeserializer<List<CouponBatchUsageDetail>>().use(null, ArrayList.class).use("values", CouponBatchUsageDetail.class).deserialize(json);
    }
    
}