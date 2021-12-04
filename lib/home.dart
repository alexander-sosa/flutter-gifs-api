import 'dart:convert';

import 'package:apirestfixed/pages.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Gif>> _listaDeGifs;

  Future<List<Gif>> getGifs()async {
    List<Gif> vGif = [];
    final  response = await http.get('https://api.giphy.com/v1/gifs/trending?api_key=YDUk0pm8fjZecvwd4md71qzOJ23ZPtCb&limit=25&rating=g');
    String body = utf8.decode(response.bodyBytes);
    final jsonData = jsonDecode(body);

    print("RESPONSE " + response.body);
    for(var item in jsonData['data']){
      String title = item['title'];
      String url = item['images']['downsized']['url'];
      String height = item['images']['downsized']['height'];
      int existencias = int.parse(height);
      double precio = existencias / 111;
      vGif.add(Gif(title, url, existencias, precio));
    }
    return vGif;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listaDeGifs = getGifs();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Gifs'),),
        body: FutureBuilder(
            future: _listaDeGifs,
            builder: (context, snapshot){
              if(snapshot.hasData){
                return GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 2,
                  children: _listaGifs(snapshot.data, context),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }
        ),
      ),
    );
  }

  List<Widget> _listaGifs(List<Gif> data, BuildContext context){
    List<Widget> widgetsGif = [];
    for(var itemGif in data){
      widgetsGif.add(GestureDetector(
        onTap: (){
          setState(() {
            Route route = MaterialPageRoute(builder: (context) => InfoPage(gif: itemGif,));
            Navigator.of(context).push(route);
          });
        },
        onLongPress: (){
          setState(() {
            Route route = MaterialPageRoute(builder: (context) => CompraPage(gif: itemGif,));
            Navigator.of(context).push(route);
          });
        },
        child: Card(child: Column(
          children: [
            Expanded(child: Image.network(itemGif.url)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(itemGif.nombre),
            )
          ],
        ),),
      ));
    }
    return widgetsGif;
  }
}
