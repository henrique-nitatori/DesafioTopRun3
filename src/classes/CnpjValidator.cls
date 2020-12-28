/**
* @author Henrique Nitatori - Topi
*/
public class CnpjValidator implements IDocumentValidate{

    Util util;

    public CnpjValidator() {
        this.util = new Util();
    }

    public Boolean isDocumentValid(String document) {
        document = this.util.removeSpecialCharacters(document);

        if(String.isEmpty(document) || document.length() < 14) return false;

        Integer resultMultyTheFirstElevenDigits = multipyTheFirstDigits(document, new List<Integer>{5,4,3,2,9,8,7,6,5,4,3,2});
        Integer resultMultyTheFirstTwelvenDigits = multipyTheFirstDigits(document, new List<Integer>{6,5,4,3,2,9,8,7,6,5,4,3,2});
        Boolean penultimateDigitIsValid = validateTheRestOfTheDivision(resultMultyTheFirstElevenDigits, document, 2);
        Boolean ultimateDigitIsValid = validateTheRestOfTheDivision(resultMultyTheFirstTwelvenDigits, document, 1);

        if(!penultimateDigitIsValid || !ultimateDigitIsValid) return false;

        return true;
    }
    public String getDocumentFormated(String document) {
        document = this.util.removeSpecialCharacters(document);

        String documentFormated = document.substring(0,2)+ '.' +document.substring(2,5)+ '.' +document.substring(5,8)+ '/' 
            +document.substring(8,12) + '-' +document.substring(12,14);

        return documentFormated;
    }

    @TestVisible
    private List<Integer> transformerStringToListInteger(String document) {
        List<Integer> documentNumbers = new List<Integer>();

        for(String documentNumber : document.split('')) {
            documentNumbers.add(Integer.valueOf(documentNumber));
        }

        return documentNumbers;
    }

    @TestVisible
    private Integer multipyTheFirstDigits(String document, List<Integer> multipliers) {
        List<Integer> documentNumbers = transformerStringToListInteger(document);
        Integer result = 0;
        for(Integer i = 0; i < multipliers.size(); i++) {
            result += (documentNumbers[i] * multipliers[i]);
        }
        return result;
    }

    @TestVisible
    private Boolean validateTheRestOfTheDivision(Integer sumOfDocumentNumber, String document, Integer digitPosition) {
        List<Integer> numbersOfDocuments = transformerStringToListInteger(document);

        Integer restOfTheDivision =  Math.mod( sumOfDocumentNumber , 11 );

        if( restOfTheDivision < 2 ) {
            restOfTheDivision = 0;
        } else {
            restOfTheDivision = 11 - restOfTheDivision;
        }

        if( restOfTheDivision != numbersOfDocuments.get( (numbersOfDocuments.size() - digitPosition) ) ) return false;

        return true;
    }
}