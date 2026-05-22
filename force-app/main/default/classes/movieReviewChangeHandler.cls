public with sharing class movieReviewChangeHandler {
    
    public void afterInsert(List<Review__c> newReviews){
        this.task1(newReviews);
    }
    public void afterUpdate(List<Review__c> newReviews){
        this.task1(newReviews);
    }
    public void afterDelete(List<Review__c> oldReviews){
        this.task1(oldReviews);
    }

    public void task1(List<Review__c> newReviews){

        Set<Id> movieIds = new Set<Id>();
        
        for(Review__c rev : newReviews){
            movieIds.add(rev.Movie__c);
        }

        List<Movie__c> moviesToUpdate = new List<Movie__c>();
        for(Id movId : movieIds){
            Movie__c M = new Movie__c();
            M.Id = movId;
            M.Summary_Update__c = true;
            moviesToUpdate.add(M);
        }
        update moviesToUpdate;
    }
}