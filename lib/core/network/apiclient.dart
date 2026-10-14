import 'package:dio/dio.dart';

class ApiClient {
  static const realBaseUrl =
      'https://api.openweathermap.org/data/2.5';

  static const mockBaseUrl =
      'ТВОЙ_MOCK_URL';

  static const useMock = bool.fromEnvironment(
    'USE_MOCK',
    defaultValue: false,
  );

  static const apiKey = String.fromEnvironment(
    'OPENWEATHER_API_KEY',
  );

  late final Dio dio;

  ApiClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: useMock ? mockBaseUrl : realBaseUrl,
        queryParameters: {
          'appid': apiKey,
        },
      ),
    );
  }
}