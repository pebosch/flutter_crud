import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getVideojuegos() async{
  List videojuegos = [];
  CollectionReference collectionReferenceVideojuegos = db.collection('videojuegos');

  QuerySnapshot queryVideojuegos = await collectionReferenceVideojuegos.get();

  queryVideojuegos.docs.forEach((documento){
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    final videojuego = {
      "nombre": data['nombre'],
      "uid": documento.id
    };
    videojuegos.add(videojuego);
  });

  return videojuegos;
}

Future<void> insertVideojuego(String videojuego) async {
  await db.collection("videojuegos").add({"nombre": videojuego});
}

Future<void> updateVideojuego( String uid, String nuevoVideojuego ) async {
  await db.collection("videojuegos").doc(uid).set({"nombre": nuevoVideojuego});
}

Future<void> deleteVideojuego( String uid ) async {
  await db.collection("videojuegos").doc(uid).delete();
}