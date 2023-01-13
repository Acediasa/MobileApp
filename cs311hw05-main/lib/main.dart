import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(
      items: List<String>.generate(150, (i) => 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${i+1}.png'), // generate a list of 150 Pokemon
    ),
  );
}

class MyApp extends StatefulWidget {
  final List<String> items;
  const MyApp({super.key, required this.items});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _count = 0;
  bool _isFavor = true;
  @override
  Widget build(BuildContext context) {
    const title = 'Pokemon List';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          itemCount: widget.items.length ~/ 3, // 3 items per row so we divide the number of items by 3
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(child: Stack( // Stack is for overlaying Favorite icon on top of image
                  children: [
                    Image.network(widget.items[index*3]),
                    const MyStatefulWidget()
                    // const Icon(Icons.favorite_border, size: 50,),
                  ],
                )),
                Expanded(child: Stack(
                  children: [
                    Image.network(widget.items[index*3+1]),
                    const MyStatefulWidget()
                    // FavoriteWidget(
                    //   isFavor: _isFavor,
                    //   count: _count,
                    //   onChanged: _handleFavorChanged,
                    // )
                  ],
                )),
                Expanded(child: Stack(
                  children: [
                    Image.network(widget.items[index*3+2]),
                    const MyStatefulWidget()
                    // FavoriteWidget(
                    //   isFavor: _isFavor,
                    //   count: _count,
                    //   onChanged: _handleFavorChanged,
                    // )
                  ],
                )),
              ],
            );
          },
        ),
      ),
    );
  }

  void _handleFavorChanged(bool newValue){
    setState(() {
      if(_isFavor){
        _count += 1;
        _isFavor = false;
      } else {
        _count -= 1;
        _isFavor = true;
      }
      print(_count);
    });
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _count = 0;
  bool _isFavor = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: _isFavor
            ? const Icon(Icons.favorite_border,size:50)
            : const Icon(Icons.favorite,color: Colors.red,size:50),
          onPressed: () {
            setState(() {
              if(_isFavor){
                _count += 1;
                _isFavor = false;
              } else {
                _count -= 1;
                _isFavor = true;
              }
              print(_count);
            });
          },

        ),
      ],
    );

  }

}

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({
    super.key,
    this.isFavor = false,
    this.count = 0,
    required this.onChanged
  });
  final bool isFavor;
  final ValueChanged<bool> onChanged;
  final int count;

  @override
  Widget build(BuildContext context){
    return IconButton(
        onPressed: _handleTap,
        icon: isFavor
          ? const Icon(Icons.favorite_border,size:50)
          : const Icon(Icons.favorite,color: Colors.red,size:50),);
  }

  void _handleTap(){
    onChanged(!isFavor);
  }
}