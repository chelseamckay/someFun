trigger testCase on Case (after insert) {
    if (label.testCase == 'Y') {

        Case[] lUpdate = new list<Case>();
        for (Case c: [select Id from Case where Id in :trigger.New]) {
            lUpdate.add(c);
        }
        database.update(lUpdate, true);

        // comment above and uncomment below to move DML to future method
        // when in future method, this works
       //testTrigger.triggerTest(trigger.NewMap.keySet());
    }
}