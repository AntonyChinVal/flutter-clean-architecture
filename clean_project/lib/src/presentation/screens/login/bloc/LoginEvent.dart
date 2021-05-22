abstract class LoginSEvent {}

class AuthenticateEvent extends LoginSEvent {
  final String username;
  final String password;

  AuthenticateEvent(this.username, this.password);
}
