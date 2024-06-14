import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _cedulaController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _nombreUsuarioController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

    void _register(BuildContext context) {
      if (_formKey.currentState?.validate() ?? false) {
        // Aquí puedes manejar el registro con los valores ingresados
        
        print('Nombre: ${_nameController.text}');
        print('Correo electrónico: ${_emailController.text}');
        print('Contraseña: ${_passwordController.text}');
        print('apellido: ${_apellidoController.text}');
        print('cedula: ${_cedulaController.text}');
        print('telefono: ${_telefonoController.text}');
        print('nombreUsuario: ${_nombreUsuarioController.text}');
       
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('¡Registrado con exito!'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }

  @override
  void dispose() {
    _cedulaController.dispose();
    _telefonoController.dispose();
    _nombreUsuarioController.dispose();
    _apellidoController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      backgroundColor: const Color(0xFF0D1B2A), // Añadir color de fondo
      body: SingleChildScrollView (
        child: Card(
          color: const Color.fromARGB(255, 59, 90, 138).withOpacity(0.9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    'https://th.bing.com/th/id/OIG3.a2ieBkgUqi7HJAAwybae?w=1024&h=1024&rs=1&pid=ImgDetMain',
                    height: 150,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Registro',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 247, 251, 255),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _nombreUsuarioController,
                    decoration: InputDecoration(
                      labelText: 'Nombre de usuario',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.text, // Asegura que el teclado sea para texto
  inputFormatters: [
    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')), // Permite solo letras
  ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese su nombre de usuario';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _apellidoController,
                    decoration: InputDecoration(
                      labelText: 'Apellido',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.text, // Asegura que el teclado sea para texto
  inputFormatters: [
    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')), // Permite solo letras
  ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese su apellido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _cedulaController,
                    decoration: InputDecoration(
                      labelText: 'Cedula',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                     inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Permite solo números
      keyboardType: TextInputType.number, // Tipo de teclado numérico
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese su cedula';
                      }else if (value.length == 10) {
                        return 'La cedula debe tener 10 caracteres';         
                        }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Correo electrónico',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese su correo electrónico';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Ingrese un correo electrónico válido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _telefonoController,
                    decoration: InputDecoration(
                      labelText: 'Numero de telefono',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                     inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Permite solo números
      keyboardType: TextInputType.number, // Tipo de teclado numérico
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese su telefono';
                      } else if (value.length == 10) {
                        return 'La telefono debe tener 10 caracteres';                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese su telefono';
                      } else if (value.length > 8) {
                        return 'La contraseña debe tener minimo 8 caracteres';                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _register(context), // Pasar el contexto al método _register
                    child: const Text('Registrarse'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
