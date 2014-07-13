package org.swinchester.roo.quickstarts.changelog;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.Column;

@RooJavaBean
@RooToString
@RooJpaEntity(table = "CAMEL_LAST_EVENTID")
public class CamelLastEventProcessed {

    /**
     */
    @Column(name = "EVENT_ID")
    private Long eventId;
}
