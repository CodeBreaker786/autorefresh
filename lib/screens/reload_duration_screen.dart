import 'package:autorefresh/database/moor_curd.dart';
import 'package:autorefresh/database/site_curd/site_curd.dart';
import 'package:autorefresh/loading_utils.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class HomePage extends StatefulWidget {
  var db;
  late SitesDao siteDao;
  HomePage({Key? key}) : super(key: key) {
    db = AppDatabase();
    siteDao = SitesDao(db);
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController siteNameController = TextEditingController();
  TextEditingController siteURLController = TextEditingController();
  Duration _duration = Duration(seconds: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Configurations",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Theme(
                  data: ThemeData(
                      primaryColor: Colors.green, accentColor: Colors.green),
                  child: DurationPicker(
                      duration: _duration,
                      snapToMins: 1,
                      onChange: (duration) {
                        setState(
                          () {
                            _duration = duration;
                          },
                        );
                      })),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Theme(
                        data: ThemeData(
                            inputDecorationTheme: InputDecorationTheme(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.5),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 1.5),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                prefixStyle: TextStyle(color: Colors.white)),
                            primaryColor: Colors.green,
                            accentColor: Colors.green),
                        child: Column(
                          children: [
                            TextField(
                              controller: siteNameController,
                              decoration:
                                  InputDecoration(hintText: "ENTER SITE NAME"),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: TextField(
                                controller: siteURLController,
                                decoration:
                                    InputDecoration(hintText: "ENTER SITE URL"),
                              ),
                            ),
                          ],
                        )),
                    Center(
                      child: Text(
                        "Your Site will Reload Radomaly with in Time Range ${_duration.inHours}:${_duration.inMinutes % 60} ",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 24),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0).copyWith(bottom: 30),
                      child: Container(
                        height: 60,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              )),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green)),
                          onPressed: () async {
                            showLoaging();

                            await widget.siteDao
                                .insertSite(Site(
                                    title: siteNameController.text,
                                    url: siteURLController.text,
                                    hours: _duration.inHours,
                                    totalReloadCount: 0,
                                    mintue: _duration.inMinutes % 60))
                                .whenComplete(() async {
                              await EasyLoading.dismiss();
                              Navigator.pop(context);
                            });
                          },
                          child: Text(
                            "Done",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
