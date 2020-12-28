/**
* @author Henrique Nitatori - Topi
*/
@isTest
public class DocumentFilterTest {
    @isTest
    public static void givenFilterWhenPassTheBillWithCpfFilledThenReturnListOfStringContainedIsDocumentCpf() {
        Account account = AccountFixeFactory.newAccount('Test', '24815162069', '');

        List<String> documents = new DocumentFilter().filter(account);

        System.assertEquals(1, documents.size());
        System.assertEquals('CPF', documents[0]);
    }

    @isTest
    public static void givenFilterWhenPassTheBillWithCnpjFilledThenReturnListOfStringContainedIsDocumentCnpj() {
        Account account = AccountFixeFactory.newAccount('Test', '', '84596380000169');

        List<String> documents = new DocumentFilter().filter(account);

        System.assertEquals(1, documents.size());
        System.assertEquals('CNPJ', documents[0]);
    }

    @isTest
    public static void givenFilterWhenPassTheBillWithCnpjAndCpfFilledThenReturnListOfStringContainedIsDocumentCnpjAndCpf() {
        Account account = AccountFixeFactory.newAccount('Test', '24815162069', '84596380000169');

        List<String> documents = new DocumentFilter().filter(account);

        System.assertEquals(2, documents.size());
        System.assertEquals('CNPJ', documents[0]);
        System.assertEquals('CPF', documents[1]);
    }
}