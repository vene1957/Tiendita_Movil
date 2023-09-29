import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/input-decoreation.dart';

class LoginScreens extends StatelessWidget {
  LoginScreens({Key? key}) : super(key: key);

  // Definimos el usuario y la contraseña válidos
  final String validUsername = "Juan";
  final String validPassword = "juan123";

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) {
    final String enteredUsername = usernameController.text;
    final String enteredPassword = passwordController.text;

    if (enteredUsername == validUsername && enteredPassword == validPassword) {
      // Redirigir al usuario a la pantalla principal (cambia 'home' según tu enrutamiento)
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      // Mostrar una alerta de error si los datos de inicio de sesión son incorrectos
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error de inicio de sesión"),
            content: Text("Nombre de usuario o contraseña incorrectos."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cerrar"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            cajapurpura(size),
            iconopersona(),
            loginform(context),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView loginform(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 250,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 15,
                      offset: Offset(0, 5))
                ]),
            child: Column(
              children: [
                const SizedBox(height: 40),
                Text('Login',
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 30),
                Container(
                  child: Form(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  0.04 * MediaQuery.of(context).size.width),
                          child: SizedBox(
                            width: 0.92 * MediaQuery.of(context).size.width,
                            child: TextFormField(
                              controller: usernameController,
                              autocorrect: false,
                              decoration: MyInputDecoration.input(
                                hintText: 'Digite su contraseña',
                                labelText: 'Usuario',
                                icono: const Icon(
                                  Icons.person_pin,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  0.04 * MediaQuery.of(context).size.width),
                          child: SizedBox(
                            width: 0.92 * MediaQuery.of(context).size.width,
                            child: TextFormField(
                              controller: passwordController,
                              autocorrect: false,
                              obscureText: true, // Para ocultar la contraseña
                              decoration: MyInputDecoration.input(
                                hintText: '********',
                                labelText: 'Contraseña',
                                icono: const Icon(
                                  Icons.lock_outline,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          disabledColor: Colors.grey,
                          color: Colors.deepPurple,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 80, vertical: 15),
                            child: const Text(
                              'Ingresar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          onPressed: () {
                            login(
                                context); // Llama a la función 'login' para verificar las credenciales
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
  SafeArea iconopersona() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        width: double.infinity,
        child: const Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }

  Container cajapurpura(Size size) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1),
      ])),
      width: double.infinity,
      height: size.height * 0.4,
      child: Stack(
        children: [
          Positioned(
            top: 90,
            left: 30,
            child: burbuja(),
          ),
          Positioned(
            top: -40,
            left: -30,
            child: burbuja(),
          ),
          Positioned(
            top: -50,
            right: -20,
            child: burbuja(),
          ),
          Positioned(
            bottom: 0,
            left: 20,
            child: burbuja(),
          ),
          Positioned(
            bottom: 120,
            right: -20,
            child: burbuja(),
          ),
          Positioned(
            bottom: 10,
            right: 120,
            child: burbuja(),
          ),
        ],
      ),
    );
  }

  Container burbuja() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
}
