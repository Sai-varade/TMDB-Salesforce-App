import { LightningElement , api,wire} from 'lwc';


import getSummary from '@salesforce/apex/movieSummryController.getSummary';
import {getRecord} from 'lightning/uiRecordApi';

import Summary__c from '@salesforce/schema/Movie__c.Summary__c';

export default class AiSummaryC extends LightningElement {


    @api recordId;

    Summary = 'Loading summary...';

    @wire(getRecord, { recordId: '$recordId', fields: [Summary__c] })
    wiredRecord({ error, data }) {
        if (data) {
            
            this.Summary = data.fields.Summary__c.value;

        } else if (error) {

            this.Summary = 'Failed to load summary wire.';
        }
    }   


    handleRefresh(){

        getSummary({recordId: this.recordId}).then(result => {
            
            this.Summary = result;
        }).catch(error => {
            this.Summary = 'Failed to load summary imperrative. Error: ' + error.body.message;
        });
    
    }
}