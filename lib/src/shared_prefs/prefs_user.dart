import 'package:shared_preferences/shared_preferences.dart';

/** Aqui Tengo La Información Centralizada De La Preferencias Del Usuario
 * Estilo Local Storage Pero Del Dispositivo Y No Se Manejo Con Un Gestor 
 * De Estado Como (Block O Provider).
 */
class PreferenciasUsuario {
  /* Ninguna De Estas Preferencias Se Usa */
  /* 
    bool _colorSecundario;
    int _genero;
    String _nombre;
  */

  /* Quiero Implementar El Patron Singleton, Que Me Va Ayudar A Manejar Una
  Instancia Única De La Linea De Código De Las Preferencias Del Usuario */

  /* TODO ESTO ES EL PATRÓN SINGLETON */
  /* Cuando Se Instancie PreferenciasUsuario prefs = new PreferenciasUsuario(), Entonces
  Se Va A Disparar El Factory(Constructor) Y El Factory Me Va A Retorna La Instancia 
  Que He Definido Como Una Propiedad Static Constante Y Privada, No Importa En Cuantos
  Lugares Se Haga El New, Siempre Me Va A Retornar La Misma Instancia. */
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();
  /* ------------------- FIN SINGLETON -------------------------- */

  late SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  /* GETTERS Y SETTERS */
  int get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }

  bool get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }

  String get nombreUsuario {
    return _prefs.getString('nombreUsuario') ?? '';
  }

  set nombreUsuario(String value) {
    _prefs.setString('nombreUsuario', value);
  }

  String get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'home';
  }

  set ultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }
}
