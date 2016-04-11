//2-2013 LEGACY INTEGRATION
global class BatchSObjectUpdater implements Database.Batchable<sObject> 
{
    String query;
    public BatchSObjectUpdater(String query){this.query = query;}
    global Database.QueryLocator start(Database.BatchableContext BC){return Database.getQueryLocator(query);}
    global void execute(Database.BatchableContext BC, List<sObject> scope){update scope;}
    global void finish(Database.BatchableContext BC){}
}