/**
* @author Henrique Nitatori - Topi
*/
@isTest
public class CpfValidatorTest {

    @isTest
    public static void givenTransformerStringToListIntegerWhenEnterDocumentStringThenReturnDocumentNumberInListInteger() {
        CpfValidator cpfValidator = new CpfValidator();

        List<Integer> documentsNumbers = cpfValidator.transformerStringToListInteger('12345');
        
        List<Integer> documentsNumbersExpected = new List<Integer>{1,2,3,4,5};

        System.assertEquals(5, documentsNumbers.size());
        System.assertEquals(documentsNumbersExpected, documentsNumbers);
    }

    @isTest
    public static void givenMultipyDigitsWhenEnterToFirstNineDigitsOfDocumentDAndMultyplyThenCorrectResultOfMultiply() {
        CpfValidator cpfValidator = new CpfValidator();

        Integer resultMultiply = cpfValidator.multipyTheFirstDigits('52998224725', new List<Integer>{10,9,8,7,6,5,4,3,2});
        
        System.assertEquals(295, resultMultiply);
    }

    @isTest
    public static void givenMultipyDigitsWhenEnterToFirstTenDigitsOfDocumentDAndMultyplyThenCorrectResultOfMultiply() {
        CpfValidator cpfValidator = new CpfValidator();

        Integer resultMultiply = cpfValidator.multipyTheFirstDigits('52998224725', new List<Integer>{11,10,9,8,7,6,5,4,3,2});
        
        System.assertEquals(347, resultMultiply);
    }

    @isTest
    public static void givenValidateWhenRestOfTheDivisionWhenInsertOfSumOfDocumentNumberAndDocumentNumbersThenExpectedReturnTrue() {
        CpfValidator cpfValidator = new CpfValidator();

        Boolean documentIsValid = cpfValidator.validateTheRestOfTheDivision(295 ,'52998224725', 9);
        
        System.assertEquals(true, documentIsValid);
    }
    
    @isTest
    public static void givenValidateWhenRestOfTheDivisionWhenInsertOfSumOfDocumentNumberAndDocumentNumbersThenExpectedReturnFalse() {
        CpfValidator cpfValidator = new CpfValidator();

        Boolean documentIsValid = cpfValidator.validateTheRestOfTheDivision(295 ,'52998224775', 9);
        
        System.assertEquals(false, documentIsValid);
    }

    @isTest
    public static void givenValidateWhenRestOfTheDivisionWhenInsertOfSumOfDocumentNumberAndDocumentNumbersThenExpectedReturnTrueOfUltimateDigit() {
        CpfValidator cpfValidator = new CpfValidator();

        Boolean documentIsValid = cpfValidator.validateTheRestOfTheDivision(347 ,'52998224775', 10);
        
        System.assertEquals(true, documentIsValid);
    }

    @isTest
    public static void givenCpfWithRepeatedNumbersWhenCpfLikeAllRepeatedNumbersThenReturnTrue() {
        CpfValidator cpfValidator = new CpfValidator();

        Boolean documentIsValid = cpfValidator.cpfWithRepeatedNumbers('11111111111');
        
        System.assertEquals(true, documentIsValid);
    }

    @isTest
    public static void givenCpfWithRepeatedNumbersWhenCpfNotLikeAllRepeatedNumbersThenReturnFalse() {
        CpfValidator cpfValidator = new CpfValidator();

        Boolean documentIsValid = cpfValidator.cpfWithRepeatedNumbers('52998224775');
        
        System.assertEquals(false, documentIsValid);
    }

    @isTest
    public static void givenIsDocumentValidWhenInsertCpfValidThenReturnTrue() {
        CpfValidator cpfValidator = new CpfValidator();

        Boolean documentIsValid = cpfValidator.isDocumentValid('71264324022');
        
        System.assertEquals(true, documentIsValid);
    }

    @isTest
    public static void givenGetDocumentFormatedWhenInsertCpfNotFormatedThenReturnFormatedCpf() {
        CpfValidator cpfValidator = new CpfValidator();

        String documentFormated = cpfValidator.getDocumentFormated('71264324022');
        
        System.assertEquals('712.643.240-22', documentFormated);
    }

}