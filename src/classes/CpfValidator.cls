/**
* @author Henrique Nitatori - Topi
*/
public class CpfValidator implements IDocumentValidate {

    Util util;

    public CpfValidator() {
        this.util = new Util();
    }
    

    public Boolean isDocumentValid(String document) {
        document = this.util.removeSpecialCharacters(document);
        if( String.isEmpty(document) || document.length() < 9 ) return false;
        
        Integer resultMultyTheFirstNineDigits = multipyTheFirstDigits(document, new List<Integer>{10,9,8,7,6,5,4,3,2});
        Integer resultMultyTheFirstTenDigits = multipyTheFirstDigits(document, new List<Integer>{11,10,9,8,7,6,5,4,3,2});
        Boolean penultimateDigitIsValid = validateTheRestOfTheDivision(resultMultyTheFirstNineDigits, document, 9);
        Boolean ultimateDigitIsValid = validateTheRestOfTheDivision(resultMultyTheFirstTenDigits, document, 10);
        Boolean cpfIsWithRepeatedNumbers = cpfWithRepeatedNumbers(document);

        if(!penultimateDigitIsValid || !ultimateDigitIsValid || cpfIsWithRepeatedNumbers) return false;

        return true;

    }
    public String getDocumentFormated(String document) {
        document = this.util.removeSpecialCharacters(document);
        
        String documentFormated = document.substring(0,3)+ '.' +document.substring(3,6)+ '.' +document.substring(6,9)+ '-' 
            +document.substring(9,11);

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

        Integer restOfTheDivision =  Math.mod( sumOfDocumentNumber, 11 );

        if( restOfTheDivision < 2 ) {
            restOfTheDivision = 0;
        } else {
            restOfTheDivision = 11 - restOfTheDivision;
        }

        if( restOfTheDivision != numbersOfDocuments.get( digitPosition ) ) return false;

        return true;
    }

    @TestVisible
    private Boolean cpfWithRepeatedNumbers(String document) {
        List<Integer> numbersOfDocuments = transformerStringToListInteger(document);

        Integer accumulator = 0;

        for(Integer numberDocument : numbersOfDocuments) {
            if(numbersOfDocuments.get(0) == numberDocument) {
                accumulator += 1;
            }
        }

        if(accumulator != numbersOfDocuments.size()) return false;

        return true;
    }
}