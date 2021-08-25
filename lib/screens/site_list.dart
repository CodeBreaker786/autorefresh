import 'package:autorefresh/browser/webview_screen.dart';
import 'package:autorefresh/database/moor_curd.dart';
import 'package:autorefresh/database/site_curd/site_curd.dart';
import 'package:autorefresh/screens/reload_duration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SiteListScreen extends StatefulWidget {
  var db;
  late SitesDao siteDao;
  SiteListScreen({Key? key}) : super(key: key) {
    db = AppDatabase();
    siteDao = SitesDao(db);
  }
  @override
  _SiteListScreenState createState() => _SiteListScreenState();
}

class _SiteListScreenState extends State<SiteListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Your Sites",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: StreamBuilder<List<Site>>(
        stream: widget.siteDao.watchSites(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active &&
              snapshot.hasData) {
            List<Site> sites = snapshot.data!;
            if (sites.isNotEmpty) {
              return ListView.separated(
                itemCount: sites.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(sites[index].title!,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500)),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          children: [
                            Text("Total reload :",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                            Text(sites[index].totalReloadCount.toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green)),
                          ],
                        ),
                      ),
                      trailing: Container(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              )),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green)),
                          onPressed: () async {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => WebViewScreen(
                                          site: sites[index],
                                        )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Start Reloading",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Divider(
                      thickness: 1,
                    ),
                  );
                },
              );
            } else {
              return Container();
            }
          }
          return Center(
            child: CupertinoActivityIndicator(
              radius: 20,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, CupertinoPageRoute(builder: (context) => HomePage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
