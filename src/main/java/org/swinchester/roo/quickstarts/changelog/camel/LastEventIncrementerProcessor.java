package org.swinchester.roo.quickstarts.changelog.camel;

import org.apache.camel.Exchange;
import org.apache.camel.Processor;
import org.springframework.beans.factory.annotation.Autowired;
import org.swinchester.roo.quickstarts.changelog.CamelLastEventProcessed;
import org.swinchester.roo.quickstarts.changelog.CamelLastEventProcessedRepository;

/**
 * Created by swinchester on 17/02/2014.
 */
public class LastEventIncrementerProcessor implements Processor {

    @Autowired
    protected CamelLastEventProcessedRepository camelLastEventProcessedRepository;

    @Override
    public void process(Exchange exchange) throws Exception {

        Long rev = (Long) exchange.getProperty("revision");

        //at the end, update the camel last event id
        CamelLastEventProcessed clep = camelLastEventProcessedRepository.findOne(Long.valueOf(1));
        clep.setEventId(Long.valueOf(rev));
        camelLastEventProcessedRepository.save(clep);

    }
}
