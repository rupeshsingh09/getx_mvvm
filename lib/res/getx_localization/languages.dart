import 'package:get/get_navigation/src/root/internacionalization.dart';
class Languages extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    // jo v text , language se relaed rhega usko esi page p likhnenge but jb v call krna hoga to last m .tr jarur likhenge
    // same chij agr niche hindi langiage m v use krna h to copy paste kr denge us language me.
    'en_US' : {
      'email hint' : 'Email',
      'internet_exception' : "We are unable to show results.\n Please check your data\nconnection.",
      'general_exception' : "We are unable to process your request.\n Please try again",
      'welcome_back' : 'Welcome\nBack',
      'login' : 'Login',
      'password_hint' : 'Password',


    },
    'hi_IN' : {
      'email hint' : 'Email likhe '
    },
  };

}