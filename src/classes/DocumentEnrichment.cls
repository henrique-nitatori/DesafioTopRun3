/**
* @author Henrique Nitatori - Topi
*/
public class DocumentEnrichment {

    CpfValidator cpfValidator;
    CnpjValidator cnpjValidator;


    public DocumentEnrichment() {
        this.cpfValidator = new CpfValidator();
        this.cnpjValidator = new CnpjValidator();
    }

    public Account fillAccountDocuments(Account account, List<String> documentsEnum) {
        if(documentsEnum.size() == 0) return account;

        for(String document: documentsEnum) {
            switch on document {
                when 'CPF' {
                    Boolean isValidCpf = this.cpfValidator.isDocumentValid(account.Cpf__c);
                    if(isValidCpf == false) {
                        account.addError('Cpf__c', 'Cpf inválido');
                        continue;
                    } 
                    account.Cpf__c = this.cpfValidator.getDocumentFormated(account.Cpf__c);
                }
                when 'CNPJ' {
                    Boolean isValidCnpj = this.cnpjValidator.isDocumentValid(account.Cnpj__c);
                    if(isValidCnpj == false) {
                        account.addError('Cnpj__c', 'Cnpj inválido');
                        continue;
                    } 
                    account.Cnpj__c = this.cnpjValidator.getDocumentFormated(account.Cnpj__c);
                }
            }
        }

        return account;

    }

}