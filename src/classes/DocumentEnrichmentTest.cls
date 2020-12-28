/**
* @author Henrique Nitatori - Topi
*/
@isTest
public class DocumentEnrichmentTest {

    @isTest
    public static void givenFillAccountDocumentsWhenInsertAccountFilldedCpfThenAccountCpfFormated() {
        Account account  = new DocumentEnrichment()
            .fillAccountDocuments(AccountFixeFactory.newAccount('Henrique', '24815162069' , ''), new List<String>{'CPF'});
        
        System.assertEquals('248.151.620-69', account.Cpf__c);
    }

    @isTest
    public static void givenFillAccountDocumentsWhenInsertAccountFilldedCnpjThenAccountCnpjFormated() {
        Account account  = new DocumentEnrichment()
            .fillAccountDocuments(AccountFixeFactory.newAccount('Henrique', '' , '84596380000169'), new List<String>{'CNPJ'});
        
        System.assertEquals('84.596.380/0001-69', account.Cnpj__c);
    }

    @isTest
    public static void givenFillAccountDocumentsWhenInsertAccountFilldedCnpjAndCpfThenAccountCnpjAndCpfFormated() {
        Account account  = new DocumentEnrichment()
            .fillAccountDocuments(AccountFixeFactory.newAccount('Henrique', '24815162069' , '84596380000169'), new List<String>{'CNPJ', 'CPF'});
        
        System.assertEquals('84.596.380/0001-69', account.Cnpj__c);
        System.assertEquals('248.151.620-69', account.Cpf__c);

    }
    @isTest
    public static void givenFillAccountDocumentsWhenInsertAccountNotFilldedCnpjAndCpfThenAccount() {
        Account account  = new DocumentEnrichment()
            .fillAccountDocuments(AccountFixeFactory.newAccount('Henrique', '' , ''), new List<String>{});
        
        System.assert(String.isEmpty(account.Cnpj__c));
        System.assert(String.isEmpty(account.Cpf__c));

    }

    @isTest
    public static void givenFillAccountDocumentsWhenInsertAccountCpfInvalidThenExpectedAddError() {
        Account account  = new DocumentEnrichment()
            .fillAccountDocuments(AccountFixeFactory.newAccount('Henrique', '24815162062' , ''), new List<String>{'CPF'});
        
        System.assert(account.hasErrors());
        System.assertEquals(1, account.getErrors().size());
        System.assertEquals('Cpf inválido', account.getErrors()[0].getMessage());
        
    }

    @isTest
    public static void givenFillAccountDocumentsWhenInsertAccountCnpjInvalidThenExpectedAddError() {
        Account account  = new DocumentEnrichment()
            .fillAccountDocuments(AccountFixeFactory.newAccount('Henrique', '' , '84596380000167'), new List<String>{'CNPJ'});
        
        System.assert(account.hasErrors());
        System.assertEquals(1, account.getErrors().size());
        System.assertEquals('Cnpj inválido', account.getErrors()[0].getMessage());

    }
}