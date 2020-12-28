/**
* @author Henrique Nitatori - Topi
*/
global class UpdateaccountAddress implements
    Database.Batchable<sObject>, Database.AllowsCallouts, Database.Stateful {

    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id, Name, BillingStreet, BillingCity, BillingState, BillingPostalCode, ' +
            'BillingCountry, BillingAddress, ShippingStreet, ShippingCity, ShippingState, ' +
            'ShippingPostalCode, ShippingCountry, ShippingAddress, ShippingLongitude, ShippingLatitude, ' +
            'BillingLongitude, BillingLatitude, Cnpj__c, Cpf__c, GeolocationRequested__c, ' +
            'GeolocationErrorMessage__c FROM Account WHERE GeolocationRequested__c = true'
        );
    }

    global void execute(Database.BatchableContext bc, List<Account> scope) {
        if(scope.size() > 0) {
            Map<Id,Account> accounts = new GetOutBoundGeolocationAddress().sendAccountAddress((List<Account>) scope);
            List<Account> updateAccounts = new List<Account>();

            for(Account account : (List<Account>) scope) {
                Account accountInList = accounts.get(account.Id);
                System.debug(accountInList);
                account.BillingLatitude = accountInList.BillingLatitude;
                account.BillingLongitude = accountInList.BillingLongitude;
                account.ShippingLatitude = accountInList.ShippingLatitude;
                account.ShippingLongitude = accountInList.ShippingLongitude;
                updateAccounts.add(account);
            }

            update updateAccounts;
        }
    }

    global void finish(Database.BatchableContext bc){

    }
}