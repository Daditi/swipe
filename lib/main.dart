import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rxdart/rxdart.dart';

import 'LeftBookmark.dart';
import 'RightBookmark.dart';

List<int> left=[];
List<int> right=[];

void main() {
  runApp(MyApp());
}

final List data = [
  {
    "id": 0,
    "image":Image.asset("lib/assets/images/rick.jpeg",height: 300,width: 300,),
    "text":Text("Rick Sanchez",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
    "species": Text("Human",style: TextStyle(fontSize: 17),),
    "status": Text("Alive",style: TextStyle(fontSize: 17),),
    "gender": Text("Male",style: TextStyle(fontSize: 17),)
  },
  {
    "id": 1,
    "image":Image.asset("lib/assets/images/morty.jpeg",height: 300,width: 300,),
    "text":Text("Morty Smith",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
    "species": Text("Human",style: TextStyle(fontSize: 27),),
    "status": Text("Alive",style: TextStyle(fontSize: 17),),
    "gender": Text("Male",style: TextStyle(fontSize: 17),)
  },
  {
    "id": 2,
    "image":Image.asset("lib/assets/images/frank.jpeg",height: 300,width: 300,),
    "text":Text("Frank Palicky",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
    "species": Text("Human",style: TextStyle(fontSize: 17),),
    "status": Text("Dead",style: TextStyle(fontSize: 17),),
    "gender": Text("Male",style: TextStyle(fontSize: 17),)
  },
  {
    "id": 3,
    "image":Image.asset("lib/assets/images/bepsian.jpeg",height: 300,width: 300,),
    "text":Text("Bepisian",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
    "species": Text("Alien",style: TextStyle(fontSize: 17),),
    "status": Text("Alive",style: TextStyle(fontSize: 17),),
    "gender": Text("unknown",style: TextStyle(fontSize: 17),)
  },
  {
    "id": 4,
    "image":Image.asset("lib/assets/images/beth.jpeg",height: 300,width: 300,),
    "text":Text("Beth Smith",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
    "species": Text("Human",style: TextStyle(fontSize: 17),),
    "status": Text("Alive",style: TextStyle(fontSize: 17),),
    "gender": Text("Female",style: TextStyle(fontSize: 17),)
  },
  {
    "id": 5,
    "image":Image.asset("lib/assets/images/thom.jpeg",height: 300,width: 300,),
    "text":Text("Canklanker Thom",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
    "species": Text("Alien",style: TextStyle(fontSize: 17),),
    "status": Text("Dead",style: TextStyle(fontSize: 17),),
    "gender": Text("Male",style: TextStyle(fontSize: 17),)
  },
  {
    "id": 6,
    "image":Image.asset("lib/assets/images/davin.jpeg",height: 300,width: 300,),
    "text":Text("Davin",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
    "species": Text("Human",style: TextStyle(fontSize: 17),),
    "status": Text("Dead",style: TextStyle(fontSize: 17),),
    "gender": Text("Male",style: TextStyle(fontSize: 17),)
  }
];
BehaviorSubject<List<Card>> cards = BehaviorSubject.seeded([
  Card(
      data[0]['id'], data[0]['image'], data[0]['text'],data[0]['species'],data[0]['status'], data[0]['gender']
  ),
  Card(
      data[1]['id'], data[1]['image'],data[1]['text'],data[1]['species'],data[1]['status'], data[1]['gender']
  ),
  Card(
      data[2]['id'], data[2]['image'],data[2]['text'],data[2]['species'],data[2]['status'], data[2]['gender']
  ),
  Card(
      data[3]['id'], data[3]['image'],data[3]['text'],data[3]['species'],data[3]['status'], data[3]['gender']
  ),
  Card(
      data[4]['id'], data[4]['image'],data[4]['text'],data[4]['species'],data[4]['status'], data[4]['gender']
  ),
  Card(
      data[5]['id'], data[5]['image'],data[5]['text'],data[5]['species'],data[5]['status'], data[5]['gender']
  ),
  Card(
      data[6]['id'], data[6]['image'],data[6]['text'],data[6]['species'],data[6]['status'], data[6]['gender']
  ),
]);

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void getHttp() async {
    try {
      var response = await Dio().get('https://rickandmortyapi.com/api/character');
      print(response.data["results"][0]["episode"]);
    } catch (e) {
      print(e);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    getHttp();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
    final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
appBar: AppBar(
  title: Text("Home Screen"),
  centerTitle: true,
  backgroundColor: Colors.teal[800],
  actions: [
    IconButton(onPressed: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LeftBookmark(left: left)),
      );
    },
        icon: Icon(Icons.favorite,color: Colors.black)),
    IconButton(onPressed: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Bookmark(right: right)),
      );
    },
        icon: Icon(Icons.favorite,color: Colors.white))


  ],
),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.8,
          // Important to keep as a stack to have overlay of cards.
          child: StreamBuilder<List<Card>>(
            stream: cards,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return SizedBox();
              final data = snapshot.data;
              return Stack(
                children: data!,
              );
            },
          ),
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {

  final int id;
  final Image image;
  final Text text;
  final Text species;
  final Text status;
  final Text gender;
  Card(this.id,this.image,this.text,this.species,this.status,this.gender);

  @override
  Widget build(BuildContext context) {
    int page= data.length-id;
    return Swipable(
      // Set the swipable widget
      verticalSwipe: false,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.blue[50],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           image,
            SizedBox(height: 10,),
            Row(mainAxisAlignment:MainAxisAlignment.center,children: [Text("~"),text,Text("~")],),
            SizedBox(height: 10,),
            Row(mainAxisAlignment:MainAxisAlignment.center,children: [Text("Species: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),species],),
            SizedBox(height: 10,),
            Row(mainAxisAlignment:MainAxisAlignment.center,children: [Text("Status: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),status],),
            SizedBox(height: 10,),
            Row(mainAxisAlignment:MainAxisAlignment.center,children: [Text("Gender: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),gender],),
            SizedBox(height: 10,),
            Container(padding:EdgeInsets.symmetric(vertical: 1,horizontal: 5),color:Colors.black,child: Text(page.toString(),style: TextStyle(color: Colors.white),)),
          ],
        ),
      ),
      onSwipeRight: (finalPosition) {
        right.add(id.toInt());
       final snackbar= SnackBar(
         duration: Duration( milliseconds: 500),
          content: text,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.teal[800],
          margin: EdgeInsets.all(30.0),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
        print(right);
        print("Swipe Right");
      },
      onSwipeLeft: (finalPosition) {
        left.add(id.toInt());
        final snackbar= SnackBar(
          duration: Duration( milliseconds: 500),
          content: text,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.brown,
          margin: EdgeInsets.all(30.0),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
        print(left);
        print("Swipe Right");
      },
      // onSwipeRight, left, up, down, cancel, etc...
    );
  }
}

