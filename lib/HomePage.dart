import 'package:flutter/material.dart';
import 'package:tp7_flutter_lists_bis/contact.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  List<Contact> listeContacts=[
    Contact("Sophie", "21 123456","assets/images/avatar1.png"),
    Contact("Jean", "22 123456","assets/images/avatar2.png"),
    Contact("Pierre", "23 123456","assets/images/avatar3.png"),
    Contact("Lucas", "24 123456","assets/images/avatar4.png"),
    Contact("Emma", "25 123456","assets/images/avatar5.png"),
    Contact("Marie", "26 123456","assets/images/avatar6.png"),
  ];
  showAlertDialog(BuildContext context, String message)
  {
    //Création des Boutons
    Widget cancelButton=TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel"));
    Widget continueButton=TextButton(onPressed: () => Navigator.pop(context), child: Text("Continue"));
    //Création de AlertDialog
    AlertDialog alert=AlertDialog(
      title: Text("AlertDialog"),
      content: Text(message),
      actions: [cancelButton, continueButton],
    );
    //Affichage de DialogBox
    showDialog(context: context, builder:(context) { return alert; },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Les listes sous Flutter"),
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.white,),
      body:  ListView.builder(itemBuilder: ( context, index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(listeContacts[index].photo),
            ),
            title: Text(listeContacts[index].nom),
            subtitle: Text(listeContacts[index].tel),
            trailing: IconButton(onPressed: () {
            }, icon:Icon( Icons.call)),
            onTap: () {
             showAlertDialog(context, listeContacts[index].nom);
            },
          ),
        );
      },
        itemCount: listeContacts.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(5),
        scrollDirection:Axis.vertical ,
      ),
    );
  }
}