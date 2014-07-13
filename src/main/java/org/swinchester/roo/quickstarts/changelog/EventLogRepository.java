package org.swinchester.roo.quickstarts.changelog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = EventLog.class)
public interface EventLogRepository extends JpaRepository<EventLog, Long> {
}
