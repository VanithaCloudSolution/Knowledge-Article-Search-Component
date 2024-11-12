import { LightningElement, track, wire, api } from 'lwc';
import KnowledgeRecordTypes from '@salesforce/apex/KnowledgeArticleController.KnowledgeRecordTypes';
import KnowledgeArticles from '@salesforce/apex/KnowledgeArticleController.KnowledgeArticles';
import fetchAnsFieldValue from '@salesforce/apex/KnowledgeArticleController.fetchAnsFieldValue';
export default class KnowledgeSearchLWC extends LightningElement {
    @track article; 
    @track articleList = []; 
    @track results;
    @track rt = 'All'; 
    @track rtList = []; 
    @api displayCard; 
    @track showModal = false;
    @track selectedArticleTitle;
    @track selectedArticleId;
    @track ansFieldValue;
    @track articleRecordLink; 
    contentdoc = [];
    @api recordId;   
    @wire(KnowledgeRecordTypes)
    wiredRecordTypes({error, data}) {
        if (data) {
            this.rtList = data;
            console.log('KnowledgeRecordTypes data - ', data);
            this.error = undefined;
        }
        if (error) {
            this.error = error;
            console.log('data error', error);
            this.rtList = undefined;
        }
    };
    @wire(KnowledgeArticles, {input : '$article', cat : '$rt'})
    wiredArticles({error, data}) {
        if (data) {
            this.articleList = [];
            for (let article of data) {
                let myArticle = {};
                myArticle.data = article;
                this.articleList.push(myArticle);
            }
            this.error = undefined;
        }
        if (error) {
            this.error = error;
            this.articleList = undefined;
        }
    }
    @wire(fetchAnsFieldValue, { input: '$selectedArticleTitle' })
    wiredAnsValue({ error, data }) {
        if (data) {
            console.log("fetchAnsFieldValue data - " , JSON.stringify(data));

            this.ansFieldValue = data.ans;
            this.recordId = data.recordID;
            console.log("Article Title - ", this.selectedArticleTitle);
            console.log("Article Ans - ",this.ansFieldValue);
            console.log("Article recordId - ",this.recordId);
            
        } else if (error) {
            console.error('Error fetching ans__c or UrlName field value:', error);
        }
    }
   
    handleCible(event) {
        this.rt = event.target.value;
        console.log('handleCible rt - ', this.rt);
    }
    changeHandler(event) {
        this.article = event.target.value;
        console.log('changeHandler article - ', this.article);
    }
 
    handleArticleClick(event) {
        let articleTitle = event.target.innerText;
        this.selectedArticleTitle = articleTitle;
  
    }

    handleModalView(event) {
        this.showModal = true;
    }

    handleCancel(){
        this.showModal = false;
    }



    
}