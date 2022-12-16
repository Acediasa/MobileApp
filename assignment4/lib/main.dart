import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

Widget locationSection = Container(
  padding: const EdgeInsets.only(top: 15,left:10),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Text',
        style: TextStyle(
          color: Colors.grey[500],
        ),
      ),
      const SizedBox(height: 5,),
      const Text(
        'Location Name',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(
            size: 20,
            Icons.star,
            color: Colors.grey,
          ),
          Icon(
            size: 20,
            Icons.star,
            color: Colors.grey,
          ),
          Icon(
            size: 20,
            Icons.star,
            color: Colors.grey,
          ),
          Icon(
            size: 20,
            Icons.star,
            color: Colors.grey,
          ),
          Icon(
            size: 20,
            Icons.star,
            color: Colors.grey,
          ),
        ],
      ),
      const Text(
        'Detail',
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey,
        ),
      ),
    ],
  ),
);

Widget reviewSection = Container(
  padding: const EdgeInsets.all(10),
  child: Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: const Text(
              'Score',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: const Text(
              'Number of Review',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: const Text(
              'Review',
              style: TextStyle(
                fontSize: 18,
                color: Colors.indigo,
              ),
            ),
          ),
        ],
      ),
    ],
  ),
);

Widget amenitySection = Container(
  padding: const EdgeInsets.all(10),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.only(bottom: 8),
        child: const Text(
          'Amenity',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      const SizedBox(height: 10),
      Column(
        children: [
          Row(
            children: const [
              Icon(Icons.wifi,color: Colors.white,),
              SizedBox(width: 10),
              Text('Text',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 150),
              Icon(Icons.pool,color: Colors.white,),
              SizedBox(width: 10),
              Text('Text',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Icon(Icons.ac_unit,color: Colors.white,),
              SizedBox(width: 10),
              Text('Text',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 150),
              Icon(Icons.directions_car_filled,color: Colors.white,),
              SizedBox(width: 10),
              Text('Text',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Icon(Icons.fitness_center,color: Colors.white,),
              SizedBox(width: 10),
              Text('Text',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 150),
              Icon(Icons.thermostat,color: Colors.white,),
              SizedBox(width: 10),
              Text('Text',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      )
    ],
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recommend',
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: const SizedBox(
          height:50,
          width:double.infinity,
          child:FloatingActionButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0))
            ),
            onPressed: null,
            backgroundColor: Colors.blue,
            child: Text('Select a room',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: const IconButton(onPressed: null,icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
          title: const Center(child:Text('Province',),),
          backgroundColor: Colors.black54,
          actions: const [
            IconButton(onPressed: null, icon: Icon(Icons.ios_share,color: Colors.white,),),
            IconButton(onPressed: null, icon: Icon(Icons.favorite_border,color: Colors.white,),),
          ],
        ),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/SV.png'),
              const SizedBox(height: 10),
              locationSection,
              const SizedBox(height: 30),
              reviewSection,
              const SizedBox(height: 10),
              amenitySection,
              const SizedBox(height: 20),
              const Text('Location',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Image.asset('assets/images/Paldea.jpg'),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
