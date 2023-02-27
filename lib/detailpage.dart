import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
Map data={};
class Detailpage extends StatefulWidget {
  Detailpage(d){
    data=d;
    // print(data);
  }

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          appBar: AppBar(title:Center(child: Text("Detailed Page")),),
          body: Card(
            child: SingleChildScrollView(
              child: Column(

                children: [
                  // Text(snapshot.data!.body)
                  Row(children: [Expanded(child: Container(child:Image.network(data["laptopimg"]),))],),
                  Row(children: [Expanded(child: Container(child: Text(data["laptopName"]),))],),
                  Row(children: [Expanded(child: Container(child: Text(data["laptopgraphics"]),))],)
                ],
              ),
            ),
          )
        )
    );
  }
}
