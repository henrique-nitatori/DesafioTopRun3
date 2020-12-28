/**
* @author Henrique Nitatori - Topi
*/
public class AccountRepository {

    public List<Account> create(List<Account> accounts) {
        insert accounts;
        return accounts;
    }

    public List<Account> updateAccount(List<Account> accounts) {
        update accounts;
        return accounts;
    }

    public List<Account> findById(List<Account> accounts) {
        return [ SELECT Id, Name, BillingStreet, BillingCity, BillingState, BillingPostalCode, 
        BillingCountry, BillingAddress, ShippingStreet, ShippingCity, ShippingState, 
        ShippingPostalCode, ShippingCountry, ShippingAddress, ShippingLongitude, ShippingLatitude,
        BillingLongitude, BillingLatitude, Cnpj__c, Cpf__c, GeolocationRequested__c, 
        GeolocationErrorMessage__c FROM Account WHERE Id IN :accounts ];
    }

}