import 'package:clean_project/src/data/api/Api.dart';
import 'package:clean_project/src/domain/entities/user/AppUser.dart';
import 'package:clean_project/src/domain/repositories/AuthenticationRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@Injectable(as : AuthenticationRepository)
class AuthenticationRepositoryImpl implements AuthenticationRepository{

  @override
  Future<String> authenticate({String email = "" , String password = ""}) {

    return dioApi.post<String>("authentication/authenticate", data: { 'email' : email, 'password' : password } )
    .then((response){
      print("Response authenticate");
      print(response);
        addAuthInterceptor();
        return response.data!;
      })
      .catchError((error){
          print("ERROR");
          print(error);
      });
      
  }

  @override
  Future<AppUser> googleAuthenticate() async {

    print("GoogleUser");
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth = (await googleUser?.authentication)!;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    print("Credential");
    print(credential);

    
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    AppUser appUser = new AppUser(name : userCredential.additionalUserInfo!.username);

    return appUser;
      
  }

  @override
  Future<AppUser> facebookAuthenticate() async {

    print("FacebookUser");
    final AccessToken? result = await FacebookAuth.instance.login().then((value) => value.accessToken);
    final credential = FacebookAuthProvider.credential(result!.token);
    print("Credential");
    print(credential);

    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    AppUser appUser = new AppUser(name : userCredential.additionalUserInfo!.username);

    return appUser;
      
  }

}