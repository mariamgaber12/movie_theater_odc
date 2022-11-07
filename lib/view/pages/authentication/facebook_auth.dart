import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:odc_movie_theater/view_model/models/auth/data_user.dart';

class MyFacebook extends StatefulWidget {
  const MyFacebook({Key? key}) : super(key: key);

  @override
  State<MyFacebook> createState() => _MyFacebookState();
}

class _MyFacebookState extends State<MyFacebook> {
  UserData? _userData;
  AccessToken? _accessToken;
  bool _checking = true;

  @override
  void initState() {
    super.initState();
    _checkIsLoggedIn();
    _checking = true;
  }

  _checkIsLoggedIn() async {
    final accessToken = await FacebookAuth.instance.accessToken;
    setState(() {
      _checking = false;
    });

    if (accessToken != null) {
      print(accessToken.toJson());
      final userData = await FacebookAuth.instance.getUserData();
      _accessToken = accessToken;
      setState(() {
        _userData = userData as UserData;
      });
    } else {
      _login();
    }
  }

  _login() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;

      final userData = await FacebookAuth.instance.getUserData();
      _userData = userData as UserData;
    } else {
      print(result.status);
      print(result.message);
    }
    setState(() {
      _checking = false;
    });
  }

  _logout() async {
    await FacebookAuth.instance.logOut();
    _accessToken = null;
    _userData = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print('MARIAM IS $_userData');
    return Scaffold(
      body: _checking
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _userData != null
                    ? Text('name: ${_userData!.data!.name}')
                    : Container(),
                _userData != null
                    ? Text('email: ${_userData!.data!.email}')
                    : Container(),
                _userData != null
                    ? Container(
                        child: Image.asset('assets/img.png'),
                      )
                    : Container(),
                const SizedBox(
                  height: 20,
                ),
                CupertinoButton(
                    color: Colors.blue,
                    onPressed: _userData != null ? _logout : _login,
                    child: Text(
                      _userData != null ? 'LOGOUT' : 'LOGIN',
                      style: const TextStyle(color: Colors.white),
                    ))
              ],
            )),
    );
  }
}
