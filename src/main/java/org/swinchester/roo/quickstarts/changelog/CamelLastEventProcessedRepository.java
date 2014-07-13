package org.swinchester.roo.quickstarts.changelog;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = CamelLastEventProcessed.class)
public interface CamelLastEventProcessedRepository {
}
