/**
* @author Henrique Nitatori - Topi
*/
public virtual with sharing class AccountTH extends TriggerHandler {

    CepFormatterFacade cepFormatterFacade;

    List<Account> newAccounts;
    Map<Id, Account> oldAccounts;

    public AccountTH() {
        this ( (List<Account>) Trigger.new, (Map<Id, Account>) Trigger.oldMap );
    }

    public AccountTH(List<Account> newAccounts, Map<Id, Account> oldAccounts) {
        this.newAccounts = newAccounts;
        this.oldAccounts = oldAccounts;
        this.cepFormatterFacade = new CepFormatterFacade();
    }

    virtual 
    override 
    public void beforeInsert() {
        newAccounts = new DocumentFacade().populateAccountDocument(newAccounts);
        newAccounts = this.cepFormatterFacade.formatterCep(newAccounts);
        for(Account account : newAccounts) {
            if(account.GeolocationRequested__c == false) {
                System.enqueueJob(new SendAccountAddress(new List<Account>{account}));
            }
        }
        
    }
    
    virtual 
    override 
    public void beforeUpdate() {
        newAccounts = new DocumentFacade().populateAccountDocument(newAccounts);
        newAccounts = this.cepFormatterFacade.formatterCep(newAccounts);
        for(Account account : newAccounts) {
            if(account.GeolocationRequested__c == false) {
                System.enqueueJob(new SendAccountAddress(new List<Account>{account}));
            }
        }
    }


}