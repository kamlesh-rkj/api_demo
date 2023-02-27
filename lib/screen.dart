import 'package:api_demo/detailpage.dart';
import 'package:api_demo/insertpage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

var apiurl = "https://6313993da8d3f673ffcdcc2d.mockapi.io/laptop";

class Screen extends StatefulWidget {
  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("API_DEMO"),
        actions: [IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Insertpage();
          },)).then((value){
            if(value){
              setState(() {

              });
            }
          });
        }, icon: Icon(Icons.add))],
      ),
      body: FutureBuilder<List>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                // print(index);

                return Card(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                                child: Image.network(
                                    snapshot.data![index]["laptopimg"])),
                          )),
                          Expanded(
                              child: Card(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Text(
                                    snapshot.data![index]["laptopName"],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        wordSpacing: 1.1),
                                  ),
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                      Card(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return Detailpage(snapshot.data![index]);
                                    },
                                  )).then((value) {
                                    if (value) {
                                      setState(() {});
                                    }
                                  });
                                },
                                child: Text("Detail")),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return Insertpage(index,true,snapshot.data![index]);

                                    },
                                  )).then((value) {
                                    if (value==true) {
                                      setState(() {});
                                    }
                                  });
                                },
                                child: Text("Edit")),
                            TextButton(
                                onPressed: () {
                                  int id= int.parse(snapshot.data![index]["id"]);
                                  http.delete(Uri.parse(apiurl+"/$id")).then((value) =>setState((){}));
                                },
                                child: Text("Delete"))
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            );

          } else {
            // print("object");
            return Center(
                child: Card(
                  child: CircularProgressIndicator(
              color: Colors.blue,
              backgroundColor: Colors.white38,
              semanticsLabel: "please waite",
            ),
                ));
          }
        },
        future: getalldata(),
      ),
    ));
  }
}

Future<List> getalldata() async {
  var data = await http.get(Uri.parse(apiurl));
  // print(data.body.toString());

  return jsonDecode(data.body);
}
