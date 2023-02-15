import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  // ------------------------------------------------ Getters -------------------------------------------------------

  TextEditingController get songNameController => _songNameController;
  GlobalKey<FormState> get validationKey => _formKey;

  // ------------------------------------------------ Variables -----------------------------------------------------

  CollectionReference recipes = FirebaseFirestore.instance.collection('songs');
  var _songNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // ------------------------------------------------ Functionality -------------------------------------------------

  Future<void> uploadingData(String songName, context) async {
    await FirebaseFirestore.instance.collection("songs").add({
      'song_name': songName,
    }).whenComplete(() {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Data added successfully"),
        backgroundColor: Colors.green,
      ));
      notifyListeners();
    });
  }

  Future<void> uploadingfavData(String songName, context) async {
    await FirebaseFirestore.instance.collection("fav_songs").add({
      'fav_songs': songName,
    }).whenComplete(() {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Favourite song added successfully"),
        backgroundColor: Colors.green,
      ));
      notifyListeners();
    });
  }

  songNameValidation({required String? songName}) {
    if (songName == null) {
      return "Field can't be empty";
    } else if (songName.isEmpty) {
      return "Field can't be empty";
    } else if (songName.length < 3) {
      return "Field must be greater than 3";
    }
    return null;
  }
}
