import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UploadProvider extends ChangeNotifier {
  // ----------------------------------------------------- Gettters --------------------------------------------------------------

  // ----------------------------------------------------- Variables -------------------------------------------------------------

  CollectionReference recipess = FirebaseFirestore.instance.collection('fav_songs');

  // ----------------------------------------------------- Functionality ---------------------------------------------------------

}
