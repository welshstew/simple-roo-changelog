package org.swinchester.roo.quickstarts.changelog.camel;

/**
 * Created by swinchester on 13/07/2014.
 */
public class EntityMetaData {

    private String entityName;
    private String entityTableName;
    private String entityTableKeyColumn;
    private String entityTableKeyPrefix;

    public String getEntityName() {
        return entityName;
    }

    public void setEntityName(String entityName) {
        this.entityName = entityName;
    }

    public String getEntityTableName() {
        return entityTableName;
    }

    public void setEntityTableName(String entityTableName) {
        this.entityTableName = entityTableName;
    }

    public String getEntityTableKeyColumn() {
        return entityTableKeyColumn;
    }

    public void setEntityTableKeyColumn(String entityTableKeyColumn) {
        this.entityTableKeyColumn = entityTableKeyColumn;
    }

    public String getEntityTableKeyPrefix() {
        return entityTableKeyPrefix;
    }

    public void setEntityTableKeyPrefix(String entityTableKeyPrefix) {
        this.entityTableKeyPrefix = entityTableKeyPrefix;
    }
}
