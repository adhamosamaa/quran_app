import 'package:flutter/material.dart';
import 'arabic_sura_numbers.dart';
import 'mydrawer.dart';
import 'surah_builder.dart';
import 'constant.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFEFAE0),
      // drawer: const MyDrawer(),
      endDrawer: MyDrawer(),
      // floatingActionButton: FloatingActionButton(
      //   tooltip: 'Go to bookmark',
      //   child: const Icon(Icons.bookmark),
      //   backgroundColor: const Color(
      //     0xffD4A373,
      //   ),
      //   onPressed: () async {
      //     fabIsClicked = true;
      //     if (await readBookmark() == true) {
      //       Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //               builder: (context) => SurahBuilder(
      //                     arabic: quran[0],
      //                     sura: bookmarkedSura - 1,
      //                     suraName: arabicName[bookmarkedSura - 1]['name'],
      //                     ayah: bookmarkedAyah,
      //                   )));
      //     }
      //   },
      // ),
      appBar: AppBar(
        title: const Text(
          "المصحف",
          // "Quran",
          style: TextStyle(
              //fontFamily: 'quran',
              ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.bookmark),
          onPressed: () async {
            fabIsClicked = true;
            if (await readBookmark() == true) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SurahBuilder(
                            arabic: quran[0],
                            sura: bookmarkedSura - 1,
                            suraName: arabicName[bookmarkedSura - 1]['name'],
                            ayah: bookmarkedAyah,
                          )));
            }
          },
        ),
      ),
      body: FutureBuilder(
        future: readJson(),
        builder: (
          BuildContext context,
          AsyncSnapshot snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              backgroundColor: Color(
                0xffFAEDCD,
              ),
              color: Color(
                0xffD4A373,
              ),
            ));
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return indexCreator(snapshot.data, context);
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
    );
  }

  Container indexCreator(quran, context) {
    return Container(
      color: const Color.fromARGB(255, 221, 250, 236),
      child: ListView(
        children: [
          for (int i = 0; i < 114; i++)
            Container(
              color: i % 2 == 0
                  ? const Color.fromARGB(255, 253, 247, 230)
                  : const Color.fromARGB(255, 253, 251, 240),
              child: TextButton(
                child: Row(
                  children: [
                    ArabicSuraNumber(i: i),
                    const SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      arabicName[i]['name'],
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.black87,
                        fontFamily: 'Tajawal',
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
                onPressed: () {
                  fabIsClicked = false;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SurahBuilder(
                              arabic: quran[0],
                              sura: i,
                              suraName: arabicName[i]['name'],
                              ayah: 0,
                            )),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
