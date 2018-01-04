public with sharing class RecordTypeController {

    public List<Account> getAccount() {
        List<Account> AccountRecordType = [Select recordtypeID from Account where ID = '001j000000ab7W9'];
        return AccountRecordType;
    }

}