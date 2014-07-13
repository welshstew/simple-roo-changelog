package org.swinchester.roo.quickstarts.changelog;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = EventLog.class)
public interface EventLogRepository {
}
