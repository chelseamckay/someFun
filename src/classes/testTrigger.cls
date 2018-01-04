public class testTrigger{
    @future
    public static void triggerTest(set<Id> triggerNew) {
        Case[] lUpdate = new list<Case>();
        for (Case c: [select Id from Case where Id in :triggerNew]) {
            c.subject = 'Tested';
            lUpdate.add(c);
        }
        database.update(lUpdate, true);
    }
}