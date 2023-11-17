import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mbanking/login.dart';
import 'package:mbanking/tes_page.dart';
import 'package:mbanking/utility/app_constant.dart';
import 'package:mbanking/widget/custom_loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

    String username = '';
  String full_name = '';
  String user_id = '';
  String user_group_name = '';
  String token = '';
  int? guest_state;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xffa5683a),
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
          Padding(
          padding: const EdgeInsets.only(top: 20), 
          // Mengatur jarak dari atas sebanyak 10px
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3, // 30% dari lebar layar
                height: MediaQuery.of(context).size.width * 0.3, // 30% dari tinggi layar
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.blueAccent,
                    width: 3,
                  ),
                ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.15), // 15% dari lebar layar
                  child: Image.network(
                    'https://picsum.photos/seed/470/600',
                    width: MediaQuery.of(context).size.width * 0.2, // 20% dari lebar layar
                    height: MediaQuery.of(context).size.width * 0.2, // 20% dari tinggi layar
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0), // Ganti top ke 10px
              child: Text(
                'Daffa Hanaris',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            const Divider(
                height: 20,
                thickness: 1,
                indent: 24,
                endIndent: 24,
                color: Colors.grey,
              ),
            const Text(
                '\$24,421',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Montserrat',
                ),
              ),

            GestureDetector(
              onTap: () {

              },
            child: const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 16),
                child: Text(
                  'Wallet Balance',
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Montserrat',
                ),
                ),
              ),
            ),

            GestureDetector(
                onTap: () {
                  // Tambahkan tindakan yang akan dijalankan ketika widget ini ditekan
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Tespage()));
                },
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color.fromARGB(255, 80, 80, 80),
                        width: 2,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                            child: Icon(
                              Icons.power_settings_new_rounded,
                              color: Color.fromARGB(255, 23, 23, 23),
                              size: 24,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Text(
                              'Trade Assets',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {
                  // Tambahkan tindakan yang akan dijalankan ketika widget ini ditekan
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Tespage()));
                },
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color.fromARGB(255, 80, 80, 80),
                        width: 2,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                            child: Icon(
                              Icons.attach_money_rounded,
                              color: Color.fromARGB(255, 23, 23, 23),
                              size: 24,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Text(
                              'Buy Assets',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {
                  // Tambahkan tindakan yang akan dijalankan ketika widget ini ditekan
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Tespage()));
                },
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color.fromARGB(255, 80, 80, 80),
                        width: 2,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                            child: Icon(
                              Icons.repeat,
                              color: Color.fromARGB(255, 23, 23, 23),
                              size: 24,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Text(
                              'Trade Assets',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

            // Generated code for this Button Widget...
            const SizedBox(height: 10.0,),
              InkWell(
                  onTap: () {
                  fetchLogout(context);
                  },
                  child: Container(
                  
                    width: MediaQuery.of(context).size.width / 2.5,
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).padding.bottom == 0
                            ? 20
                            : MediaQuery.of(context).padding.bottom),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.16),
                            offset: Offset(0, 5),
                            blurRadius: 10.0,
                          )
                        ],
                      color:const Color(0xffd7b38e),
                        borderRadius: BorderRadius.circular(38),
                  ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.logout_outlined,
                          color: Colors.white,
                          size: 22.0,
                        ),
                        Text(
                          'Logout',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Montserrat'
                          ),
                        ),
                      ],
                    ),
                ),
              ),
          ],
        ),
      ),
    );
  }
  
  void fetchLogout(BuildContext context) async {
    // Remove data for the 'counter' key.
    final prefs = await SharedPreferences.getInstance();
    showLoaderDialog(context);
    token = prefs.getString('token')!;
    try {
      Response response;
      var dio = Dio();
      dio.options.headers["authorization"] = "Bearer ${token}";
      response = await dio.post(
        AppConstans.BASE_URL+AppConstans.LOGOUT,
        data: {},
        options: Options(contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        //berhasil
        hideLoaderDialog(context);
        //setSharedPreference
        final removeEmail = await prefs.remove('username');
        final removeUserGroup = await prefs.remove('user_group_name');
        final removeCreated = await prefs.remove('created_at');
        final removeToken = await prefs.remove('token');
        //Messsage
        _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Logout Berhasil'),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ),
          );
        });
        //SettingsPage
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
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
        // print(e.message);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
      }
    }
  }

   showLoaderDialog(BuildContext context) {
    Material loading = Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomLoading(),
              SizedBox(height: 10.0),
              Container(
                  child: Text(
                    'Loading...',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0
                    ),
                  )
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

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

}
