import 'package:flutter/material.dart';

class Couscous extends StatefulWidget {
  const Couscous({Key? key}) : super(key: key);

  @override
  _CouscousState createState() => _CouscousState();
}

class _CouscousState extends State<Couscous> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(

            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*1,
                height: MediaQuery.of(context).size.height*0.38,
                child: Image.asset(
                  "assets/images/foods/couscous.jpg",

                  fit: BoxFit.fill,
                ),
              ),
              const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                "Couscous",
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
                  )),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Couscous is crushed durum wheat semolina formed into small granules or spheres. It’s commonly served in North African, Moroccan, Tunisian, and Algerian cuisine. The less refined grain is sold in different varieties of couscous with interesting nutritional perks.",
                  style: TextStyle(fontSize: 25),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
