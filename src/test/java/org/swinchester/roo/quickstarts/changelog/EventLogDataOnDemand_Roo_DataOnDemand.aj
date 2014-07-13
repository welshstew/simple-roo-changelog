// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.swinchester.roo.quickstarts.changelog;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.swinchester.roo.quickstarts.changelog.EventLog;
import org.swinchester.roo.quickstarts.changelog.EventLogDataOnDemand;
import org.swinchester.roo.quickstarts.changelog.EventLogRepository;

privileged aspect EventLogDataOnDemand_Roo_DataOnDemand {
    
    declare @type: EventLogDataOnDemand: @Component;
    
    private Random EventLogDataOnDemand.rnd = new SecureRandom();
    
    private List<EventLog> EventLogDataOnDemand.data;
    
    @Autowired
    EventLogRepository EventLogDataOnDemand.eventLogRepository;
    
    public EventLog EventLogDataOnDemand.getNewTransientEventLog(int index) {
        EventLog obj = new EventLog();
        setColumnName(obj, index);
        setEventTime(obj, index);
        setEventType(obj, index);
        setNewValue(obj, index);
        setOldValue(obj, index);
        setPerpatrator(obj, index);
        setStatus(obj, index);
        setTableKey(obj, index);
        setTableName(obj, index);
        return obj;
    }
    
    public void EventLogDataOnDemand.setColumnName(EventLog obj, int index) {
        String columnName = "columnName_" + index;
        if (columnName.length() > 40) {
            columnName = columnName.substring(0, 40);
        }
        obj.setColumnName(columnName);
    }
    
    public void EventLogDataOnDemand.setEventTime(EventLog obj, int index) {
        Date eventTime = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setEventTime(eventTime);
    }
    
    public void EventLogDataOnDemand.setEventType(EventLog obj, int index) {
        Integer eventType = new Integer(index);
        obj.setEventType(eventType);
    }
    
    public void EventLogDataOnDemand.setNewValue(EventLog obj, int index) {
        String newValue = "newValue_" + index;
        if (newValue.length() > 255) {
            newValue = newValue.substring(0, 255);
        }
        obj.setNewValue(newValue);
    }
    
    public void EventLogDataOnDemand.setOldValue(EventLog obj, int index) {
        String oldValue = "oldValue_" + index;
        if (oldValue.length() > 255) {
            oldValue = oldValue.substring(0, 255);
        }
        obj.setOldValue(oldValue);
    }
    
    public void EventLogDataOnDemand.setPerpatrator(EventLog obj, int index) {
        String perpatrator = "perpatrator_" + index;
        if (perpatrator.length() > 40) {
            perpatrator = perpatrator.substring(0, 40);
        }
        obj.setPerpatrator(perpatrator);
    }
    
    public void EventLogDataOnDemand.setStatus(EventLog obj, int index) {
        String status = String.valueOf(index);
        if (status.length() > 1) {
            status = status.substring(0, 1);
        }
        obj.setStatus(status);
    }
    
    public void EventLogDataOnDemand.setTableKey(EventLog obj, int index) {
        String tableKey = "tableKey_" + index;
        if (tableKey.length() > 100) {
            tableKey = tableKey.substring(0, 100);
        }
        obj.setTableKey(tableKey);
    }
    
    public void EventLogDataOnDemand.setTableName(EventLog obj, int index) {
        String tableName = "tableName_" + index;
        if (tableName.length() > 40) {
            tableName = tableName.substring(0, 40);
        }
        obj.setTableName(tableName);
    }
    
    public EventLog EventLogDataOnDemand.getSpecificEventLog(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        EventLog obj = data.get(index);
        Long id = obj.getRecordId();
        return eventLogRepository.findOne(id);
    }
    
    public EventLog EventLogDataOnDemand.getRandomEventLog() {
        init();
        EventLog obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getRecordId();
        return eventLogRepository.findOne(id);
    }
    
    public boolean EventLogDataOnDemand.modifyEventLog(EventLog obj) {
        return false;
    }
    
    public void EventLogDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = eventLogRepository.findAll(new org.springframework.data.domain.PageRequest(from / to, to)).getContent();
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'EventLog' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<EventLog>();
        for (int i = 0; i < 10; i++) {
            EventLog obj = getNewTransientEventLog(i);
            try {
                eventLogRepository.save(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            eventLogRepository.flush();
            data.add(obj);
        }
    }
    
}
