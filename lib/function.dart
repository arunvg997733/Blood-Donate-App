import 'package:cloud_firestore/cloud_firestore.dart';

adddonor(String name,String number,String group){
  final CollectionReference donor = FirebaseFirestore.instance.collection('donor');

  final data = {
    'name':name,
    'mobile':number,
    'group':group
  };
  donor.add(data);

}

updatedonor(id,String name,String number,String group){
  final CollectionReference donor = FirebaseFirestore.instance.collection('donor');

  final data = {
    'name':name,
    'mobile':number,
    'group':group
  };
  donor.doc(id).update(data);

}

deletedata(id){
  final CollectionReference donor = FirebaseFirestore.instance.collection('donor');
  donor.doc(id).delete();
}