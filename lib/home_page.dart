import 'package:flutter/material.dart';
import 'package:mbanking/modal_page.dart';
import 'package:mbanking/tes_page.dart';

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({Key? key}) : super(key: key);

  void fetchPrinterAddress(BuildContext context) {
    // Fungsi untuk mengambil alamat printer
    // Anda dapat menggantinya sesuai kebutuhan Anda.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
        backgroundColor: const Color(0xffa5683a),
      ),
      floatingActionButton: FloatingActionButton(
                  
                  onPressed: () {
                    showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => const Modalpage(),
                    );
                  },
                  backgroundColor: const Color(0xffa5683a),
                  elevation: 50,
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
      body: Container(
        height: MediaQuery.of(context).size.height,
          child:Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: const AlignmentDirectional(0.00, -1.00),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 20),
                child: Container(
                width: MediaQuery.of(context).size.width * 0.8, // Adjust the factor as needed
                height: MediaQuery.of(context).size.height / 3.5, 
                // Adjust the factor as needed
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 231, 231, 231),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                          
                            GestureDetector(
                              onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Tespage()));
                              },
                              child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.00, -1.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0.05),
                                    child: Icon(
                                      Icons.home,
                                      color: Color(0xffa5853a),
                                      size: 24,
                                    ),
                                  ),
                                ),
                                Text(
                                    'Pulsa\n& Data',
                                    
                                  ),
                              ],
                            ),
                          ),
            

                          GestureDetector(
                              onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Tespage()));
                              },
                              child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.00, -1.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(20, 2, 20, 0.05),
                                    child: Icon(
                                      Icons.person,
                                      color: Color(0xffa5853a),
                                      size: 24,
                                    ),
                                  ),
                                ),
                                Text(
                                    'Games',
                                    
                                  ),
                              ],
                            ),
                          ),

                            GestureDetector(
                              onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Tespage()));
                              },
                              child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.00, -1.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(20, 2, 20, 0.05),
                                    child: Icon(
                                      Icons.wallet,
                                      color: Color(0xffa5853a),
                                      size: 24,
                                    ),
                                  ),
                                ),
                                Text(
                                    'eMAS',
                                    
                                  ),
                              ],
                            ),
                          ),

                            GestureDetector(
                              onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Tespage()));
                              },
                              child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.00, -1.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(20, 2, 20, 0.05),
                                    child: Icon(
                                      Icons.lightbulb_circle_outlined,
                                      color: Color(0xffa5853a),
                                      size: 24,
                                    ),
                                  ),
                                ),
                                Text(
                                    'Listrik',
                                    
                                  ),
                              ],
                            ),
                          ),
                            // Add similar GestureDetector blocks for other icons
                          ],
                        ),
                      ),
                  

                      Padding(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.04),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Tespage()));
                              },
                              child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.00, -1.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0.05),
                                    child: Icon(
                                      Icons.three_p_sharp,
                                      color: Color(0xffa5853a),
                                      size: 24,
                                    ),
                                  ),
                                ),
                                Text(
                                    'Digital\nVoucher',
                                    
                                  ),
                              ],
                            ),
                          ),

                            GestureDetector(
                              onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Tespage()));
                              },
                              child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.00, -1.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(20, 2, 20, 0.05),
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Color(0xffa5853a),
                                      size: 24,
                                    ),
                                  ),
                                ),
                                Text(
                                    'Pascabayar',
                                    
                                  ),
                              ],
                            ),
                          ),

                            GestureDetector(
                              onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Tespage()));
                              },
                              child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.00, -1.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(20, 2, 20, 0.05),
                                    child: Icon(
                                      Icons.cast,
                                      color: Color(0xffa5853a),
                                      size: 24,
                                    ),
                                  ),
                                ),
                                Text(
                                    'Tix id',
                                    
                                  ),
                              ],
                            ),
                          ),

                            GestureDetector(
                              onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Tespage()));
                              },
                              child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.00, -1.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0.05),
                                    child: Icon(
                                      Icons.settings_voice,
                                      color: Color(0xffa5853a),
                                      size: 24,
                                    ),
                                  ),
                                ),
                                Text(
                                    'Lihat\nSemua',
                                    
                                  ),
                              ],
                            ),
                          ),
                            // Add similar GestureDetector blocks for other icons
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Divider(
                  thickness: 1,
                  color: Color(0xffa5683a),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Tespage()));
              },
              child: ListTile(
                title: const Text(
                  'Printer Kasir',
                ),
                subtitle: const Text(
                  'Setting nama printer',
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xffa5683a),
                  size: 20,
                ),
                dense: false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: Color(0xffa5683a),
            ),
            ListTile(
              title: Text(
                'Printer Dapur',
              ),
              subtitle: Text(
                'Setting nama printer',
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Color(0xffa5683a),
                size: 20,
              ),
              dense: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ],
        ),


              ),
            );
          }
        }
