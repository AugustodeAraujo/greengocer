import 'package:flutter/material.dart';

import 'package:greengrocer/src/configs/custom_colors.dart';

import 'package:greengrocer/src/views/components/custom_text_field.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                      child: Center(
                    child: Text('Cadastro',
                        style: TextStyle(color: Colors.white, fontSize: 35)),
                  )),

                  // Form
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 40),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(45))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const CustomTextField(
                            icon: Icons.email, label: 'Email', isSecret: false),
                        const CustomTextField(
                            icon: Icons.lock, label: 'Senha', isSecret: true),
                        const CustomTextField(
                            icon: Icons.person, label: 'Nome', isSecret: false),
                        const CustomTextField(
                            icon: Icons.phone,
                            label: 'Celular',
                            isSecret: false),
                        const CustomTextField(
                            icon: Icons.file_copy,
                            label: 'CPF',
                            isSecret: false),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18))),
                              onPressed: () {},
                              child: const Text(
                                'Cadastrar usuário',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 10,
                left: 10,
                child: SafeArea(
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
