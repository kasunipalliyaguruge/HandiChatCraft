import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:handichatcraft_w1956102_communitypage/services/firestore.dart';


class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {

  final FirestoreServices firestoreServices = FirestoreServices();

  final TextEditingController textController = TextEditingController();

  void openNotebox(String? docID){
    showDialog(context: context, builder: (context) =>  AlertDialog(
      title: const Text('Add Note'),
      content: TextField(controller: textController,
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            //new note
            if(docID == null){
              firestoreServices.addNote(textController.text);
            }
             //update note
            else{
              firestoreServices.updateNote(docID, textController.text);
            }
            textController.clear();
            Navigator.pop(context);
          },
          child:const Text('Add'),
        ),
      ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'My Notes',
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
            ), 
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openNotebox(null),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreServices.getNoteStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List noteList = snapshot.data!.docs;

            return ListView.builder(
              itemCount: noteList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = noteList[index];
                String docID = document.id;

                Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                String noteText = data['note'];

                return ListTile(
                  title: Text(noteText),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: ()=> openNotebox(docID),
                        icon: const Icon(Icons.settings),
                      ),

                      IconButton(
                        onPressed: () => firestoreServices.deleteNotes(docID),
                        icon: const Icon(Icons.delete),
                      )
                    ],
                  ),
                );

              },
            );
          }
          else{
            return const Text('No notes available ....!');
          }
        },
      ),
    );
  }
}