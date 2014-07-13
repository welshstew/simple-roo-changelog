package org.swinchester.roo.quickstarts.changelog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = CamelLastEventProcessed.class)
public interface CamelLastEventProcessedRepository extends JpaRepository<CamelLastEventProcessed, Long> {
}
