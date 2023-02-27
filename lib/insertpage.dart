import 'package:api_demo/screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
Map attribute = {"index": int, "iseditemode": bool};
Map? data = {};

class Insertpage extends StatefulWidget {
  Insertpage([index, iseditemode = false, editeingdata]) {
    attribute["index"] = index;
    attribute["iseditemode"] = iseditemode;
    data = editeingdata;
  }

  @override
  State<Insertpage> createState() => _InsertpageState();
}

class _InsertpageState extends State<Insertpage> {
  var laptopNamecontroll = TextEditingController(
      text: attribute["iseditemode"] ? data!["laptopName"] : "");
  var laptopimgcontroll = TextEditingController(
      text: attribute["iseditemode"] ? data!["laptopimg"] : "");
  var laptopramcontroll = TextEditingController(
      text: attribute["iseditemode"] ? data!["laptopram"] : "");
  var laptopprocessercontroll = TextEditingController(
      text: attribute["iseditemode"] ? data!["laptopprocesser"] : "");
  var laptopgraphicscontroll = TextEditingController(
      text: attribute["iseditemode"] ? data!["laptopgraphics"] : "");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                title: Center(
              child:
                  Text(attribute["iseditemode"] ? "Edite Page" : "Insert Page"),
            )),
            body: SingleChildScrollView(
              child: attribute["iseditemode"]
                  ? Column(
                      children: [
                        Card(
                          child: Column(children: [
                            Text("laptopName"),
                            TextField(
                              controller: laptopNamecontroll,
                            )
                          ]),
                        ),
                        Card(
                          child: Column(children: [
                            Text("laptopimg"),
                            TextField(
                              controller: laptopimgcontroll,
                            )
                          ]),
                        ),
                        Card(
                          child: Column(children: [
                            Text("laptopram"),
                            TextField(
                              controller: laptopramcontroll,
                            )
                          ]),
                        ),
                        Card(
                          child: Column(children: [
                            Text("laptopprocesser"),
                            TextField(
                              controller: laptopprocessercontroll,
                            )
                          ]),
                        ),
                        Card(
                          child: Column(children: [
                            Text("laptopgraphics"),
                            TextField(
                              controller: laptopgraphicscontroll,
                            )
                          ]),
                        ),
                        Card(
                          child: TextButton(onPressed: () {
                            data!["laptopName"]=laptopNamecontroll.text;
                            data!["laptopimg"]=laptopimgcontroll.text;
                            data!["laptopram"]=laptopramcontroll.text;
                            data!["laptopprocesser"]=laptopprocessercontroll.text;
                            data!["laptopgraphics"]=laptopgraphicscontroll.text;
                            int id=int.parse(data!["id"]);
                            http.put(Uri.parse(apiurl+"/$id"),body: data).then((value){
                              print(value.body.toString());
                              Navigator.pop(context,true);
                            });


                          }, child: Center(child: Text("Save&Change")))
                        ),
                      ],
                    )
                  : Column(
                      children: [
                  Card(
                    child: Column(children: [
                      Text("Enter laptopName"),
                      TextField(
                        controller: laptopNamecontroll,
                      )
                    ]),
                  ),
                  Card(
                    child: Column(children: [
                      Text("Enter laptopimg"),
                      TextField(
                        controller: laptopimgcontroll,
                      )
                    ]),
                  ),
                  Card(
                    child: Column(children: [
                      Text("Enter laptopram"),
                      TextField(
                        controller: laptopramcontroll,
                      )
                    ]),
                  ),
                  Card(
                    child: Column(children: [
                      Text("Enter laptopprocesser"),
                      TextField(
                        controller: laptopprocessercontroll,
                      )
                    ]),
                  ),
                  Card(
                    child: Column(children: [
                      Text("Enter laptopgraphics"),
                      TextField(
                        controller: laptopgraphicscontroll,
                      )
                    ]),
                  ),
                  Card(
                      child: TextButton(onPressed: () {
                        // data!["laptopName"]=laptopNamecontroll;
                        // data!["laptopimg"]=laptopimgcontroll;
                        // data!["laptopram"]=laptopramcontroll;
                        // data!["laptopprocesser"]=laptopprocessercontroll;
                        // data!["laptopgraphics"]=laptopgraphicscontroll;

                        http.post(Uri.parse(apiurl),body:
                        {"laptopName":laptopNamecontroll.text,
                          "laptopimg":laptopimgcontroll.text,
                          "laptopram":laptopramcontroll.text,
                          "laptopprocesser":laptopprocessercontroll.text,
                          "laptopgraphics":laptopgraphicscontroll.text
                        }).then((value){
                          // print(value.toString());
                          Navigator.pop(context,true);
                        });


                      }, child: Center(child: Text("Submite")))
                  ),
                ],
                    ),
            )));
  }
}
