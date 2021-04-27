abstract class LoginSEvent{}

class AunthenticateEvent extends LoginSEvent {
  
  final String username;
  final String password;
  final Function() onSuccess;
  final Function() onError;

  AunthenticateEvent(this.username, this.password, this.onSuccess, this.onError);

}