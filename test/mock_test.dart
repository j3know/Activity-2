import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restapi/model/user.dart';
import 'package:restapi/pages/user_list.dart';
import 'package:restapi/pages/user_repository.dart';
import 'package:http/http.dart' as http;

class MockHttpClient extends Mock implements Client {}

void main() {
  late MockHttpClient mockHttpClient;
  late UserRepository userRepository;

  setUp(() {
    mockHttpClient = MockHttpClient();
    userRepository = UserRepository(mockHttpClient);
  });

  group('user-group', () {
    String url = 'https://jsonplaceholder.typicode.com/users';
    test(
        'Given the user repository is instantiated, when fetchUserApi is called and return 200, then return a User object',
        () async {
      when(() => mockHttpClient.get(Uri.parse(url))).thenAnswer(
        (_) => Future.delayed(
          Duration.zero,
          () => Response('''
            [
              {
                  "id": 1,
                  "name": "Leanne Graham",
                  "username": "Bret",
                  "email": "Sincere@april.biz",
                  "address": {
                      "street": "Kulas Light",
                      "suite": "Apt. 556",
                      "city": "Gwenborough",
                      "zipcode": "92998-3874",
                      "geo": {
                          "lat": "-37.3159",
                          "lng": "81.1496"
                      }
                  },
                  "phone": "1-770-736-8031 x56442",
                  "website": "hildegard.org",
                  "company": {
                      "name": "Romaguera-Crona",
                      "catchPhrase": "Multi-layered client-server neural-net",
                      "bs": "harness real-time e-markets"
                  }
              }
            ]
            ''', 200),
        ),
      );

      User user = await userRepository.fetchUserApi();

      expect(user, isA<User>());

      verify(() => mockHttpClient.get(Uri.parse(url))).called(1);
    });

    test(
        'Given the UserRepository is instantiated, when fetchUserApi is called and return 400, then throw an exception',
        () async {
      when(() => mockHttpClient.get(Uri.parse(url))).thenAnswer(
        (_) => Future.delayed(
          Duration.zero,
          () => Response('', 404),
        ),
      );

      expect(() => userRepository.fetchUserApi(), throwsException);
    });
  });
}
