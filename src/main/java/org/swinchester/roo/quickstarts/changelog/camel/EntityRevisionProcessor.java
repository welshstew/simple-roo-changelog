package org.swinchester.roo.quickstarts.changelog.camel;

import org.apache.camel.Exchange;
import org.apache.camel.Processor;
import org.apache.commons.beanutils.PropertyUtilsBean;
import org.hibernate.envers.AuditReader;
import org.hibernate.envers.AuditReaderFactory;
import org.hibernate.envers.query.AuditEntity;
import org.hibernate.envers.query.AuditQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.LinkedCaseInsensitiveMap;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import java.util.List;

/**
 * EntityRevisionProcessor populates the properties:
 * 1.  currentEntityRevision
 * 2.  previousEntityRevision [may be null]
 * on the exchange.properties for further processing downstream
 */
public class EntityRevisionProcessor implements Processor {

    @Autowired
    protected EntityManagerFactory entityManagerFactory;

    protected EntityManager em;

    protected PropertyUtilsBean propertyUtilsBean;

    @Override
    public void process(Exchange exchange) throws Exception {

        if(em == null){
            em = entityManagerFactory.createEntityManager();
        }

        AuditReader reader = AuditReaderFactory.get(em);
        LinkedCaseInsensitiveMap myMap = (LinkedCaseInsensitiveMap) exchange.getIn().getBody();

        //entity refers to the entity type
        String entity = (String) myMap.get("entityname");
        //rev refers to the revision number, which will be in the audit table against that entity
        String revision = myMap.get("rev").toString();
        Long rev = Long.parseLong(revision);

        //add these to the exchange properties for convenience
        exchange.setProperty("entityname", entity);
        exchange.setProperty("revision", rev);

        //now find the revision of this entity
        AuditQuery aqCurrent = reader.createQuery().forRevisionsOfEntity(Class.forName(entity), false, true);
        aqCurrent.add(AuditEntity.revisionNumber().eq(rev.intValue()));

        //we should just be able to get a single result from this...
        Object currentObjectRevision = aqCurrent.getSingleResult();
        if(currentObjectRevision != null & currentObjectRevision.getClass().isArray()){
            Object[] objArray = (Object[]) currentObjectRevision;
            exchange.setProperty("currentEntityRevision", objArray[0]);
            exchange.setProperty("currentEntityRevisionType", objArray[2]);
        }


        if(propertyUtilsBean == null){
            propertyUtilsBean = new PropertyUtilsBean();
        }

        //use propertyUtils to grab the entityId
        Number entityId = (Number) propertyUtilsBean.getProperty(exchange.getProperty("currentEntityRevision"), "id");

        //this query gets all revisions of this entity type
        AuditQuery allRevisionsOfThisEntity = reader.createQuery().forRevisionsOfEntity(exchange.getProperty("currentEntityRevision").getClass(), false, true).setMaxResults(1);
        //limit by the id
        allRevisionsOfThisEntity.add(AuditEntity.id().eq(entityId));
        //limit by the previous revision numbers
        allRevisionsOfThisEntity.add(AuditEntity.revisionNumber().lt(rev.intValue()));
        allRevisionsOfThisEntity.addOrder(AuditEntity.revisionNumber().desc());

        List previousVersionList = allRevisionsOfThisEntity.getResultList();
        if(!previousVersionList.isEmpty()){
            if(previousVersionList.get(0).getClass().isArray()){
                Object[] previousVersionArray = (Object[]) previousVersionList.get(0);
                exchange.setProperty("previousEntityRevision", previousVersionArray[0]);
                exchange.setProperty("previousEntityRevisionType", previousVersionArray[2]);
            }
        }else{
            exchange.setProperty("previousEntityRevision", null);
        }
    }
}
