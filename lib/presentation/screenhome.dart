import 'package:blooddonorapp/function.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final CollectionReference donor = FirebaseFirestore.instance.collection('donor');

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('List of Donors'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: donor.orderBy('name').snapshots(),
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
                    trailing: Wrap(
                      children: [
                        IconButton(onPressed: () {
                          Navigator.of(context).pushNamed('/update',arguments:{
                            'name':data['name'],
                            'mobile':data['mobile'],
                            'group':data['group'],
                            'id':data.id
                          });
                        }, icon: Icon(Icons.edit)),
                        IconButton(onPressed: () {
                          deletedata(data.id);
                        }, icon: Icon(Icons.delete))
                      ],
                    )
                  )
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