import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getVideojuegos() async{
  List videojuegos = [];
  CollectionReference collectionReferenceVideojuegos = db.collection('videojuegos');

  QuerySnapshot queryVideojuegos = await collectionReferenceVideojuegos.get();

  queryVideojuegos.docs.forEach((documento){
    videojuegos.add(documento.data());
  });

  return videojuegos;
}