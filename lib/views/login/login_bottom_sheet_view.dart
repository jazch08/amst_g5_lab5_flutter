import 'package:flutter/material.dart';
import 'package:amstg5_flutter/constants/colors.dart';

class LoginBottomSheet extends StatefulWidget {
  @override
  _LoginBottomSheet createState() => _LoginBottomSheet();
}

class _LoginBottomSheet extends State<LoginBottomSheet> {
  final TextEditingController _controllerUser = TextEditingController();
  final PasswordInput _passwordInput = PasswordInput();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _content(context);
  }

  _content(context) {
    return Container(
      margin: const EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 60),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            "Iniciar Sesión",
            style: TextStyle(
              fontSize: 22,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
            controller: _controllerUser,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person_rounded),
                contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Ingrese su Email",
                labelText: "Email",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0))),
          ),
          const SizedBox(
            height: 16,
          ),
          _passwordInput,
          const SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(left: 8, right: 8),
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pushReplacementNamed("/home"),
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.only(top: 16, bottom: 16), 
                  backgroundColor: AppColors.primaryColor,
                  textStyle: const TextStyle(fontSize: 16, color: Colors.white),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              child: const Text("Ingresar",style: TextStyle(color: AppColors.text_dark),),
            ),
          ),
        ],
      ),
    );
  }
}


class PasswordInput extends StatefulWidget {
  final TextEditingController controller = TextEditingController();

  String hint;
  String label;

  PasswordInput({
    this.hint = "Ingrese su Contraseña",
    this.label = "Contraseña",
  });

  @override
  _PasswordInput createState() => _PasswordInput();
}

class _PasswordInput extends State<PasswordInput> {
  bool _hiddenPassword = true;
  IconData _currentVisibility = Icons.visibility_off;

  @override
  void initState() {
    super.initState();
  }

  void _onTapVisibility() {
    setState(() {
      _hiddenPassword = !_hiddenPassword;
      _currentVisibility =
      (_hiddenPassword) ? Icons.visibility_off : Icons.visibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _hiddenPassword,
      controller: widget.controller,
      decoration: InputDecoration(
          prefixIcon: Icon(
            (_hiddenPassword) ? Icons.lock_rounded : Icons.lock_open_rounded,
          ),
          suffixIcon: IconButton(
            icon: Icon(_currentVisibility),
            onPressed: _onTapVisibility,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: widget.hint,
          labelText: widget.label,
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
  }
}