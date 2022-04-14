import 'package:demo_shop_app/provider/data_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Orders History"),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: Consumer<Model>(builder: (context, value, child) {
            return value.Quant2.isEmpty
                ? const Center(
                    child: Text(
                      "No history available",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25),
                    ),
                  )
                : ListView(children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: value.Quant2.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 10),
                              child: Card(
                                  elevation: 8,
                                  margin: EdgeInsets.zero,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                value.Quant2[index]
                                                    .toString()
                                                    .replaceAll(
                                                        RegExp(r'[^\w\s]+'),
                                                        ''),
                                                
                                                style: const TextStyle(fontSize: 20),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 50,
                                            ),
                                            Text(
                                              "${value.totale_price2[index]}" " DT",
                                              style: const TextStyle(fontSize: 22),
                                            ),

                                            IconButton(
                                                onPressed: () {
                                                  value
                                                      .removeFromHistory(index);
                                                },
                                                icon: const Icon(
                                                    Icons.highlight_remove)),
                                          ]),
                                    ),
                                  )),
                            );
                          }),
                    )
                  ]);
          }),
        ));
  }
}
