package org.swinchester.roo.quickstarts.changelog.camel;

import org.apache.camel.Exchange;
import org.apache.camel.Processor;
import org.apache.camel.ProducerTemplate;
import org.apache.commons.beanutils.BeanMap;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.PropertyUtilsBean;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.swinchester.roo.quickstarts.changelog.EventLog;
import org.swinchester.roo.quickstarts.changelog.EventLogRepository;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

/**
 * This will take the currentEntityRevision and the previousEntityRevision
 */
public class EventlogProcessor implements Processor {

    private static int ADD_EVENT_TYPE = 1;
    private static int MODIFY_EVENT_TYPE = 3;

    Logger log = LoggerFactory.getLogger(EventlogProcessor.class);

    @Autowired
    protected EventLogRepository eventLogRepository;

    @Autowired
    protected ProducerTemplate producerTemplate;

    protected HashMap<String, EntityMetaData> entityMetaDataMap;

    public void setEntityMetaDataMap(HashMap<String, EntityMetaData> entityMetaDataMap) {
        this.entityMetaDataMap = entityMetaDataMap;
    }

    @Override
    public void process(Exchange exchange) throws Exception {

        Object previousObjectRevision = null;
        Object currentObjectRevision = null;
        List<EventLog> eventLogs = null;


        previousObjectRevision = exchange.getProperty("previousEntityRevision");
        currentObjectRevision = exchange.getProperty("currentEntityRevision");
        String entity = (String) exchange.getProperty("entityname");


        //we have the entity name, so we need the metadata to populate the eventlog
        String entityShortName = entity.substring(entity.lastIndexOf(".")+1);
        EntityMetaData emd = entityMetaDataMap.get(entityShortName);

        if(emd == null){
            return;
        }

        if(previousObjectRevision == null){
            //this is the only revision - so it's an add - generate add event log
            eventLogs = this.generateAddEventLog(currentObjectRevision, emd.getEntityTableName(), emd.getEntityTableKeyPrefix(), emd.getEntityTableKeyColumn());
        }else{
            //the latest previous version should be at the top of the list.
            eventLogs = this.generateModifyEventLog(previousObjectRevision, currentObjectRevision, emd.getEntityTableName(), emd.getEntityTableKeyPrefix(), emd.getEntityTableKeyColumn());
        }

        eventLogRepository.save(eventLogs);

        producerTemplate.sendBodyAndHeader("seda:eventLogDistributor", eventLogs, "entityName", entityShortName);

    }

    private EventLog generateEventLogData(int eventType){
        EventLog el = new EventLog();
        el.setEventTime(Calendar.getInstance().getTime());
        el.setEventType(eventType);
        el.setPerpatrator("TEST");
        el.setStatus("N");
        return el;
    }

    private List<EventLog> generateAddEventLog(Object newObject, String tableName, String tableKeyPrefix, String tableKeyProperty){
        BeanMap map = new BeanMap(newObject);
        PropertyUtilsBean propUtils = new PropertyUtilsBean();
        String fullTableKeyValue = "";

        EventLog el = generateEventLogData(ADD_EVENT_TYPE);
        List<EventLog> eventLogList = new ArrayList<EventLog>();

        String tableKeyValue = "";

        try {
            tableKeyValue = (String) propUtils.getProperty(newObject, tableKeyProperty);
        } catch (IllegalAccessException e) {
            log.error(e.toString(), e);
        } catch (InvocationTargetException e) {
            log.error(e.toString(), e);
        } catch (NoSuchMethodException e) {
            log.error(e.toString(), e);
        }

        fullTableKeyValue = tableKeyPrefix + tableKeyValue;


        for (Object propNameObject : map.keySet()) {

            try {
                EventLog elRow = (EventLog) BeanUtils.cloneBean(el);
                String propertyName = (String) propNameObject;
                log.debug("trying property : " + propertyName);
                Object property1 = propUtils.getProperty(newObject, propertyName);
                elRow.setTableName(tableName);
                elRow.setTableKey(fullTableKeyValue);
                elRow.setColumnName(propertyName);
                elRow.setOldValue(null);
                elRow.setNewValue((String) property1);
                eventLogList.add(elRow);

            } catch (InvocationTargetException e) {
                log.error(e.toString(), e);
            } catch (NoSuchMethodException e) {
                log.error(e.toString(), e);
            } catch (IllegalAccessException e) {
                log.error(e.toString(), e);
            } catch (InstantiationException e) {
                log.error(e.toString(), e);
            }catch(Exception ex){
                log.debug("IGNORING property");
            }
        }



        return eventLogList;
    }

    public List<EventLog> generateModifyEventLog(Object oldObject, Object newObject, String tableName, String tableKeyPrefix, String tableKeyProperty) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        BeanMap map = new BeanMap(oldObject);
        String fullTableKeyValue = "";

        PropertyUtilsBean propUtils = new PropertyUtilsBean();

        EventLog el = generateEventLogData(MODIFY_EVENT_TYPE);
        List<EventLog> eventLogList = new ArrayList<EventLog>();

        String tableKeyValue = "";

        try {
            tableKeyValue = (String) propUtils.getProperty(newObject, tableKeyProperty);
        } catch (IllegalAccessException e) {
            log.error(e.toString(), e);
        } catch (InvocationTargetException e) {
            log.error(e.toString(), e);
        } catch (NoSuchMethodException e) {
            log.error(e.toString(), e);
        }

        fullTableKeyValue = tableKeyPrefix + tableKeyValue;


        for (Object propNameObject : map.keySet()) {

            try {
                String propertyName = (String) propNameObject;
                Object property1 = propUtils.getProperty(oldObject, propertyName);
                Object property2 = propUtils.getProperty(newObject, propertyName);
                if(!propertyName.equalsIgnoreCase("version")){
                    log.debug("trying property : " + propertyName);
                    if (property1.equals(property2)) {
                        log.debug("  " + propertyName + " is equal");
                    } else {
                        EventLog elRow = (EventLog) BeanUtils.cloneBean(el);
                        elRow.setTableKey(fullTableKeyValue);
                        elRow.setTableName(tableName);
                        elRow.setColumnName(propertyName);
                        elRow.setOldValue((String) property1);
                        elRow.setNewValue((String) property2);

                        log.debug("> " + propertyName + " is different (oldValue=\"" + property1 + "\", newValue=\"" + property2 + "\")");
                        eventLogList.add(elRow);
                    }
                }

            } catch (InstantiationException e) {
                log.error(e.toString(), e);
            }
        }

        return eventLogList;

    }

}
