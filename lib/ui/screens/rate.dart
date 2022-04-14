import 'package:demo_shop_app/provider/data_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Rate extends StatefulWidget {
  const Rate({Key? key}) : super(key: key);

  @override
  _RateState createState() => _RateState();
}

class _RateState extends State<Rate> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, value, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Rate us"),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                    child: Image.asset(
                  "assets/images/chef.png",
                  height: MediaQuery.of(context).size.height * 0.4,
                )),
                const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    "We hope that you liked our food ! \n please give us a Rate",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      5,
                      (index) => GestureDetector(
                        child: Icon(
                          Icons.star,
                          size: 40,
                          color: value.rating >= index
                              ? Colors.orange
                              : Colors.grey,
                        ),
                        onTap: () => value.rate(index),
                      ),
                    )
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
