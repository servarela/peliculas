import 'package:flutter/material.dart';

import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class DataSearch extends SearchDelegate {

  String seleccion = '';
  final peliculasProvider = new PeliculasProvider();

  final peliculas = [
    'Spiderman',
    'Aquaman',
    'Batman',
    'Shazam!',
    'Ironman',
    'Capitán América',
  ];

  final peliculasRecientes = [
    'Spiderman',
    'Capitán América',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Acciones del AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ), 
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Resultados a mostrar
    return Center(
      child: Container(
        width: 100.0,
        height: 100.0,
        color: Colors.blueAccent,
        child: Text(seleccion),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Sugerencias

    if( query.isEmpty ) {
      return Container();
    }

    return FutureBuilder(
      future: peliculasProvider.buscarPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        
        if( snapshot.hasData ) {

          final peliculas = snapshot.data;

          return ListView(
            children: peliculas.map( (pelicula) {
              return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  width: 50.0,
                  fit: BoxFit.contain,
                ),
                title: Text(pelicula.title),
                subtitle: Text(pelicula.originalTitle),
                onTap: () {
                  close(context, null);
                  pelicula.uniqueId = '';
                  Navigator.pushNamed(context, 'detalle', arguments: pelicula);
                },
              );
            }).toList(),
          );

        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

      },
    );
    
  }
  
}
