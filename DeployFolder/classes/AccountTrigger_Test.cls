@isTest(seealldata=true)
class AccountTrigger_Test
{
    //We test the forwardAccountsToAnotherSFDCOrg method in the AccountTriggerController sdjkfjksdfsd
    static testMethod void testForwardAccountsToAnotherSFDCOrg()  
    {        
        //We get a record type id for us to test with.
        RecordType recordType = [SELECT Id FROM RecordType WHERE SObjectType = 'Account' LIMIT 1];
        
        //We create the main org integration custom settings.
        SFDC_to_SFDC_Legacy_to_Main_Org_Settings__c config = SFDC_to_SFDC_Legacy_to_Main_Org_Settings__c.getOrgDefaults();
        config.Send_Accounts_Enabled__c = true;
        update config;
        
        //We add a record type Id that we would like to be shared with the main org.
        Account_RecordTypeIds_to_send_to_MainOrg__c recordTypeSetting = TestUtils.getTestAccountRecordTypeIdstosendtoMainOrg();
        recordTypeSetting.Name = recordType.Id;
        insert recordTypeSetting;
        
        //We insert the account
        Test.startTest();
        Account account = TestUtils.getTestAccount();
        account.RecordTypeId = recordType.Id;
        insert account; 
        Test.stopTest();             
    }
}
