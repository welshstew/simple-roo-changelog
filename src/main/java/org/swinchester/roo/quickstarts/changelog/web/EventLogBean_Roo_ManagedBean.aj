// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.swinchester.roo.quickstarts.changelog.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.html.HtmlOutputText;
import javax.faces.component.html.HtmlPanelGrid;
import javax.faces.context.FacesContext;
import javax.faces.convert.DateTimeConverter;
import javax.faces.validator.LengthValidator;
import org.primefaces.component.calendar.Calendar;
import org.primefaces.component.inputtext.InputText;
import org.primefaces.component.inputtextarea.InputTextarea;
import org.primefaces.component.message.Message;
import org.primefaces.component.outputlabel.OutputLabel;
import org.primefaces.component.spinner.Spinner;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.swinchester.roo.quickstarts.changelog.EventLog;
import org.swinchester.roo.quickstarts.changelog.EventLogRepository;
import org.swinchester.roo.quickstarts.changelog.web.EventLogBean;
import org.swinchester.roo.quickstarts.changelog.web.util.MessageFactory;

privileged aspect EventLogBean_Roo_ManagedBean {
    
    declare @type: EventLogBean: @ManagedBean(name = "eventLogBean");
    
    declare @type: EventLogBean: @SessionScoped;
    
    @Autowired
    EventLogRepository EventLogBean.eventLogRepository;
    
    private String EventLogBean.name = "EventLogs";
    
    private EventLog EventLogBean.eventLog;
    
    private List<EventLog> EventLogBean.allEventLogs;
    
    private boolean EventLogBean.dataVisible = false;
    
    private List<String> EventLogBean.columns;
    
    private HtmlPanelGrid EventLogBean.createPanelGrid;
    
    private HtmlPanelGrid EventLogBean.editPanelGrid;
    
    private HtmlPanelGrid EventLogBean.viewPanelGrid;
    
    private boolean EventLogBean.createDialogVisible = false;
    
    @PostConstruct
    public void EventLogBean.init() {
        columns = new ArrayList<String>();
        columns.add("tableKey");
        columns.add("status");
        columns.add("eventType");
        columns.add("eventTime");
        columns.add("perpatrator");
    }
    
    public String EventLogBean.getName() {
        return name;
    }
    
    public List<String> EventLogBean.getColumns() {
        return columns;
    }
    
    public List<EventLog> EventLogBean.getAllEventLogs() {
        return allEventLogs;
    }
    
    public void EventLogBean.setAllEventLogs(List<EventLog> allEventLogs) {
        this.allEventLogs = allEventLogs;
    }
    
    public String EventLogBean.findAllEventLogs() {
        allEventLogs = eventLogRepository.findAll();
        dataVisible = !allEventLogs.isEmpty();
        return null;
    }
    
    public boolean EventLogBean.isDataVisible() {
        return dataVisible;
    }
    
    public void EventLogBean.setDataVisible(boolean dataVisible) {
        this.dataVisible = dataVisible;
    }
    
    public HtmlPanelGrid EventLogBean.getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }
    
    public void EventLogBean.setCreatePanelGrid(HtmlPanelGrid createPanelGrid) {
        this.createPanelGrid = createPanelGrid;
    }
    
    public HtmlPanelGrid EventLogBean.getEditPanelGrid() {
        if (editPanelGrid == null) {
            editPanelGrid = populateEditPanel();
        }
        return editPanelGrid;
    }
    
    public void EventLogBean.setEditPanelGrid(HtmlPanelGrid editPanelGrid) {
        this.editPanelGrid = editPanelGrid;
    }
    
    public HtmlPanelGrid EventLogBean.getViewPanelGrid() {
        return populateViewPanel();
    }
    
    public void EventLogBean.setViewPanelGrid(HtmlPanelGrid viewPanelGrid) {
        this.viewPanelGrid = viewPanelGrid;
    }
    
    public HtmlPanelGrid EventLogBean.populateCreatePanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel tableKeyCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        tableKeyCreateOutput.setFor("tableKeyCreateInput");
        tableKeyCreateOutput.setId("tableKeyCreateOutput");
        tableKeyCreateOutput.setValue("Table Key:");
        htmlPanelGrid.getChildren().add(tableKeyCreateOutput);
        
        InputTextarea tableKeyCreateInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        tableKeyCreateInput.setId("tableKeyCreateInput");
        tableKeyCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventLogBean.eventLog.tableKey}", String.class));
        LengthValidator tableKeyCreateInputValidator = new LengthValidator();
        tableKeyCreateInputValidator.setMaximum(100);
        tableKeyCreateInput.addValidator(tableKeyCreateInputValidator);
        tableKeyCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(tableKeyCreateInput);
        
        Message tableKeyCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        tableKeyCreateInputMessage.setId("tableKeyCreateInputMessage");
        tableKeyCreateInputMessage.setFor("tableKeyCreateInput");
        tableKeyCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(tableKeyCreateInputMessage);
        
        OutputLabel statusCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        statusCreateOutput.setFor("statusCreateInput");
        statusCreateOutput.setId("statusCreateOutput");
        statusCreateOutput.setValue("Status:");
        htmlPanelGrid.getChildren().add(statusCreateOutput);
        
        InputText statusCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        statusCreateInput.setId("statusCreateInput");
        statusCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventLogBean.eventLog.status}", String.class));
        LengthValidator statusCreateInputValidator = new LengthValidator();
        statusCreateInputValidator.setMaximum(1);
        statusCreateInput.addValidator(statusCreateInputValidator);
        statusCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(statusCreateInput);
        
        Message statusCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        statusCreateInputMessage.setId("statusCreateInputMessage");
        statusCreateInputMessage.setFor("statusCreateInput");
        statusCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(statusCreateInputMessage);
        
        OutputLabel eventTypeCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        eventTypeCreateOutput.setFor("eventTypeCreateInput");
        eventTypeCreateOutput.setId("eventTypeCreateOutput");
        eventTypeCreateOutput.setValue("Event Type:");
        htmlPanelGrid.getChildren().add(eventTypeCreateOutput);
        
        Spinner eventTypeCreateInput = (Spinner) application.createComponent(Spinner.COMPONENT_TYPE);
        eventTypeCreateInput.setId("eventTypeCreateInput");
        eventTypeCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventLogBean.eventLog.eventType}", Integer.class));
        eventTypeCreateInput.setRequired(false);
        
        htmlPanelGrid.getChildren().add(eventTypeCreateInput);
        
        Message eventTypeCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        eventTypeCreateInputMessage.setId("eventTypeCreateInputMessage");
        eventTypeCreateInputMessage.setFor("eventTypeCreateInput");
        eventTypeCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(eventTypeCreateInputMessage);
        
        OutputLabel eventTimeCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        eventTimeCreateOutput.setFor("eventTimeCreateInput");
        eventTimeCreateOutput.setId("eventTimeCreateOutput");
        eventTimeCreateOutput.setValue("Event Time:");
        htmlPanelGrid.getChildren().add(eventTimeCreateOutput);
        
        Calendar eventTimeCreateInput = (Calendar) application.createComponent(Calendar.COMPONENT_TYPE);
        eventTimeCreateInput.setId("eventTimeCreateInput");
        eventTimeCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventLogBean.eventLog.eventTime}", Date.class));
        eventTimeCreateInput.setNavigator(true);
        eventTimeCreateInput.setEffect("slideDown");
        eventTimeCreateInput.setPattern("dd/MM/yyyy");
        eventTimeCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(eventTimeCreateInput);
        
        Message eventTimeCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        eventTimeCreateInputMessage.setId("eventTimeCreateInputMessage");
        eventTimeCreateInputMessage.setFor("eventTimeCreateInput");
        eventTimeCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(eventTimeCreateInputMessage);
        
        OutputLabel perpatratorCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        perpatratorCreateOutput.setFor("perpatratorCreateInput");
        perpatratorCreateOutput.setId("perpatratorCreateOutput");
        perpatratorCreateOutput.setValue("Perpatrator:");
        htmlPanelGrid.getChildren().add(perpatratorCreateOutput);
        
        InputTextarea perpatratorCreateInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        perpatratorCreateInput.setId("perpatratorCreateInput");
        perpatratorCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventLogBean.eventLog.perpatrator}", String.class));
        LengthValidator perpatratorCreateInputValidator = new LengthValidator();
        perpatratorCreateInputValidator.setMaximum(40);
        perpatratorCreateInput.addValidator(perpatratorCreateInputValidator);
        perpatratorCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(perpatratorCreateInput);
        
        Message perpatratorCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        perpatratorCreateInputMessage.setId("perpatratorCreateInputMessage");
        perpatratorCreateInputMessage.setFor("perpatratorCreateInput");
        perpatratorCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(perpatratorCreateInputMessage);
        
        OutputLabel tableNameCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        tableNameCreateOutput.setFor("tableNameCreateInput");
        tableNameCreateOutput.setId("tableNameCreateOutput");
        tableNameCreateOutput.setValue("Table Name:");
        htmlPanelGrid.getChildren().add(tableNameCreateOutput);
        
        InputTextarea tableNameCreateInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        tableNameCreateInput.setId("tableNameCreateInput");
        tableNameCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventLogBean.eventLog.tableName}", String.class));
        LengthValidator tableNameCreateInputValidator = new LengthValidator();
        tableNameCreateInputValidator.setMaximum(40);
        tableNameCreateInput.addValidator(tableNameCreateInputValidator);
        tableNameCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(tableNameCreateInput);
        
        Message tableNameCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        tableNameCreateInputMessage.setId("tableNameCreateInputMessage");
        tableNameCreateInputMessage.setFor("tableNameCreateInput");
        tableNameCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(tableNameCreateInputMessage);
        
        OutputLabel columnNameCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        columnNameCreateOutput.setFor("columnNameCreateInput");
        columnNameCreateOutput.setId("columnNameCreateOutput");
        columnNameCreateOutput.setValue("Column Name:");
        htmlPanelGrid.getChildren().add(columnNameCreateOutput);
        
        InputTextarea columnNameCreateInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        columnNameCreateInput.setId("columnNameCreateInput");
        columnNameCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventLogBean.eventLog.columnName}", String.class));
        LengthValidator columnNameCreateInputValidator = new LengthValidator();
        columnNameCreateInputValidator.setMaximum(40);
        columnNameCreateInput.addValidator(columnNameCreateInputValidator);
        columnNameCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(columnNameCreateInput);
        
        Message columnNameCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        columnNameCreateInputMessage.setId("columnNameCreateInputMessage");
        columnNameCreateInputMessage.setFor("columnNameCreateInput");
        columnNameCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(columnNameCreateInputMessage);
        
        OutputLabel oldValueCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        oldValueCreateOutput.setFor("oldValueCreateInput");
        oldValueCreateOutput.setId("oldValueCreateOutput");
        oldValueCreateOutput.setValue("Old Value:");
        htmlPanelGrid.getChildren().add(oldValueCreateOutput);
        
        InputTextarea oldValueCreateInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        oldValueCreateInput.setId("oldValueCreateInput");
        oldValueCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventLogBean.eventLog.oldValue}", String.class));
        LengthValidator oldValueCreateInputValidator = new LengthValidator();
        oldValueCreateInputValidator.setMaximum(255);
        oldValueCreateInput.addValidator(oldValueCreateInputValidator);
        oldValueCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(oldValueCreateInput);
        
        Message oldValueCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        oldValueCreateInputMessage.setId("oldValueCreateInputMessage");
        oldValueCreateInputMessage.setFor("oldValueCreateInput");
        oldValueCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(oldValueCreateInputMessage);
        
        OutputLabel newValueCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        newValueCreateOutput.setFor("newValueCreateInput");
        newValueCreateOutput.setId("newValueCreateOutput");
        newValueCreateOutput.setValue("New Value:");
        htmlPanelGrid.getChildren().add(newValueCreateOutput);
        
        InputTextarea newValueCreateInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        newValueCreateInput.setId("newValueCreateInput");
        newValueCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventLogBean.eventLog.newValue}", String.class));
        LengthValidator newValueCreateInputValidator = new LengthValidator();
        newValueCreateInputValidator.setMaximum(255);
        newValueCreateInput.addValidator(newValueCreateInputValidator);
        newValueCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(newValueCreateInput);
        
        Message newValueCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        newValueCreateInputMessage.setId("newValueCreateInputMessage");
        newValueCreateInputMessage.setFor("newValueCreateInput");
        newValueCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(newValueCreateInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid EventLogBean.populateEditPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel tableKeyEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        tableKeyEditOutput.setFor("tableKeyEditInput");
        tableKeyEditOutput.setId("tableKeyEditOutput");
        tableKeyEditOutput.setValue("Table Key:");
        htmlPanelGrid.getChildren().add(tableKeyEditOutput);
        
        InputTextarea tableKeyEditInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        tableKeyEditInput.setId("tableKeyEditInput");
        tableKeyEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventLogBean.eventLog.tableKey}", String.class));
        LengthValidator tableKeyEditInputValidator = new LengthValidator();
        tableKeyEditInputValidator.setMaximum(100);
        tableKeyEditInput.addValidator(tableKeyEditInputValidator);
        tableKeyEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(tableKeyEditInput);
        
        Message tableKeyEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        tableKeyEditInputMessage.setId("tableKeyEditInputMessage");
        tableKeyEditInputMessage.setFor("tableKeyEditInput");
        tableKeyEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(tableKeyEditInputMessage);
        
        OutputLabel statusEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        statusEditOutput.setFor("statusEditInput");
        statusEditOutput.setId("statusEditOutput");
        statusEditOutput.setValue("Status:");
        htmlPanelGrid.getChildren().add(statusEditOutput);
        
        InputText statusEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        statusEditInput.setId("statusEditInput");
        statusEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventLogBean.eventLog.status}", String.class));
        LengthValidator statusEditInputValidator = new LengthValidator();
        statusEditInputValidator.setMaximum(1);
        statusEditInput.addValidator(statusEditInputValidator);
        statusEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(statusEditInput);
        
        Message statusEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        statusEditInputMessage.setId("statusEditInputMessage");
        statusEditInputMessage.setFor("statusEditInput");
        statusEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(statusEditInputMessage);
        
        OutputLabel eventTypeEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        eventTypeEditOutput.setFor("eventTypeEditInput");
        eventTypeEditOutput.setId("eventTypeEditOutput");
        eventTypeEditOutput.setValue("Event Type:");
        htmlPanelGrid.getChildren().add(eventTypeEditOutput);
        
        Spinner eventTypeEditInput = (Spinner) application.createComponent(Spinner.COMPONENT_TYPE);
        eventTypeEditInput.setId("eventTypeEditInput");
        eventTypeEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventLogBean.eventLog.eventType}", Integer.class));
        eventTypeEditInput.setRequired(false);
        
        htmlPanelGrid.getChildren().add(eventTypeEditInput);
        
        Message eventTypeEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        eventTypeEditInputMessage.setId("eventTypeEditInputMessage");
        eventTypeEditInputMessage.setFor("eventTypeEditInput");
        eventTypeEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(eventTypeEditInputMessage);
        
        OutputLabel eventTimeEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        eventTimeEditOutput.setFor("eventTimeEditInput");
        eventTimeEditOutput.setId("eventTimeEditOutput");
        eventTimeEditOutput.setValue("Event Time:");
        htmlPanelGrid.getChildren().add(eventTimeEditOutput);
        
        Calendar eventTimeEditInput = (Calendar) application.createComponent(Calendar.COMPONENT_TYPE);
        eventTimeEditInput.setId("eventTimeEditInput");
        eventTimeEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventLogBean.eventLog.eventTime}", Date.class));
        eventTimeEditInput.setNavigator(true);
        eventTimeEditInput.setEffect("slideDown");
        eventTimeEditInput.setPattern("dd/MM/yyyy");
        eventTimeEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(eventTimeEditInput);
        
        Message eventTimeEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        eventTimeEditInputMessage.setId("eventTimeEditInputMessage");
        eventTimeEditInputMessage.setFor("eventTimeEditInput");
        eventTimeEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(eventTimeEditInputMessage);
        
        OutputLabel perpatratorEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        perpatratorEditOutput.setFor("perpatratorEditInput");
        perpatratorEditOutput.setId("perpatratorEditOutput");
        perpatratorEditOutput.setValue("Perpatrator:");
        htmlPanelGrid.getChildren().add(perpatratorEditOutput);
        
        InputTextarea perpatratorEditInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        perpatratorEditInput.setId("perpatratorEditInput");
        perpatratorEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventLogBean.eventLog.perpatrator}", String.class));
        LengthValidator perpatratorEditInputValidator = new LengthValidator();
        perpatratorEditInputValidator.setMaximum(40);
        perpatratorEditInput.addValidator(perpatratorEditInputValidator);
        perpatratorEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(perpatratorEditInput);
        
        Message perpatratorEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        perpatratorEditInputMessage.setId("perpatratorEditInputMessage");
        perpatratorEditInputMessage.setFor("perpatratorEditInput");
        perpatratorEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(perpatratorEditInputMessage);
        
        OutputLabel tableNameEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        tableNameEditOutput.setFor("tableNameEditInput");
        tableNameEditOutput.setId("tableNameEditOutput");
        tableNameEditOutput.setValue("Table Name:");
        htmlPanelGrid.getChildren().add(tableNameEditOutput);
        
        InputTextarea tableNameEditInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        tableNameEditInput.setId("tableNameEditInput");
        tableNameEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventLogBean.eventLog.tableName}", String.class));
        LengthValidator tableNameEditInputValidator = new LengthValidator();
        tableNameEditInputValidator.setMaximum(40);
        tableNameEditInput.addValidator(tableNameEditInputValidator);
        tableNameEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(tableNameEditInput);
        
        Message tableNameEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        tableNameEditInputMessage.setId("tableNameEditInputMessage");
        tableNameEditInputMessage.setFor("tableNameEditInput");
        tableNameEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(tableNameEditInputMessage);
        
        OutputLabel columnNameEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        columnNameEditOutput.setFor("columnNameEditInput");
        columnNameEditOutput.setId("columnNameEditOutput");
        columnNameEditOutput.setValue("Column Name:");
        htmlPanelGrid.getChildren().add(columnNameEditOutput);
        
        InputTextarea columnNameEditInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        columnNameEditInput.setId("columnNameEditInput");
        columnNameEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventLogBean.eventLog.columnName}", String.class));
        LengthValidator columnNameEditInputValidator = new LengthValidator();
        columnNameEditInputValidator.setMaximum(40);
        columnNameEditInput.addValidator(columnNameEditInputValidator);
        columnNameEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(columnNameEditInput);
        
        Message columnNameEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        columnNameEditInputMessage.setId("columnNameEditInputMessage");
        columnNameEditInputMessage.setFor("columnNameEditInput");
        columnNameEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(columnNameEditInputMessage);
        
        OutputLabel oldValueEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        oldValueEditOutput.setFor("oldValueEditInput");
        oldValueEditOutput.setId("oldValueEditOutput");
        oldValueEditOutput.setValue("Old Value:");
        htmlPanelGrid.getChildren().add(oldValueEditOutput);
        
        InputTextarea oldValueEditInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        oldValueEditInput.setId("oldValueEditInput");
        oldValueEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventLogBean.eventLog.oldValue}", String.class));
        LengthValidator oldValueEditInputValidator = new LengthValidator();
        oldValueEditInputValidator.setMaximum(255);
        oldValueEditInput.addValidator(oldValueEditInputValidator);
        oldValueEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(oldValueEditInput);
        
        Message oldValueEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        oldValueEditInputMessage.setId("oldValueEditInputMessage");
        oldValueEditInputMessage.setFor("oldValueEditInput");
        oldValueEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(oldValueEditInputMessage);
        
        OutputLabel newValueEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        newValueEditOutput.setFor("newValueEditInput");
        newValueEditOutput.setId("newValueEditOutput");
        newValueEditOutput.setValue("New Value:");
        htmlPanelGrid.getChildren().add(newValueEditOutput);
        
        InputTextarea newValueEditInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        newValueEditInput.setId("newValueEditInput");
        newValueEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventLogBean.eventLog.newValue}", String.class));
        LengthValidator newValueEditInputValidator = new LengthValidator();
        newValueEditInputValidator.setMaximum(255);
        newValueEditInput.addValidator(newValueEditInputValidator);
        newValueEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(newValueEditInput);
        
        Message newValueEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        newValueEditInputMessage.setId("newValueEditInputMessage");
        newValueEditInputMessage.setFor("newValueEditInput");
        newValueEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(newValueEditInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid EventLogBean.populateViewPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText tableKeyLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        tableKeyLabel.setId("tableKeyLabel");
        tableKeyLabel.setValue("Table Key:");
        htmlPanelGrid.getChildren().add(tableKeyLabel);
        
        InputTextarea tableKeyValue = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        tableKeyValue.setId("tableKeyValue");
        tableKeyValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventLogBean.eventLog.tableKey}", String.class));
        tableKeyValue.setReadonly(true);
        tableKeyValue.setDisabled(true);
        htmlPanelGrid.getChildren().add(tableKeyValue);
        
        HtmlOutputText statusLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        statusLabel.setId("statusLabel");
        statusLabel.setValue("Status:");
        htmlPanelGrid.getChildren().add(statusLabel);
        
        HtmlOutputText statusValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        statusValue.setId("statusValue");
        statusValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventLogBean.eventLog.status}", String.class));
        htmlPanelGrid.getChildren().add(statusValue);
        
        HtmlOutputText eventTypeLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        eventTypeLabel.setId("eventTypeLabel");
        eventTypeLabel.setValue("Event Type:");
        htmlPanelGrid.getChildren().add(eventTypeLabel);
        
        HtmlOutputText eventTypeValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        eventTypeValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventLogBean.eventLog.eventType}", String.class));
        htmlPanelGrid.getChildren().add(eventTypeValue);
        
        HtmlOutputText eventTimeLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        eventTimeLabel.setId("eventTimeLabel");
        eventTimeLabel.setValue("Event Time:");
        htmlPanelGrid.getChildren().add(eventTimeLabel);
        
        HtmlOutputText eventTimeValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        eventTimeValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventLogBean.eventLog.eventTime}", Date.class));
        DateTimeConverter eventTimeValueConverter = (DateTimeConverter) application.createConverter(DateTimeConverter.CONVERTER_ID);
        eventTimeValueConverter.setPattern("dd/MM/yyyy");
        eventTimeValue.setConverter(eventTimeValueConverter);
        htmlPanelGrid.getChildren().add(eventTimeValue);
        
        HtmlOutputText perpatratorLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        perpatratorLabel.setId("perpatratorLabel");
        perpatratorLabel.setValue("Perpatrator:");
        htmlPanelGrid.getChildren().add(perpatratorLabel);
        
        InputTextarea perpatratorValue = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        perpatratorValue.setId("perpatratorValue");
        perpatratorValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventLogBean.eventLog.perpatrator}", String.class));
        perpatratorValue.setReadonly(true);
        perpatratorValue.setDisabled(true);
        htmlPanelGrid.getChildren().add(perpatratorValue);
        
        HtmlOutputText tableNameLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        tableNameLabel.setId("tableNameLabel");
        tableNameLabel.setValue("Table Name:");
        htmlPanelGrid.getChildren().add(tableNameLabel);
        
        InputTextarea tableNameValue = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        tableNameValue.setId("tableNameValue");
        tableNameValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventLogBean.eventLog.tableName}", String.class));
        tableNameValue.setReadonly(true);
        tableNameValue.setDisabled(true);
        htmlPanelGrid.getChildren().add(tableNameValue);
        
        HtmlOutputText columnNameLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        columnNameLabel.setId("columnNameLabel");
        columnNameLabel.setValue("Column Name:");
        htmlPanelGrid.getChildren().add(columnNameLabel);
        
        InputTextarea columnNameValue = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        columnNameValue.setId("columnNameValue");
        columnNameValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventLogBean.eventLog.columnName}", String.class));
        columnNameValue.setReadonly(true);
        columnNameValue.setDisabled(true);
        htmlPanelGrid.getChildren().add(columnNameValue);
        
        HtmlOutputText oldValueLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        oldValueLabel.setId("oldValueLabel");
        oldValueLabel.setValue("Old Value:");
        htmlPanelGrid.getChildren().add(oldValueLabel);
        
        InputTextarea oldValueValue = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        oldValueValue.setId("oldValueValue");
        oldValueValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventLogBean.eventLog.oldValue}", String.class));
        oldValueValue.setReadonly(true);
        oldValueValue.setDisabled(true);
        htmlPanelGrid.getChildren().add(oldValueValue);
        
        HtmlOutputText newValueLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        newValueLabel.setId("newValueLabel");
        newValueLabel.setValue("New Value:");
        htmlPanelGrid.getChildren().add(newValueLabel);
        
        InputTextarea newValueValue = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        newValueValue.setId("newValueValue");
        newValueValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventLogBean.eventLog.newValue}", String.class));
        newValueValue.setReadonly(true);
        newValueValue.setDisabled(true);
        htmlPanelGrid.getChildren().add(newValueValue);
        
        return htmlPanelGrid;
    }
    
    public EventLog EventLogBean.getEventLog() {
        if (eventLog == null) {
            eventLog = new EventLog();
        }
        return eventLog;
    }
    
    public void EventLogBean.setEventLog(EventLog eventLog) {
        this.eventLog = eventLog;
    }
    
    public String EventLogBean.onEdit() {
        return null;
    }
    
    public boolean EventLogBean.isCreateDialogVisible() {
        return createDialogVisible;
    }
    
    public void EventLogBean.setCreateDialogVisible(boolean createDialogVisible) {
        this.createDialogVisible = createDialogVisible;
    }
    
    public String EventLogBean.displayList() {
        createDialogVisible = false;
        findAllEventLogs();
        return "eventLog";
    }
    
    public String EventLogBean.displayCreateDialog() {
        eventLog = new EventLog();
        createDialogVisible = true;
        return "eventLog";
    }
    
    public String EventLogBean.persist() {
        String message = "";
        if (eventLog.getRecordId() != null) {
            eventLogRepository.save(eventLog);
            message = "message_successfully_updated";
        } else {
            eventLogRepository.save(eventLog);
            message = "message_successfully_created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialogWidget.hide()");
        context.execute("editDialogWidget.hide()");
        
        FacesMessage facesMessage = MessageFactory.getMessage(message, "EventLog");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllEventLogs();
    }
    
    public String EventLogBean.delete() {
        eventLogRepository.delete(eventLog);
        FacesMessage facesMessage = MessageFactory.getMessage("message_successfully_deleted", "EventLog");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllEventLogs();
    }
    
    public void EventLogBean.reset() {
        eventLog = null;
        createDialogVisible = false;
    }
    
    public void EventLogBean.handleDialogClose(CloseEvent event) {
        reset();
    }
    
}
