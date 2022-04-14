import 'package:flutter/material.dart';

class Spaghetti extends StatefulWidget {
  const Spaghetti({Key? key}) : super(key: key);

  @override
  _SpaghettiState createState() => _SpaghettiState();
}

class _SpaghettiState extends State<Spaghetti> {
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
                  "assets/images/foods/spaghetti.jpg",

                  fit: BoxFit.fill,
                ),
              ),
              const Center(
                  child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Spaghetti",
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
              )),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Spaghetti is the quintessential Italian pasta. It is long – like a string (hence the name, as spago means string) – round in cross-section and made from durum wheat semolina. Commercial varieties are generally used, but artisanal versions are easy to find. This is the best known pasta shape in the world, so much so that the name is identical in nearly every language. ",
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
