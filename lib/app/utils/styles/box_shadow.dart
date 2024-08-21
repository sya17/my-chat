// ignore_for_file: non_constant_identifier_names, unnecessary_new

part of 'theme_style.dart';

class AppBoxShadow {
  List<BoxShadow> small({required Color color}) {
    return [
      BoxShadow(
        blurRadius: 8,
        color: color,
        offset: const Offset(0, 1),
      ),
      BoxShadow(
        blurRadius: 8,
        color: color,
        offset: const Offset(0, 1),
      ),
    ];
  }

  List<BoxShadow> medium({required Color color}) {
    return [
      BoxShadow(
        blurRadius: 8,
        color: color,
        offset: const Offset(0, 1),
      ),
      BoxShadow(
        blurRadius: 8,
        color: color,
        offset: const Offset(0, 1),
      ),
    ];
  }
}

AppBoxShadow boxShadow = new AppBoxShadow();
