package org.swinchester.roo.quickstarts.changelog.web;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.swinchester.roo.quickstarts.changelog.EventLog;

@RooSerializable
@RooJsfManagedBean(entity = EventLog.class, beanName = "eventLogBean")
public class EventLogBean {
}
