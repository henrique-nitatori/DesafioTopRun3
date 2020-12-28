/**
* @author Henrique Nitatori - Topi
*/
public class DocumentFacade {
    DocumentFilter documentFilter;
    DocumentEnrichment documentEnrichment;

    public DocumentFacade() {
        this.documentFilter = new DocumentFilter();
        this.documentEnrichment = new DocumentEnrichment();
    }

    public List<Account> populateAccountDocument(List<Account> accounts) {
        List<Account> accountsDocumentUpdated = new List<Account>();

        for(Account account : accounts) {
            List<String> documents = this.documentFilter.filter(account);
            accountsDocumentUpdated.add( this.documentEnrichment.fillAccountDocuments(account, documents) );
        }

        return accountsDocumentUpdated;
    }
}