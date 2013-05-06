// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.actioncenter.domain;

import com.ruyicai.actioncenter.domain.FirstChargeUser;
import java.lang.String;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Table;
import org.springframework.transaction.annotation.Transactional;

privileged aspect FirstChargeUser_Roo_Entity {
    
    declare @type: FirstChargeUser: @Entity;
    
    declare @type: FirstChargeUser: @Table(name = "FIRSTCHARGEUSER");
    
    @PersistenceContext
    transient EntityManager FirstChargeUser.entityManager;
    
    @Transactional
    public void FirstChargeUser.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void FirstChargeUser.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            FirstChargeUser attached = FirstChargeUser.findFirstChargeUser(this.userno);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void FirstChargeUser.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void FirstChargeUser.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public FirstChargeUser FirstChargeUser.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        FirstChargeUser merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager FirstChargeUser.entityManager() {
        EntityManager em = new FirstChargeUser().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long FirstChargeUser.countFirstChargeUsers() {
        return entityManager().createQuery("SELECT COUNT(o) FROM FirstChargeUser o", Long.class).getSingleResult();
    }
    
    public static List<FirstChargeUser> FirstChargeUser.findAllFirstChargeUsers() {
        return entityManager().createQuery("SELECT o FROM FirstChargeUser o", FirstChargeUser.class).getResultList();
    }
    
    public static FirstChargeUser FirstChargeUser.findFirstChargeUser(String userno) {
        if (userno == null || userno.length() == 0) return null;
        return entityManager().find(FirstChargeUser.class, userno);
    }
    
    public static List<FirstChargeUser> FirstChargeUser.findFirstChargeUserEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM FirstChargeUser o", FirstChargeUser.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}