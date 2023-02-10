import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:cs311hw08/character_detail.dart';
import 'character_detail_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  testWidgets('Character\'s info  display CircularProgressIndicator', (tester) async {
    final client = http.Client();
    const name = 'ayato';
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CharacterDetail(client: client, name:name)
      )
    ));

    final findCircular = find.byType(CircularProgressIndicator);

    expect(findCircular, findsOneWidget);
  });


  testWidgets('CharacterDetail display detail', (tester) async {
    final client = MockClient();
    const name = 'ayato';
    when(client.get(Uri.parse('https://api.genshin.dev/characters/$name')))
        .thenAnswer((_) async => http.Response(
          '{"name":"ayato","vision":"Hydro","weapon":"Sword","nation":"Inazuma","description":"The young but highly accomplished head of the Yashiro Commisson\'s Kamisato Clan. Cultured and polite, he is a man of many ways and means."}', 
          200));

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CharacterDetail(client: client, name: name)
      )
    ));
    
    await tester.pumpAndSettle();

    final findName = find.textContaining("ayato");
    final findVision = find.textContaining("Hydro");
    final findWeapon = find.textContaining("Sword");
    final findNation = find.textContaining("Inazuma");
    final findDescription = find.textContaining("The young but highly accomplished head of the Yashiro Commisson\'s Kamisato Clan. Cultured and polite, he is a man of many ways and means.");

    expect(findName, findsOneWidget);
    expect(findVision, findsOneWidget);
    expect(findWeapon, findsOneWidget);
    expect(findNation, findsOneWidget);
    expect(findDescription, findsOneWidget);
  });

  testWidgets('CharacterDetail display error', (tester) async {
    final client = MockClient();
    const name = 'ayato';
    when(client.get(Uri.parse('https://api.genshin.dev/characters/$name')))
        .thenAnswer((_) async => http.Response(
          'Not Found', 400));

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CharacterDetail(client: client, name: name)
      )
    ));
    
    await tester.pumpAndSettle();

    expect(tester.takeException(), isInstanceOf<void>());
  });
}