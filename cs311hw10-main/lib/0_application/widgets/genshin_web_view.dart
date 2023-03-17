import 'package:cs311hw10/1_domain/entities/genshin_character_entity.dart';
import 'package:cs311hw10/character_number.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GenshinWebView extends StatelessWidget {
  const GenshinWebView({Key? key, required this.character}) : super(key: key);

  final GenshinCharacterEntity character;

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (int progress) {},
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ))
      ..loadRequest(Uri.parse('https://genshin.hoyoverse.com/en/character/'
          '${character.nation.toLowerCase()}?char=${charId[character.id]}'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Genshin Infomation'),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
