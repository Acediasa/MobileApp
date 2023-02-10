import 'package:cs311hw08/genshin_characters.dart';
import 'genshin_characters_test.mocks.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([http.Client])
void main() {
  test('return GenshinChars if http call success', () async {
    final client = MockClient();
    when(client.get(Uri.parse('https://api.genshin.dev/characters')))
        .thenAnswer((_) async => http.Response(
            '["albedo","aloy","amber","arataki-itto","ayaka","ayato"]',
            200));

    expect(await fetchCharacters(client), isA<GenshinCharacters>());
  });

  test('throw an exception if http call error from GenshinChars', () async {
    final client = MockClient();
    when(client.get(Uri.parse('https://api.genshin.dev/characters')))
        .thenAnswer((_) async => http.Response('Not Found', 400));

    expect(fetchCharacters(client), throwsException);
  });

  test("return GenshinChar's info if http call success", () async {
    final client = MockClient();
    const name = 'ayato';
    when(client.get(Uri.parse('https://api.genshin.dev/characters/$name')))
      .thenAnswer((_) async => http.Response(
        '{"name":"Ayato","vision":"Hydro","weapon":"Sword","nation":"Inazuma","description":"The young but highly accomplished head of the Yashiro Commisson\'s Kamisato Clan. Cultured and polite, he is a man of many ways and means."}', 
        200));
    
    expect(await fetchCharacterInfo(client, name), isA<CharacterInfo>());
  });
  
  test('throw an exception if http call error from GenshinChar\'s info', () async {
    final client = MockClient();
    const name = 'ayato';
    when(client.get(Uri.parse('https://api.genshin.dev/characters/$name')))
        .thenAnswer((_) async => http.Response('Not Found', 400));

    expect(fetchCharacterInfo(client, name), throwsException);
  });

}
