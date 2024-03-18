import 'package:flutter/material.dart';


import 'package:flutter_fetching_product/model.dart';
import 'package:flutter_fetching_product/webservice.dart';



class Albumpage extends StatefulWidget {
  const Albumpage({super.key});

  @override
  State<Albumpage> createState() => _AlbumpageState();
}

class _AlbumpageState extends State<Albumpage> {
  late Future<List<Album>> futureAlbums;

  @override
  void initState() {
    super.initState();
    futureAlbums = fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
          backgroundColor: Colors.pinkAccent,
        ),

        
        body: Center(
          child: FutureBuilder<List<Album>>(
            future: futureAlbums,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Album> albums = snapshot.data!;

                return ListView.builder(
                  itemCount: albums.length,
                  itemBuilder: (context, index) {
                    Album album = albums[index];
                    return Card(
                      color: Colors.black12,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("postid : ${album.postid ??'1'}"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(" ID: ${album.id}"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("name: ${album.name}"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("email: ${album.email}"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("body: ${album.body}"),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      );
    
  }
}