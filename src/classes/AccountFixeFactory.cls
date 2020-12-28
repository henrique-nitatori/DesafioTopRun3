/**
* @author Henrique Nitatori - Topi
*/
@isTest
public class AccountFixeFactory {

    public static Account newAccount() {
        return newDefaultAccount();
    }

    public static Account newAccount(String name, String cpf, String cnpj) {
        return new Account(
            name = name,
            Cnpj__c	 = cnpj,
            Cpf__c = cpf
        );
    }

    public static Account createAccount() {
        return createAccount(newAccount());
    }

    public static Account createAccount(String name, String cpf, String cnpj) {
        return createAccount(newAccount(name, cpf, cnpj));
    }

    public static Account createAccount(Account account) {
        insert account;
        return account;
    }

    public static Account newDefaultAccount() {
        String payload = '{ "Id": "", "cpf__c": "24815162069", "cnpj__c": "84596380000169", "name": "Teste", "BillingStreet": "Rua Pedro Dias Batista 70", "BillingCity": "Águas de Santa Bárbara", "BillingPostalCode": "18770-970", "BillingState": "SP", "BillingCountry": "Brasil", "ShippingStreet": "Rua Coronel Honório Palma 135", "ShippingCity": "Altinópolis", "ShippingPostalCode": "14350-970", "ShippingState": "SP", "ShippingCountry": "Brasil"  }';
        return (Account) JSON.deserialize(payload, Account.class);
    }

    public static Map<String, SObject> createIntegratedScenario() {
        Map<String, SObject> records = new Map<String, SObject>();
        Account account =  newAccount();
        records.put('account', account);
        return records;
    }

}