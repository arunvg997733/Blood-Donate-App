import 'package:blooddonorapp/presentation/screenadd.dart';
import 'package:blooddonorapp/presentation/screenupdate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final CollectionReference donor = FirebaseFirestore.instance.collection('donor');

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: StreamBuilder(
        stream: donor.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot data = snapshot.data.docs[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        )
                      
                    ]
                  ),
                  child: ListTile(
                    title: Text(data['name']),
                    leading:CircleAvatar(child: Text(data['group']),) ,
                    subtitle: Text(data['mobile'].toString()),
                    trailing: PopupMenuButton(itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: Text('Edit'),
                          onTap: () {
                            print('hai arun');
                            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => UpdateScreen(),));
                          },),
                        PopupMenuItem(child: Text('Delete'),
                        onTap: () {
                            print('hai arun');
                            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => AddScreen(),));
                          },),
                      ];
                    },)
                  ),
                ),
              );
            },);
          }
          return Center(child: Text('No data'));
        },),
      floatingActionButton: FloatingActionButton(
        elevation: 20,
        onPressed: () {
        Navigator.pushNamed(context, '/add');
      },child:Icon(Icons.add),),
    );
  }
}