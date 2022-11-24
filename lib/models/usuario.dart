class Usuario {
  var correo;
  var identificacion;
  var nombre;
  var password;
  var confirmPassword;
  var rol;
  Usuario(
      {this.correo,
      this.identificacion,
      this.nombre,
      this.password,
      this.confirmPassword,
      this.rol});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      correo: json['correo'],
      identificacion: json['identificacion'],
      nombre: json['nombre'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
      rol: json['rol'],
    );
  }
}
