trigger movieReviewChange on Review__c (after insert, after update ,after delete) {

    movieReviewChangeHandler handler = new movieReviewChangeHandler();
    switch on Trigger.operationType{

        when AFTER_INSERT {
            handler.afterInsert(Trigger.new);
        }
        when AFTER_UPDATE {
            handler.afterUpdate(Trigger.new);
        }

        when AFTER_DELETE {
            handler.afterDelete(Trigger.old);
        }
    }

}

