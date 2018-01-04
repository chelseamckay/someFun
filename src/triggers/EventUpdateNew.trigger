trigger EventUpdateNew on Event (before insert) {

    for(Event e:Trigger.new)
    {
           system.debug('##original WhoId: '+ e.WhoId);
           e.WhoId='003j000000JCTVV';//test contact
           system.debug('##Event WhoId: '+ e.WhoId); 
    }
}