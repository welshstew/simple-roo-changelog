package org.swinchester.roo.quickstarts.changelog.web;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.swinchester.roo.quickstarts.changelog.Person;

@RooSerializable
@RooJsfManagedBean(entity = Person.class, beanName = "personBean")
public class PersonBean {
}
