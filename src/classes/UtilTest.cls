/**
* @author Henrique Nitatori - Topi
*/
@isTest
public class UtilTest {
    @isTest
    public static void givenRemoveSpecialCharactersWhenPassStringContainsSpecialCharactersThenReturnStringClear() {
        Util util = new Util();

        String cpf = '951.192.440-09';
        String cpnj = '90.284.120/0001-50';
        String cep = '83513-260';
        cpf = util.removeSpecialCharacters(cpf);
        cpnj = util.removeSpecialCharacters(cpnj);
        cep = util.removeSpecialCharacters(cep);

        System.assertEquals('95119244009', cpf);
        System.assertEquals('90284120000150', cpnj);
        System.assertEquals('83513260', cep);
    }
}