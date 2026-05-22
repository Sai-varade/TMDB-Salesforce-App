public class movieRecord {
    
    @AuraEnabled(cacheable=true)
    public static Movie__c getMovieById(Id recordId) {
        return [SELECT Id, Name, Release_Date__c, Poster__c, Genere__c, Rating__c, Trailer__c FROM Movie__c WHERE Id = :recordId LIMIT 1];      
}
}