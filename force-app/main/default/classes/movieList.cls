public without sharing class movieList {

    @AuraEnabled(cacheable=true)
    public static List<Movie__c> getMov(Integer PageNo,Integer Pagesize) {

        Integer offset = (PageNo - 1) * Pagesize;
        Integer totalRecords = [SELECT COUNT() FROM Movie__c];
        
        return [SELECT Id, Name, Release_Date__c,Poster__c, Genere__c,Rating__c FROM Movie__c LIMIT :Pagesize OFFSET :offset];
    }
}