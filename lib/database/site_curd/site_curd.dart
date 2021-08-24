import 'package:autorefresh/model/site_model.dart';
import 'package:moor_flutter/moor_flutter.dart';

import '../moor_curd.dart';

part 'site_curd.g.dart';

@UseDao(
  tables: [Sites],
)
class SitesDao extends DatabaseAccessor<AppDatabase> with _$SitesDaoMixin {
  final AppDatabase db;
  SitesDao(this.db) : super(db);
  Future updateSite(Site site) => update(sites).replace(site);
  Future insertSite(Site site) => into(sites).insert(site);
  Future deleteSite(Site site) => delete(sites).delete(site);
  Future deleteAllSite() => delete(sites).go();

  Stream<List<Site>> watchSites() {
    return (select(db.sites).watch());
  }

  Future<Site> getSingleSite() {
    return (select(db.sites).getSingle());
  }
}
