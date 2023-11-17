import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mbanking/bottom_navbar.dart';
import 'package:mbanking/utility/app_constant.dart';
import 'package:mbanking/widget/custom_loading.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late bool obscureText;
  late bool obscureText2;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
    void initState() {
    // TODO: implement initState
    super.initState();
    obscureText = true;
    obscureText2 = true;
    // loadSharedPreference();
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
            appBar: AppBar(
            backgroundColor: const Color.fromARGB(245, 160, 104, 0),
              title: const Text('Login'),
              
            ),
            key: scaffoldKey,
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 40, 20, 70),
                    decoration: const BoxDecoration(
                    image: DecorationImage(
                    image: AssetImage('assets/mozaic/logo-baru-set-09.png'),
                    )),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        hintText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  Container(
                      height: 80,
                      width: 200,
                      padding: const EdgeInsets.all(20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(245, 160, 104, 0),
                          minimumSize: const Size.fromHeight(50),
                        ),
                        child: const Text('Log In'),
                        onPressed: () {
                          loginValidation(context);
                        },
                      )),
                
                ],
              ),
            ));
  }

   void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  void loginValidation(BuildContext context) async {
    bool isLoginValid = true;
    FocusScope.of(context).requestFocus(FocusNode());

    if (emailController.text.isEmpty) {
      isLoginValid = false;
      _onWidgetDidBuild(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Username Tidak Boleh Kosong'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            
          ),
        );
      });
    }

    if (passwordController.text.isEmpty) {
      isLoginValid = false;
      
      _onWidgetDidBuild(() {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Password Tidak Boleh Kosong'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only( bottom: MediaQuery.of(context).size.height - 150,left: 10,right: 10),

          ),
        );
      });
    }
    if (isLoginValid) {
      fetchLogin(context, emailController.text, passwordController.text);
    }
  }

  fetchLogin(BuildContext context, String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    showLoaderDialog(context);
    try {
      Response response;
      var dio = Dio();
      response = await dio.post(
        AppConstans.BASE_URL+AppConstans.LOGIN,
        data: {'username': username, 'password': password},
        options: Options(contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        //berhasil
        hideLoaderDialog(context);
        //setSharedPreference
        String prefUsername = response.data['data']['name'];
        String prefFullname = response.data['data']['full_name'];
        String prefUserId = response.data['data']['user_id'].toString();
        String prefUserGroup = response.data['data']['user_group_name'];
        String prefCreated = response.data['data']['created_at'];
        String prefGuestState = response.data['data']['guest_state'].toString();
        String prefToken = response.data['token'];
        await prefs.setString('username', prefUsername);
        await prefs.setString('full_name', prefFullname);
        await prefs.setString('user_id', prefUserId);
        await prefs.setString('user_group_name', prefUserGroup);
        await prefs.setString('created_at', prefCreated);
        await prefs.setString('guest_state', prefGuestState);
        await prefs.setString('token', prefToken);

        if (int.parse(prefGuestState) == 1) {
          final date_created =
              DateTime.parse(response.data['data']['created_at']);
          final date_now = DateTime.now();
          final date_difference = date_now.difference(date_created).inDays;
          // print(date_created);
          // print(date_now);
          // print(date_difference);
          if (date_difference >= 7) {
            expiredGuest(context);
            return;
          }
        }
        //Messsage
        _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login Berhasil'),
              backgroundColor: Color(0xff36E892),
              behavior: SnackBarBehavior.floating,
            ),
          );
        });
        //homePage
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => BottomNavBar()));
      }
    } on DioError catch (e) {
      hideLoaderDialog(context);
      if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        //gagal
        String errorMessage = e.response?.data['message'];
        _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ),
          );
        });
      } else {
        print(e.message);
        _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Server Error'),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ),
          );
        });
      }
    }
  }

  registerGuest(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    showLoaderDialog(context);
    try {
      Response response;
      var dio = Dio();
      response = await dio.get(
        AppConstans.BASE_URL+AppConstans.REGISTER,
        options: Options(contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        //berhasil
        hideLoaderDialog(context);
        //setSharedPreference
        String prefUsername = response.data['data']['name'];
        String prefFullname = response.data['data']['full_name'];
        String prefUserId = response.data['data']['user_id'].toString();
        String prefUserGroup = response.data['data']['user_group_name'];
        String prefCreated = response.data['data']['created_at'];
        String prefGuestState = response.data['data']['guest_state'].toString();
        String prefToken = response.data['token'];
        await prefs.setString('username', prefUsername);
        await prefs.setString('full_name', prefFullname);
        await prefs.setString('user_id', prefUserId);
        await prefs.setString('user_group_name', prefUserGroup);
        await prefs.setString('created_at', prefCreated);
        await prefs.setString('guest_state', prefGuestState);
        await prefs.setString('token', prefToken);
        //Messsage
        _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login Berhasil'),
              backgroundColor: Color(0xff36E892),
              behavior: SnackBarBehavior.floating,
            ),
          );
        });
        //homePage
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BottomNavBar()));
      }
    } on DioError catch (e) {
      hideLoaderDialog(context);
      if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        //gagal
        String errorMessage = e.response?.data['message'];
        _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ),
          );
        });
      } else {
        print(e.message);
        _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Server Error'),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ),
          );
        });
      }
    }
  }

  expiredGuest(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      content: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        // height: 70,
        child: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                "Akun percobaan telah berakhir !",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Untuk mendapatkan akses penuh silahkan hubungi : ",
                style: TextStyle(
                  color: Color.fromARGB(255, 26, 189, 211),
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "+62-812-2612-4600",
                style: TextStyle(
                    color: Color.fromARGB(255, 26, 189, 211),
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "admin@ciptasolutindo.id",
                style: TextStyle(
                  color: Color.fromARGB(255, 26, 189, 211),
                  fontSize: 12,
                ),
              ),
              Text(
                "www.ciptasolutindo.id",
                style: TextStyle(
                  color: Color.fromARGB(255, 26, 189, 211),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showLoaderDialog(BuildContext context) {
    Material loading = Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomLoading(),
              const SizedBox(height: 10.0),
              Container(
                  child: const Text(
                    'Loading...',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0
                    ),
                  ),
              ),
            ],
          )
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return loading;
      },
    );
  }

  hideLoaderDialog(BuildContext context) {
    return Navigator.pop(context);
  }

}