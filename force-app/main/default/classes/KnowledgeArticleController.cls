public with sharing class KnowledgeArticleController {
    //fetch RecordTypes 
    @AuraEnabled(cacheable=true) 
    public static List<String> KnowledgeRecordTypes(){ 
        List<String> knowledgeRecordTypesValues = new List<String>(); 

        for (RecordType rt : [SELECT Name FROM RecordType WHERE IsActive = true AND SobjectType = 'Knowledge__kav']) { 
            knowledgeRecordTypesValues.add(rt.Name); 
        } 

        System.debug('knowledge object RecordTypes - ' + knowledgeRecordTypesValues); 
        return knowledgeRecordTypesValues; 
    }
    
     
    //fetch available article List based on Input 
    @AuraEnabled(cacheable=true) 
    public static List<Knowledge__kav> KnowledgeArticles(String input, String cat) { 
        List<Knowledge__kav> knowledgeArticlesList = new List<Knowledge__kav>(); 
        
        String key = '%' + input + '%'; 
        String catkey = '%' + cat + '%'; 

        if (input != '' && input != null){ 
            if (cat != null && cat != '' && cat != 'All'){ 
                knowledgeArticlesList = [SELECT Id, Title
                                         FROM Knowledge__kav  
                                         WHERE PublishStatus='Online' AND Language = 'en_US' AND (Title LIKE :key ) AND (RecordType.Name LIKE: catkey) 
                                         LIMIT 10]; 
            }else{ 
            knowledgeArticlesList = [SELECT Id, Title,Ans__c  
                                     FROM Knowledge__kav      
                                     WHERE PublishStatus='Online' AND Language = 'en_US' AND (Title LIKE :key ) 
                                     LIMIT 10];  
            } 
        }
        System.debug('knowledgeArticlesList - ' +knowledgeArticlesList); 
        return knowledgeArticlesList;  
    } 
    
     
    //fetch selected article ans field 
    @AuraEnabled(cacheable=true) 
    public static Map<String, String> fetchAnsFieldValue(String input){ 
    
        Map<String, String> ansAndUrlValues = new Map<String, String>(); 
        Knowledge__kav record = [SELECT Id, Title, Ans__c FROM Knowledge__kav WHERE Title = :input LIMIT 1]; 
    
        if(record != null) { 
            ansAndUrlValues.put('ans', record.Ans__c);  
            ansAndUrlValues.put('recordID', record.Id); 
        } 
        return ansAndUrlValues; 
    } 
    

   
    
    @AuraEnabled(cacheable=true)
        public static Map<ID, String> getAttachmentsByRecordId(String recordId) {
            // Get record file IDs        
            List<ContentDocumentLink> files = [SELECT ContentDocumentId FROM ContentDocumentLink WHERE LinkedEntityId = :recordId];
            List<ID> fileIDs = new List<ID>();
            for (ContentDocumentLink docLink : files) {
                fileIDs.add(docLink.ContentDocumentId);
            }
     
            List<ContentVersion> docs = [SELECT ContentDocumentId, FileExtension, Title 
                FROM ContentVersion WHERE ContentDocumentId IN : fileIDs];
            Map<ID, String> mapIdTitle = new Map<ID, String>();
            for (ContentVersion docLink : docs) {
                mapIdTitle.put(docLink.ContentDocumentId, docLink.Title);
            }
            return mapIdTitle;
        }
      
        
   
}