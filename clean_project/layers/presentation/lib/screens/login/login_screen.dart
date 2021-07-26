import 'package:flutter/src/widgets/framework.dart';
import 'package:presentation/core/provider_screen.dart';
import 'package:presentation/screens/login/login_provider.dart';
import 'package:presentation/screens/login/login_template.dart';

class LoginScreen extends StatelessProviderScreen<LoginProvider> {
  LoginScreen(LoginProvider provider) : super(provider);

  void login(String email, String password) {
    if (email.isNotEmpty && password.isNotEmpty) {
      this.provider.authenticate(username: email, password: password);
    }
  }

  void onForgetPassword() {}

  @override
  Widget buildTemplate() {
    return LoginTemplate(
        onLogin: this.login, onForgetPassword: this.onForgetPassword);
  }
}
