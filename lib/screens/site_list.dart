import 'package:autorefresh/database/moor_curd.dart';
import 'package:autorefresh/database/site_curd/site_curd.dart';
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
      body: StreamBuilder<List<Site>>(
        stream: widget.siteDao.watchSites(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active &&
              snapshot.hasData) {
            List<Site> sites = snapshot.data!;
            return ListView.builder(itemBuilder: (context, index) {
              return ListTile(
                title: Text(sites[index].title!),
                subtitle: Text(sites[index].url!),
              );
            });
          }
          return Container();
        },
      ),
    );
  }
}
