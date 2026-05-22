public class movieSummryController {
    
    @AuraEnabled
    public static String getSummary(Id recordId){

        List<Review__c> reviews = [SELECT Id,Review__c FROM Review__c WHERE Movie__c = :recordId Order by CreatedDate ASC];

        Movie__c movie = [SELECT Name,Rating__c,Summary_Update__c,Summary__c FROM Movie__c Where Id = :recordId LIMIT 1];

        String allReviews = '';

        Decimal Rating = movie.Rating__c != null ? movie.Rating__c : 0;

        for(Review__c rev : reviews){
            if(rev.Review__c != null){
                allReviews += rev.Review__c + ' # ';
            }
        }

        if (movie.Summary_Update__c != true){
            return movie.Summary__c+' Summary is up to date.'; 
        }

        String summary = aiSummaryClass.getMovieSummary(movie.Name, allReviews, Rating);


        movie.Summary__c = summary;
        update movie;

        return summary;
    
    }


}