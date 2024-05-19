import 'package:flutter/material.dart';
import 'package:greengrocer/src/configs/custom_colors.dart';
import 'package:greengrocer/src/views/components/custom_text_field.dart';
import 'package:greengrocer/src/configs/app_data.dart' as app_data;

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.customSwatchColor,
          elevation: 0,
          title: const Text.rich(TextSpan(
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            children: [
              TextSpan(
                  text: 'Perfil do usuário',
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ],
          )),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          children: const [
            CustomTextField(
              initialValue: '',
              icon: Icons.email,
              label: 'Email',
              isSecret: false,
            ),
            CustomTextField(
              icon: Icons.person,
              label: 'Nome',
              isSecret: false,
            ),
            CustomTextField(
              icon: Icons.phone,
              label: 'Celular',
              isSecret: false,
            ),
            CustomTextField(
              icon: Icons.file_copy,
              label: 'CPF',
              isSecret: true,
            ),
            CustomTextField(
              icon: Icons.lock,
              label: 'Senha',
              isSecret: true,
            ),
          ],
        ));
  }
}
