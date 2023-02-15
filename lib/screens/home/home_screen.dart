import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/home_provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isplaying = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: StreamBuilder(
            stream: provider.recipes.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                    child: Text(
                  'Something went wrong',
                  style: TextStyle(color: Colors.grey),
                ));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.red,
                ));
              }

              if (snapshot.data!.size == 0) {
                return const Center(
                    child: Text(
                  "No records found",
                  style: TextStyle(color: Colors.grey),
                ));
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      "${index + 1} ${snapshot.data!.docs[index]['song_name']}",
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          provider.uploadingfavData(
                              snapshot.data!.docs[index]['song_name'], context);
                        },
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.grey,
                        )),
                  );
                },
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            isScrollControlled: true,
            context: context,
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50.0),
                    Form(
                      key: provider.validationKey,
                      child: TextFormField(
                        controller: provider.songNameController,
                        validator: (value) {
                          provider.songNameValidation(songName: value);
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          labelText: 'Add songs',
                          hintText: 'Enter your song name',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        onPressed: () {
                          if (provider.validationKey.currentState!.validate()) {
                            provider.uploadingData(
                                provider.songNameController.text, context);
                          }
                        },
                        child: const Text("Upload"))
                  ],
                ),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
