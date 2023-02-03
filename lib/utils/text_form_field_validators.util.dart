class TextFormFieldValidators {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Campo requerido';
    }

    var p = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";

    var r = RegExp(p);

    if (r.hasMatch(email)) {
      return null;
    }

    return 'Formato invalido';
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Campo requerido';
    }

    return null;
  }

  static String? valdiateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Campo requerido';
    }

    return null;
  }

  static String? valdiateNick(String? nick) {
    if (nick == null || nick.isEmpty) {
      return 'Campo requerido';
    }

    return null;
  }

  static String? validatePreference(String? prefrence) {
    if (prefrence == null || prefrence.isEmpty) {
      return null;
    }

    var r = RegExp(r'^[a-zA-Z ñáéíóú]+$');

    if (r.hasMatch(prefrence)) {
      return null;
    }

    return 'Solo letras y espacios';
  }

  static String? validateQuery(String? query) {
    if (query == null || query.isEmpty) {
      return null;
    }

    var r = RegExp(r'^[a-zA-Z ñáéíóú]+$');

    if (r.hasMatch(query)) {
      return null;
    }

    return 'Solo letras y espacios';
  }
}