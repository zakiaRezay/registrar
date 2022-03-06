import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegisteredPatient extends StatefulWidget {
  const RegisteredPatient({Key? key}) : super(key: key);

  @override
  _RegisteredPatientState createState() => _RegisteredPatientState();
}

class _RegisteredPatientState extends State<RegisteredPatient> {
  final Stream<QuerySnapshot> patientData = FirebaseFirestore.instance.collection('patientDetails').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registered'),centerTitle: true,),
      body:  SizedBox(
        child: StreamBuilder<QuerySnapshot>(stream: patientData,builder: (BuildContext ctx,AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }
          if(snapshot.connectionState  == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          final data = snapshot.requireData;
          return ListView.builder(
              shrinkWrap: true,
              itemCount: data.size,
              itemBuilder: (BuildContext context,int index){
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onLongPress: ()  {
                      showDialog(context: context, builder: (BuildContext ctx){
                        return AlertDialog(
                          title: Text('Confirm'),
                          content: Text('Are you sure you want to delete record'),
                          actions: [
                            TextButton(onPressed: () async{
                              var collection = FirebaseFirestore.instance.collection('patientDetails');
                              await collection.doc(snapshot.data!.docs[index].reference.id).delete();
                              Navigator.pop(ctx);
                            }, child: Text('YES')),
                            TextButton(onPressed: (){Navigator.pop(ctx);}, child: Text('NO'))
                          ],
                        );
                      });

                    },
                    onTap: (){},
                    child: ListTile(
                      tileColor: Colors.white,
                      title: Text(data.docs[index]['patientName'].toString(),style: const TextStyle(color: Colors.black),),
                      subtitle: Text(data.docs[index]['gender'].toString(),style: const TextStyle(color: Colors.grey),),
                    ),
                  ),
                );
              });
        }),
      ),
    );
  }
}
