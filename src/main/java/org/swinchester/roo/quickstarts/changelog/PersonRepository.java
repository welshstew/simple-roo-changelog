package org.swinchester.roo.quickstarts.changelog;
import org.springframework.data.envers.repository.support.EnversRevisionRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Person.class)
public interface PersonRepository extends EnversRevisionRepository<Person, Long, Integer>, JpaRepository<Person, Long> {
}
