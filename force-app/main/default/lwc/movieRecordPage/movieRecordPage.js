import { LightningElement,api ,wire } from 'lwc';
import getMovieById from '@salesforce/apex/movieRecord.getMovieById';

export default class MovieRecordPage extends LightningElement {

    @api recordId;
    movie ;
    @wire(getMovieById,{recordId : '$recordId'})wiredmovies({data}){

        if(data){
            this.movie = data;
        }
   

    }

}