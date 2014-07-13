simple-roo-changelogger
=======================

Please see [blogpost](http://disintegratedmusings.wordpress.com/2014/07/13/building-a-simple-entity-driven-eventlog-mechanism-using-spring-roo-spring-data-spring-data-envers-and-apache-camel/)

I work in integration and it is rarity to have access to the source systems from where events are driven from.  I have spent a number of years working in identity management with custom systems, these span a number of different interfaces.  Testing each one of these interfaces is difficult, and the nature of integration is that each of these interfaces may change over time.

I wanted to create a test harness whereby I could store a number of entities, thus faking the source systems from which we integrate with.  Some systems I work with operate on a "latest snapshot" data model, whereby the full object is sent via XML.  Some systems I work with may create an initial full "add event" and then trickle through modifies on an as-reqiured basis.

Enter: Spring Roo, Spring Data, Spring Data Envers (https://github.com/spring-projects/spring-data-envers), Hibernate Envers, and (my favourite) Apache Camel.  Using the RAD approach of Spring Roo (using spring data) we can construct a GUI and entities very quickly.  Spring Data Envers allows us to Audit those entities and compare the revisions of those entities to produce trickle changelog events.  Camel will provide us with the glue for integrating ALL THE THINGS.

In this example I have used a table called EVENTLOG which is similar to tables encoutered in my workplace.  However, at the point of camel polling the envers tables past the EntityRevisionProcessor you can figure out how or what you want to do with those entities.


1.  Start off with a simple roo script - a single entity and our changelog table mechanism.  See the roo-script.txt.

2.  Add the envers and camel dependencies - pom.xml

3.  Change the Entity Repositories to extend the envers and jparepositories repo:

4.  Add the @Audited annotation to your entities

5.  Ensure the factory-class is changed to EnversRevisionRepositoryFactoryBean.

6.  Implement the Camel SQL listener to listen to the envers tables - see EventlogProcessor as current.

Quickstart
----------

1.  Download the [source code from GitHub](https://github.com/welshstew/simple-roo-changelog).
    
2.  Ensure you have [Spring Roo installed](http://projects.spring.io/spring-roo/) if you want to run through the process yourself.
    
3.  Download and mvn:install the [spring-data-envers](https://github.com/spring-projects/spring-data-envers).

4.  Create a local mysql database with the schema name of “changelog”.
    
5.  Fire up the application with mvn jetty:run and point your browser to [http://localhost:8080/changelog/](http://localhost:8080/changelog/).
