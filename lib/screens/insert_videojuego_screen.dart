import 'package:flutter/material.dart';
import 'package:flutter_crud/services/firebase_service.dart';

class InsertVideojuegoScreen extends StatefulWidget {
  const InsertVideojuegoScreen({super.key});

  @override
  State<InsertVideojuegoScreen> createState() => _InsertVideojuegoScreenState();
}

class _InsertVideojuegoScreenState extends State<InsertVideojuegoScreen> {

  TextEditingController videojuegoController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert videojuego'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: videojuegoController,
              decoration: InputDecoration(
                hintText: 'Inserta tu videojuego'
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                //print(videojuegoController.text);
                await insertVideojuego(videojuegoController.text).then((_){
                  Navigator.pop(context);
                }

                );
              }, 
              child: Text('Guardar')
            )
          ],
        ),
      ),
    );
  }
}