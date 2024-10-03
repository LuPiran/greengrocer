import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/screen/common_widgets/custom_text_field.dart';
import 'package:greengrocer/src/config/app_data.dart' as appData;

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.customSwatchColor,
        title: Text(
          "Perfil do usuário",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          //Email
          CustomTextField(
            initialValue: appData.user.email,
            readOnly: true,
            icon: Icons.email,
            label: "E-mail",
          ),
          //Nome
          CustomTextField(
            initialValue: appData.user.name,
            readOnly: true,
            icon: Icons.person,
            label: "Nome",
          ),
          // Celular
          CustomTextField(
            initialValue: appData.user.celular,
            readOnly: true,
            icon: Icons.phone,
            label: "Celular",
          ),
          //CPF
          CustomTextField(
            initialValue: appData.user.cpf,
            readOnly: true,
            icon: Icons.file_copy,
            label: "CPF",
            isSecret: true,
          ),
          //Botao para atualizar a senha
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                side: const BorderSide(
                  width: 2,
                  color: Colors.green,
                ),
              ),
              onPressed: () {
                updatePassword();
              },
              child: const Text(
                "Atualizar senha",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //Titulo
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        "Atualização de senha",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    //Senha Antiga
                    CustomTextField(
                      icon: Icons.lock,
                      isSecret: true,
                      readOnly: false,
                      label: "Senha atual",
                    ),
                    //Senha nova
                    CustomTextField(
                      icon: Icons.lock_outline,
                      isSecret: true,
                      readOnly: false,
                      label: "Senha nova",
                    ),
                    //Confirmacao senha nova
                    CustomTextField(
                      icon: Icons.lock_outline,
                      isSecret: true,
                      readOnly: false,
                      label: "Confirmar nova senha",
                    ),
                    //Botao de confirmacao
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: CustomColors.customSwatchColor,
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Atualizar",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
