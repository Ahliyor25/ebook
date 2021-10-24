import 'package:epub_viewer/epub_viewer.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool loading = false;

  @override
  void initState() {
    super.initState();
//    download();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Marketing',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.transparent,
          ),
        ),
        home: Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/12.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  color: const Color(0xff000000).withOpacity(0.5),
                ),
              ),
              Center(
                child: loading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          EpubViewer.setConfig(
                            themeColor: Theme.of(context).primaryColor,
                            scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
                            allowSharing: true,
                            enableTts: true,
                          );

                          await EpubViewer.openAsset(
                            'assets/last.epub',
                          );
                        },
                        child: const Text('Шуруъ кардан'),
                      ),
              ),
            ],
          ),
        ));
  }
}
