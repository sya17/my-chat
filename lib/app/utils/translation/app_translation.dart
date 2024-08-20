import 'package:get/get.dart';
import 'package:tektok/app/utils/translation/languages/languages.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': languages.enUS,
        'id_ID': languages.idID,
      };
}
