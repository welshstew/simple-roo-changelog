// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.swinchester.roo.quickstarts.changelog;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;
import org.swinchester.roo.quickstarts.changelog.Person;
import org.swinchester.roo.quickstarts.changelog.PersonRepository;

privileged aspect PersonRepository_Roo_Jpa_Repository {
    
    declare parents: PersonRepository extends JpaSpecificationExecutor<Person>;
    
    declare @type: PersonRepository: @Repository;
    
}
