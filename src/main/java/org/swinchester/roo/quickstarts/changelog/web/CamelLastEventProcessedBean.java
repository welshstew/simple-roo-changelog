package org.swinchester.roo.quickstarts.changelog.web;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.swinchester.roo.quickstarts.changelog.CamelLastEventProcessed;

@RooSerializable
@RooJsfManagedBean(entity = CamelLastEventProcessed.class, beanName = "camelLastEventProcessedBean")
public class CamelLastEventProcessedBean {
}
