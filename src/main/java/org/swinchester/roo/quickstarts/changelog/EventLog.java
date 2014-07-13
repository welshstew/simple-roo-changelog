package org.swinchester.roo.quickstarts.changelog;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.Column;
import javax.validation.constraints.Size;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

@RooJavaBean
@RooToString
@RooJpaEntity(identifierColumn = "RECORD_ID", identifierField = "recordId", table = "EVENTLOG")
public class EventLog {

    /**
     */
    @Column(name = "TABLE_KEY")
    @Size(max = 100)
    private String tableKey;

    /**
     */
    @Column(name = "STATUS")
    @Size(max = 1)
    private String status;

    /**
     */
    @Column(name = "EVENT_TYPE")
    private Integer eventType;

    /**
     */
    @Column(name = "EVENT_TIME")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date eventTime;

    /**
     */
    @Column(name = "PERPETRATOR")
    @Size(max = 40)
    private String perpatrator;

    /**
     */
    @Column(name = "TABLE_NAME")
    @Size(max = 40)
    private String tableName;

    /**
     */
    @Column(name = "COLUMN_NAME")
    @Size(max = 40)
    private String columnName;

    /**
     */
    @Column(name = "OLD_VALUE")
    @Size(max = 255)
    private String oldValue;

    /**
     */
    @Column(name = "NEW_VALUE")
    @Size(max = 255)
    private String newValue;
}
