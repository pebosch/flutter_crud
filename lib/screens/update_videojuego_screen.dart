import 'package:flutter/material.dart';
import 'package:flutter_crud/services/firebase_service.dart';

class UpdateVideojuegoScreen extends StatefulWidget {
  const UpdateVideojuegoScreen({super.key});

  @override
  State<UpdateVideojuegoScreen> createState() => _UpdateVideojuegoScreenState();
}

class _UpdateVideojuegoScreenState extends State<UpdateVideojuegoScreen> {

  TextEditingController videojuegoController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {

    final Map argumentos = ModalRoute.of(context)!.settings.arguments as Map;
    videojuegoController.text = argumentos['nombre'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Update videojuego'),
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
                print(argumentos["uid"]);
                await updateVideojuego(argumentos['uid'], videojuegoController.text).then((value){
                  Navigator.pop(context);
                });
              }, 
              child: Text('Actualizar')
            )
          ],
        ),
      ),
    );
  }
}