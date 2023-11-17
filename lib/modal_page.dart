import 'package:flutter/material.dart';

class Modalpage extends StatefulWidget {
  const Modalpage({super.key});

  @override
  State<Modalpage> createState() => _ModalpageState();
}

class _ModalpageState extends State<Modalpage> {
  @override
  Widget build(BuildContext context) {

        Widget confirmButton = InkWell(
      onTap: () {
        print('test button');
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom == 0
                ? 20
                : MediaQuery.of(context).padding.bottom),
        decoration: BoxDecoration(
          color: const Color(0xffd7b38e),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, 5),
                blurRadius: 10.0,
              )
            ],
            borderRadius: BorderRadius.circular(9.0)),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              Icons.save,
              color: Colors.white,
              size: 22.0,
            ),
            Text(
              'Simpan',
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
    );

    return Container(
       padding: MediaQuery.of(context).viewInsets,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.9),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(24), topLeft: Radius.circular(24))),
        width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
                      const SizedBox(height: 20.0),
            const Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Tambah Pengeluaran',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 22.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Montserrat'
                    ),
                  ),
                ],
              ),
            ),
          Container(
                height: 300,
                child: SingleChildScrollView(
                    child: Column(children: [
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 22.0),
                        padding:  const EdgeInsets.symmetric(horizontal: 16.0),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5.0)
                            )
                        ),
                        
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                          
                          decoration: InputDecoration(
                            labelText: "Keterangan",
                            labelStyle: const TextStyle(
                                color: Colors.orange),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 235, 147, 17)),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Keterangan tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Jumlah",
                            labelStyle: const TextStyle(
                                color: Colors.orange),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 235, 147, 17)),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Jumlah tidak boleh kosong';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(height: 15),
                    ])
                )
            ),
            confirmButton
        ],

      ),
    );




  }
}