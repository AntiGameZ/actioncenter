// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.actioncenter.domain;

import com.ruyicai.actioncenter.domain.FundAndJoinAction;
import java.lang.String;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Table;
import org.springframework.transaction.annotation.Transactional;

privileged aspect FundAndJoinAction_Roo_Entity {
    
    declare @type: FundAndJoinAction: @Entity;
    
    declare @type: FundAndJoinAction: @Table(name = "FUNDANDJOINACTION");
    
    @PersistenceContext
    transient EntityManager FundAndJoinAction.entityManager;
    
    @Transactional
    public void FundAndJoinAction.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void FundAndJoinAction.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            FundAndJoinAction attached = FundAndJoinAction.findFundAndJoinAction(this.ttransactionid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void FundAndJoinAction.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void FundAndJoinAction.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public FundAndJoinAction FundAndJoinAction.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        FundAndJoinAction merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager FundAndJoinAction.entityManager() {
        EntityManager em = new FundAndJoinAction().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long FundAndJoinAction.countFundAndJoinActions() {
        return entityManager().createQuery("SELECT COUNT(o) FROM FundAndJoinAction o", Long.class).getSingleResult();
    }
    
    public static List<FundAndJoinAction> FundAndJoinAction.findAllFundAndJoinActions() {
        return entityManager().createQuery("SELECT o FROM FundAndJoinAction o", FundAndJoinAction.class).getResultList();
    }
    
    public static FundAndJoinAction FundAndJoinAction.findFundAndJoinAction(String ttransactionid) {
        if (ttransactionid == null || ttransactionid.length() == 0) return null;
        return entityManager().find(FundAndJoinAction.class, ttransactionid);
    }
    
    public static List<FundAndJoinAction> FundAndJoinAction.findFundAndJoinActionEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM FundAndJoinAction o", FundAndJoinAction.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
