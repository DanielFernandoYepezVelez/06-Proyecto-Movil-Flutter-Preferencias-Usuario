import 'package:flutter/material.dart';

import 'package:preferencias_usuario_app/src/screens/home_screen.dart';
import 'package:preferencias_usuario_app/src/screens/settings_screen.dart';

/* Clase Del Patron Singleton */
import 'package:preferencias_usuario_app/src/shared_prefs/prefs_user.dart';

void main() async {
  /* Uno De Los Beneficios Del Singleton, Es Que Lo Puedo LLamar En Un Alto Nivel
  Como En Esta Parte De Mi Aplicación */
  final prefs = new PreferenciasUsuario();
  WidgetsFlutterBinding.ensureInitialized();

  /* No Ejecute La Aplicación Hasta Que Las Preferencias Sean Cargadas E Inicializadas */
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = new PreferenciasUsuario();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: prefs.ultimaPagina,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SettingsScreen.routeName: (_) => SettingsScreen()
      },
    );
  }
}
