// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.swinchester.roo.quickstarts.changelog.web.converter;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.swinchester.roo.quickstarts.changelog.EventLog;
import org.swinchester.roo.quickstarts.changelog.EventLogRepository;
import org.swinchester.roo.quickstarts.changelog.web.converter.EventLogConverter;

privileged aspect EventLogConverter_Roo_Converter {
    
    declare parents: EventLogConverter implements Converter;
    
    declare @type: EventLogConverter: @FacesConverter("org.swinchester.roo.quickstarts.changelog.web.converter.EventLogConverter");
    
    @Autowired
    EventLogRepository EventLogConverter.eventLogRepository;
    
    public Object EventLogConverter.getAsObject(FacesContext context, UIComponent component, String value) {
        if (value == null || value.length() == 0) {
            return null;
        }
        Long id = Long.parseLong(value);
        return eventLogRepository.findOne(id);
    }
    
    public String EventLogConverter.getAsString(FacesContext context, UIComponent component, Object value) {
        return value instanceof EventLog ? ((EventLog) value).getRecordId().toString() : "";
    }
    
}
