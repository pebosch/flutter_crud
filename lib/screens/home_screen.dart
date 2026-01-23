import 'package:flutter/material.dart';
import 'package:flutter_crud/services/firebase_service.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: FutureBuilder(
        future: getVideojuegos(), 
        builder: ((context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data?[index]['nombre']),
                onTap: () async {
                  await Navigator.pushNamed(context, "update", arguments: {
                    "nombre": snapshot.data?[index]['nombre'],
                    "uid": snapshot.data?[index]['uid'],
                  });
                  setState(() {
                    
                  });
                },
              ); 
            },
          );
          } else { return Center (
              child: CircularProgressIndicator(),
            );
          }
          
        })
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, 'insert');
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}