// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.swinchester.roo.quickstarts.changelog;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;
import org.swinchester.roo.quickstarts.changelog.CamelLastEventProcessed;
import org.swinchester.roo.quickstarts.changelog.CamelLastEventProcessedRepository;

privileged aspect CamelLastEventProcessedRepository_Roo_Jpa_Repository {
    
    declare parents: CamelLastEventProcessedRepository extends JpaRepository<CamelLastEventProcessed, Long>;
    
    declare parents: CamelLastEventProcessedRepository extends JpaSpecificationExecutor<CamelLastEventProcessed>;
    
    declare @type: CamelLastEventProcessedRepository: @Repository;
    
}