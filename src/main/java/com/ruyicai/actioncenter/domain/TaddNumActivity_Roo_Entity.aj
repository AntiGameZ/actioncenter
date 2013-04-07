// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.actioncenter.domain;

import com.ruyicai.actioncenter.domain.TaddNumActivity;
import java.lang.String;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Table;
import org.springframework.transaction.annotation.Transactional;

privileged aspect TaddNumActivity_Roo_Entity {
    
    declare @type: TaddNumActivity: @Entity;
    
    declare @type: TaddNumActivity: @Table(name = "TaddNumActivity");
    
    @PersistenceContext
    transient EntityManager TaddNumActivity.entityManager;
    
    @Transactional
    public void TaddNumActivity.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void TaddNumActivity.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            TaddNumActivity attached = TaddNumActivity.findTaddNumActivity(this.userno);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void TaddNumActivity.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void TaddNumActivity.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public TaddNumActivity TaddNumActivity.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        TaddNumActivity merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager TaddNumActivity.entityManager() {
        EntityManager em = new TaddNumActivity().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long TaddNumActivity.countTaddNumActivitys() {
        return entityManager().createQuery("SELECT COUNT(o) FROM TaddNumActivity o", Long.class).getSingleResult();
    }
    
    public static List<TaddNumActivity> TaddNumActivity.findAllTaddNumActivitys() {
        return entityManager().createQuery("SELECT o FROM TaddNumActivity o", TaddNumActivity.class).getResultList();
    }
    
    public static TaddNumActivity TaddNumActivity.findTaddNumActivity(String userno) {
        if (userno == null || userno.length() == 0) return null;
        return entityManager().find(TaddNumActivity.class, userno);
    }
    
    public static List<TaddNumActivity> TaddNumActivity.findTaddNumActivityEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM TaddNumActivity o", TaddNumActivity.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
