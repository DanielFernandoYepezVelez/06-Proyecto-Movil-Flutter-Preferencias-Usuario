import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/shared_prefs/prefs_user.dart';

import 'package:preferencias_usuario_app/src/widgets/menu_widget.dart';

class HomeScreen extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = HomeScreen.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias De Usuario'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Color Secundario: ${prefs.colorSecundario}'),
        Divider(),
        Text('Genero: ${prefs.genero}'),
        Divider(),
        Text('Nombre Usuario: ${prefs.nombreUsuario}'),
        Divider(),
      ]),
    );
  }
}
