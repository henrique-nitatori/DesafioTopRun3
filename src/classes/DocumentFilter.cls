/**
* @author Henrique Nitatori - Topi
*/
public class DocumentFilter {

    public List<String> filter(Account account) {

        List<String> documents = new List<String>();

        if(!String.isEmpty(account.Cnpj__c)) documents.add(DocumentsEnum.CNPJ.name());
        if(!String.isEmpty(account.Cpf__c)) documents.add(DocumentsEnum.CPF.name());

        return documents;

    }
}