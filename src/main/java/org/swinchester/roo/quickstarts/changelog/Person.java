package org.swinchester.roo.quickstarts.changelog;
import org.hibernate.envers.Audited;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaEntity
@Audited
public class Person {

    /**
     */
    private String personIdentifier;

    /**
     */
    private String givenName;

    /**
     */
    private String familyName;

    /**
     */
    private String gender;

    /**
     */
    private String address;

    /**
     */
    private String city;
}
