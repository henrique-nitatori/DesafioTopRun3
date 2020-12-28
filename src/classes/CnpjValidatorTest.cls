/**
* @author Henrique Nitatori - Topi
*/
@isTest
public class CnpjValidatorTest {
    @isTest
    public static void givenTransformerStringToListIntegerWhenInsertDocumentInFormatStringThenReturnListInteger() {
        CnpjValidator cnpj = new CnpjValidator();

        List<Integer> documentNumbers = cnpj.transformerStringToListInteger('11444777000161');

        System.assertEquals(14, documentNumbers.size());
    }

    @isTest
    public static void givenMultipyDigitsWhenEnterToFirstElevenDigitsOfDocumentDAndMultyplyThenCorrectResultOfMultiply() {
        CnpjValidator cnpj = new CnpjValidator();

        Integer documentSumResult = cnpj.multipyTheFirstDigits('11444777000161', new List<Integer>{5,4,3,2,9,8,7,6,5,4,3,2});

        System.assertEquals(214, documentSumResult);
    }

    @isTest
    public static void givenMultipyDigitsWhenEnterToFirstTwelvenDigitsOfDocumentDAndMultyplyThenCorrectResultOfMultiply() {
        CnpjValidator cnpj = new CnpjValidator();

        Integer documentSumResult = cnpj.multipyTheFirstDigits('11444777000161', new List<Integer>{6,5,4,3,2,9,8,7,6,5,4,3,2});

        System.assertEquals(230, documentSumResult);
    }

    @isTest
    public static void givenValidateWhenRestOfTheDivisionWhenInsertOfSumOfDocumentNumberAndDocumentNumbersThenExpectedReturnTrue() {
        CnpjValidator cnpj = new CnpjValidator();

        Boolean documentIsValid = cnpj.validateTheRestOfTheDivision(214 ,'11444777000161', 2);
        
        System.assertEquals(true, documentIsValid);
    }
    @isTest
    public static void givenValidateWhenRestOfTheDivisionWhenInsertOfSumOfDocumentNumberAndDocumentNumbersUltimateNumberThenExpectedReturnTrue() {
        CnpjValidator cnpj = new CnpjValidator();

        Boolean documentIsValid = cnpj.validateTheRestOfTheDivision(230 ,'11444777000161', 1);
        
        System.assertEquals(true, documentIsValid);
    }

    @isTest
    public static void givenValidateWhenRestOfTheDivisionWhenInsertOfSumOfDocumentNumberAndDocumentNumbersUltimateNumberThenExpectedReturnFalse() {
        CnpjValidator cnpj = new CnpjValidator();

        Boolean documentIsValid = cnpj.validateTheRestOfTheDivision(225 ,'11444777000161', 1);
        
        System.assertEquals(false, documentIsValid);
    }

    @isTest
    public static void givenValidateWhenRestOfTheDivisionWhenInsertOfSumOfDocumentNumberAndDocumentNumbersThenExpectedReturnFalse() {
        CnpjValidator cnpj = new CnpjValidator();

        Boolean documentIsValid = cnpj.validateTheRestOfTheDivision(214 ,'11444777000187', 2);
        
        System.assertEquals(false, documentIsValid);
    }
    @isTest
    public static void givenIsDocumentValidWhenPassValidCnpjThenReturnTrue() {
        CnpjValidator cnpj = new CnpjValidator();

        Boolean documentIsValid = cnpj.isDocumentValid('40812784000177');
        
        System.assertEquals(true, documentIsValid);
    }
    @isTest
    public static void givenGetDocumentFormatedWhenPassNotFormatedCnpjThenReturnFormated() {
        CnpjValidator cnpj = new CnpjValidator();

        String documentFormated = cnpj.getDocumentFormated('91039327000122');
        
        System.assertEquals('91.039.327/0001-22', documentFormated);
    }
}