import { LightningElement, wire, track } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import getmoviesss from '@salesforce/apex/movieList.getMov';
import getLengthOfMovies from '@salesforce/apex/moviesLength.getLengthOfMovies';

export default class Tmdbhome extends NavigationMixin(LightningElement) {

    maxPageNo = 0;
    PageNo = 1;
    @track movies = [];
    Pagesize = 8;
    previous = "< Previous";
    next = "Next >";
    searchResults = [];
    @wire(getLengthOfMovies)wiredPageLengthb({data}){
    if(data){
        this.maxPageNo = Math.ceil(data / this.Pagesize);
        }
    }
  
    @wire(getmoviesss,{PageNo : '$PageNo',Pagesize : '$Pagesize'})
    wiredMovies({ data}) {

        if(data) {
            this.movies = data;
        } 
    }

    handleclickNext(){
        if(this.PageNo < this.maxPageNo){
        this.PageNo = this.PageNo + 1;
        }
    }

    handleclickPrevious(){
        
        if(this.PageNo > 1){
            this.PageNo = this.PageNo - 1;
        }
        
    }

    movieRecordPage(event){
        const recordId = event.currentTarget.dataset.id;
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: recordId,
                objectApiName: 'Movie__c',
                actionName: 'view'
            }
        });
    }

    Handlechnage(event){
        
    }
}