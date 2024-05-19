import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:greengrocer/src/configs/custom_colors.dart';
import 'package:greengrocer/src/views/components/custom_text_field.dart';
import 'package:greengrocer/src/configs/app_data.dart' as app_data;

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
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
          children: [
            CustomTextField(
              initialValue: app_data.user.email,
              icon: Icons.email,
              label: 'Email',
              isSecret: false,
            ),
            CustomTextField(
              initialValue: app_data.user.name,
              icon: Icons.person,
              label: 'Nome',
              isSecret: false,
            ),
            CustomTextField(
              initialValue: app_data.user.phone,
              icon: Icons.phone,
              label: 'Celular',
              isSecret: false,
            ),
            CustomTextField(
              initialValue: app_data.user.cpf,
              readOnly: true,
              icon: Icons.file_copy,
              label: 'CPF',
              isSecret: true,
            ),
            CustomTextField(
              initialValue: app_data.user.password,
              readOnly: true,
              icon: Icons.lock,
              label: 'Senha',
              isSecret: true,
            ),
            SizedBox(
              height: 40,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.customSwatchColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () async {
                  bool? result = await updatePassword();
                  print(result);
                },
                label: const Text(
                  'Atualizar dados',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                icon: const Icon(
                  Icons.update,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ));
  }

  Future<bool?> updatePassword() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            backgroundColor: Colors.grey.shade100,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text('Atualizar senha',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  CustomTextField(
                    initialValue: app_data.user.password,
                    icon: Icons.lock,
                    label: 'Senha atual',
                    isSecret: true,
                  ),
                  const CustomTextField(
                    icon: Icons.lock_open_outlined,
                    label: 'Nova senha',
                    isSecret: true,
                  ),
                  const CustomTextField(
                    icon: Icons.lock_open_outlined,
                    label: 'Confirmar nova senha',
                    isSecret: true,
                  ),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.customSwatchColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () async {},
                      label: const Text(
                        'Atualizar senha',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      icon: const Icon(
                        Icons.update,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
