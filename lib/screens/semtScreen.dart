import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/services/city_services.dart';

class SemtScreen extends StatefulWidget {
  @override
  _SemtScreen createState() => _SemtScreen();
}

class _SemtScreen extends State<SemtScreen> {
  var dio = Dio();
  var searchItem = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            onChanged: (value) {
              setState(() {
                searchItem = value;
              });
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
              ),
            ),
          ),
        ),
        body: FutureBuilder(
          future: getPostCode(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List postCodeList = snapshot.data as List;
              return ListView.builder(
                itemCount: postCodeList.length,
                itemBuilder: (context, index) {
                  var pCode = postCodeList[index];
                  return pCode.ilce.contains(searchItem)
                      ? ListTile(
                          title: Text(pCode.ilce),
                          subtitle: Text(pCode.pk.toString()),
                          trailing: Text(pCode.semtBucakBelde),
                        )
                      : Container();
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
