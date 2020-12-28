/**
* @author Henrique Nitatori - Topi
*/
trigger Account on Account (before insert, before update) {
    new AccountTH().run();
}