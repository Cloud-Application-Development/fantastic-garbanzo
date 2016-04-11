//2-2013 LEGACY INTEGRATION
@isTest
class BatchSObjectUpdater_Test
{
    static testMethod void testBatchSObjectUpdater()
    {
        insert new Opportunity_Data_To_Share_With_Main__c();
        
        Test.startTest();
        
        Database.executeBatch(new BatchSObjectUpdater('SELECT Id FROM Opportunity_Data_To_Share_With_Main__c'));
        
        Test.stopTest();
    }
}