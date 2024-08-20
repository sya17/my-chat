import 'package:tektok/app/utils/constant/env_constant.dart';

class NetworkSource {
  final Environment environment = Environment.dev;
  Uri baseUri({required String path}) {
    return Uri.parse(
      '${environment.url}/$path',
    );
  }

  Uri whatsappMessageUri({required String number, required String message}) {
    return Uri.parse('https://wa.me/$number?text=$message');
  }
}

NetworkSource source = NetworkSource();
