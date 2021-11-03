import 'package:flutter/material.dart';
import 'package:groom/main.dart';

class Bookmark extends StatefulWidget {
  List<int> right;

  Bookmark({required this.right});

  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  void initState() {
    // TODO: implement initState
    print(widget.right);
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        title: Text("Right Bookmark"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blue[50],
        child: ListView.builder(
          itemCount: widget.right.length,
          itemBuilder: (ctx, i) => GestureDetector(
            // onTap: () => Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (ctx) => BooksDetails(
            //       index: i,
            //       selected: true,
            //     ),
            //   ),
            // ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(height: 70,width: 70,child: ClipOval(child: data[widget.right[i]]["image"]),),


                    SizedBox(
                      width: 3,
                    ),

                    // ClipRRect(
                    //      borderRadius: BorderRadius.circular(100),
                    //      child: data[l[i]]["image"]
                    //    ),

                    SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        data[widget.right[i]]["text"],
                        FlatButton(
                          color: Colors.teal[800],
                          onPressed: () async {
// l.remove("Aditi Deshmukh");
                            widget.right.remove(widget.right[i]);
                            print(widget.right);
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Bookmark(right : right),
                              ),
                            );

                          },
                          child: Text(
                            "REMOVE",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),

                  ],

                ),
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ) ,
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 25),
                margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10,
                  bottom: 2,
                ) ,

              ),
            ),
          ),
          scrollDirection: Axis.vertical,
        ),
      ),
    );
  }
}
