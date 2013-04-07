// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.actioncenter.domain;

import com.ruyicai.actioncenter.domain.SendMoneyDetails;
import java.lang.String;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Table;
import org.springframework.transaction.annotation.Transactional;

privileged aspect SendMoneyDetails_Roo_Entity {
    
    declare @type: SendMoneyDetails: @Entity;
    
    declare @type: SendMoneyDetails: @Table(name = "SENDMONEYDETAILS");
    
    @PersistenceContext
    transient EntityManager SendMoneyDetails.entityManager;
    
    @Transactional
    public void SendMoneyDetails.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void SendMoneyDetails.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            SendMoneyDetails attached = SendMoneyDetails.findSendMoneyDetails(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void SendMoneyDetails.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void SendMoneyDetails.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public SendMoneyDetails SendMoneyDetails.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        SendMoneyDetails merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager SendMoneyDetails.entityManager() {
        EntityManager em = new SendMoneyDetails().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long SendMoneyDetails.countSendMoneyDetailses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM SendMoneyDetails o", Long.class).getSingleResult();
    }
    
    public static List<SendMoneyDetails> SendMoneyDetails.findAllSendMoneyDetailses() {
        return entityManager().createQuery("SELECT o FROM SendMoneyDetails o", SendMoneyDetails.class).getResultList();
    }
    
    public static SendMoneyDetails SendMoneyDetails.findSendMoneyDetails(String id) {
        if (id == null || id.length() == 0) return null;
        return entityManager().find(SendMoneyDetails.class, id);
    }
    
    public static List<SendMoneyDetails> SendMoneyDetails.findSendMoneyDetailsEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM SendMoneyDetails o", SendMoneyDetails.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
