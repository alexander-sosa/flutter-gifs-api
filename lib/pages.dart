import 'models.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key key, this.gif}) : super(key: key);

  final Gif gif;

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gif Info"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(child: Image.network(widget.gif.url), width: 500, height: 300,),
            SizedBox(height: 30,),
            Text("Producto", style: TextStyle(fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis, maxLines: 1,),
            Text(widget.gif.nombre, style: TextStyle(), overflow: TextOverflow.ellipsis,),
            SizedBox(height: 20,),
            Text("Precio", style: TextStyle(fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis, maxLines: 1,),
            Text(widget.gif.precio.toStringAsFixed(2), style: TextStyle(), overflow: TextOverflow.ellipsis,),
            SizedBox(height: 20,),
            Text("Existencias", style: TextStyle(fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis, maxLines: 1,),
            Text(widget.gif.existencias.toString(), style: TextStyle(), overflow: TextOverflow.ellipsis,),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}

class CompraPage extends StatefulWidget {
  const CompraPage({Key key, this.gif}) : super(key: key);

  final Gif gif;

  @override
  _CompraPageState createState() => _CompraPageState();
}

class _CompraPageState extends State<CompraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gif Compra"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(child: Image.network(widget.gif.url), width: 500, height: 300,),
            SizedBox(height: 30,),
            Text("Producto", style: TextStyle(fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis, maxLines: 1,),
            Text(widget.gif.nombre, style: TextStyle(), overflow: TextOverflow.ellipsis,),
            SizedBox(height: 20,),
            Text("Precio", style: TextStyle(fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis, maxLines: 1,),
            Text(widget.gif.precio.toStringAsFixed(2), style: TextStyle(), overflow: TextOverflow.ellipsis,),
            SizedBox(height: 20,),
            Text("Existencias", style: TextStyle(fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis, maxLines: 1,),
            Text(widget.gif.existencias.toString(), style: TextStyle(), overflow: TextOverflow.ellipsis,),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                print("Comprando...");
              },
              child: Text("Confirmar compra", style: TextStyle(color: Colors.white),)
            )
          ],
        ),
      ),
    );
  }
}

