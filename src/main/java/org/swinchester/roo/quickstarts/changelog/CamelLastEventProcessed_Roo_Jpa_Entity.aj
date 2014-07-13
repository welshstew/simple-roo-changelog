// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.swinchester.roo.quickstarts.changelog;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Version;
import org.swinchester.roo.quickstarts.changelog.CamelLastEventProcessed;

privileged aspect CamelLastEventProcessed_Roo_Jpa_Entity {
    
    declare @type: CamelLastEventProcessed: @Entity;
    
    declare @type: CamelLastEventProcessed: @Table(name = "CAMEL_LAST_EVENTID");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long CamelLastEventProcessed.id;
    
    @Version
    @Column(name = "version")
    private Integer CamelLastEventProcessed.version;
    
    public Long CamelLastEventProcessed.getId() {
        return this.id;
    }
    
    public void CamelLastEventProcessed.setId(Long id) {
        this.id = id;
    }
    
    public Integer CamelLastEventProcessed.getVersion() {
        return this.version;
    }
    
    public void CamelLastEventProcessed.setVersion(Integer version) {
        this.version = version;
    }
    
}