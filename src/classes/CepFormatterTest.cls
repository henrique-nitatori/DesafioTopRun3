/**
* @author Henrique Nitatori - Topi
*/
@isTest
public class CepFormatterTest {
    @isTest
    public static void givenFormatWhenPassCepNotFormatedThenReturnCepFormated() {
        String cepFormated = new CepFormatter().format('16310970');

        System.assertEquals('16310-970',cepFormated);
    }
}