trigger AccountTrigger on Account (after insert) 
{
    //Based on the record type and custom config we need to share specific accounts with the main org.
    if(Trigger.isAfter && Trigger.isInsert)
        AccountTriggerController.forwardAccountsToAnotherSFDCOrg(Trigger.new);
}