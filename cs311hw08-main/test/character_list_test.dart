import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:cs311hw08/character_list.dart';
import 'character_list_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  testWidgets('CharacterList display CircularProgressIndicator', (tester) async {
    final client = http.Client();

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CharacterList(client: client)
      )
    ));

    final findCircular = find.byType(CircularProgressIndicator);

    expect(findCircular, findsOneWidget);
  });

  testWidgets('CharacterList display list of characters', (tester) async {
    final client = MockClient();
    when(client.get(Uri.parse('https://api.genshin.dev/characters')))
        .thenAnswer((_) async => http.Response(
            '["albedo","aloy","amber","arataki-itto","ayaka","ayato"]', 200));

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CharacterList(client: client)
      )
    ));

    await tester.pumpAndSettle();

    final findListView = find.byType(ListView);

    expect(findListView, findsOneWidget);
  });

  testWidgets('CharacterList display Error', (tester) async {
    final client = MockClient();
    when(client.get(Uri.parse('https://api.genshin.dev/characters')))
        .thenAnswer((_) async => http.Response(
            'Not Found', 400));

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body:CharacterList(client: client)
      )
    ));

    await tester.pumpAndSettle();

    expect(tester.takeException(), isInstanceOf<void>());
  });
}
