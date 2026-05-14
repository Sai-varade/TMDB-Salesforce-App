public with sharing class moviesLength {
    
    @AuraEnabled(cacheable=true)
    public static Integer getLengthOfMovies() {
        return [SELECT COUNT() FROM Movie__c];
    }
}