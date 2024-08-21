// ignore_for_file: constant_identifier_names, dead_code

enum Lang {
  id_ID,
  en_US,
}

extension LangExt on Lang {
  String get locale {
    switch (this) {
      case Lang.id_ID:
        return "id_ID";
        break;
      case Lang.en_US:
        return "en_US";
        break;
      default:
        return "";
    }
  }

  String get langCode {
    switch (this) {
      case Lang.id_ID:
        return "id";
        break;
      case Lang.en_US:
        return "en";
        break;
      default:
        return "";
    }
  }

  String get countryCode {
    switch (this) {
      case Lang.id_ID:
        return "ID";
        break;
      case Lang.en_US:
        return "US";
        break;
      default:
        return "";
    }
  }
}
