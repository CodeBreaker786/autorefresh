// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_curd.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Site extends DataClass implements Insertable<Site> {
  final int? id;
  final String? title;
  final String? url;
  final int? reloadCount;
  final int? totalReloadCount;
  final int? hours;
  final int? mintue;
  Site(
      {this.id,
      this.title,
      this.url,
      this.reloadCount,
      this.totalReloadCount,
      this.hours,
      this.mintue});
  factory Site.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Site(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title']),
      url: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}url']),
      reloadCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}reload_count']),
      totalReloadCount: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}total_reload_count']),
      hours: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}hours']),
      mintue: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}mintue']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String?>(title);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String?>(url);
    }
    if (!nullToAbsent || reloadCount != null) {
      map['reload_count'] = Variable<int?>(reloadCount);
    }
    if (!nullToAbsent || totalReloadCount != null) {
      map['total_reload_count'] = Variable<int?>(totalReloadCount);
    }
    if (!nullToAbsent || hours != null) {
      map['hours'] = Variable<int?>(hours);
    }
    if (!nullToAbsent || mintue != null) {
      map['mintue'] = Variable<int?>(mintue);
    }
    return map;
  }

  SitesCompanion toCompanion(bool nullToAbsent) {
    return SitesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      reloadCount: reloadCount == null && nullToAbsent
          ? const Value.absent()
          : Value(reloadCount),
      totalReloadCount: totalReloadCount == null && nullToAbsent
          ? const Value.absent()
          : Value(totalReloadCount),
      hours:
          hours == null && nullToAbsent ? const Value.absent() : Value(hours),
      mintue:
          mintue == null && nullToAbsent ? const Value.absent() : Value(mintue),
    );
  }

  factory Site.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Site(
      id: serializer.fromJson<int?>(json['id']),
      title: serializer.fromJson<String?>(json['title']),
      url: serializer.fromJson<String?>(json['url']),
      reloadCount: serializer.fromJson<int?>(json['reloadCount']),
      totalReloadCount: serializer.fromJson<int?>(json['totalReloadCount']),
      hours: serializer.fromJson<int?>(json['hours']),
      mintue: serializer.fromJson<int?>(json['mintue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'title': serializer.toJson<String?>(title),
      'url': serializer.toJson<String?>(url),
      'reloadCount': serializer.toJson<int?>(reloadCount),
      'totalReloadCount': serializer.toJson<int?>(totalReloadCount),
      'hours': serializer.toJson<int?>(hours),
      'mintue': serializer.toJson<int?>(mintue),
    };
  }

  Site copyWith(
          {int? id,
          String? title,
          String? url,
          int? reloadCount,
          int? totalReloadCount,
          int? hours,
          int? mintue}) =>
      Site(
        id: id ?? this.id,
        title: title ?? this.title,
        url: url ?? this.url,
        reloadCount: reloadCount ?? this.reloadCount,
        totalReloadCount: totalReloadCount ?? this.totalReloadCount,
        hours: hours ?? this.hours,
        mintue: mintue ?? this.mintue,
      );
  @override
  String toString() {
    return (StringBuffer('Site(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('reloadCount: $reloadCount, ')
          ..write('totalReloadCount: $totalReloadCount, ')
          ..write('hours: $hours, ')
          ..write('mintue: $mintue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              url.hashCode,
              $mrjc(
                  reloadCount.hashCode,
                  $mrjc(totalReloadCount.hashCode,
                      $mrjc(hours.hashCode, mintue.hashCode)))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Site &&
          other.id == this.id &&
          other.title == this.title &&
          other.url == this.url &&
          other.reloadCount == this.reloadCount &&
          other.totalReloadCount == this.totalReloadCount &&
          other.hours == this.hours &&
          other.mintue == this.mintue);
}

class SitesCompanion extends UpdateCompanion<Site> {
  final Value<int?> id;
  final Value<String?> title;
  final Value<String?> url;
  final Value<int?> reloadCount;
  final Value<int?> totalReloadCount;
  final Value<int?> hours;
  final Value<int?> mintue;
  const SitesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.url = const Value.absent(),
    this.reloadCount = const Value.absent(),
    this.totalReloadCount = const Value.absent(),
    this.hours = const Value.absent(),
    this.mintue = const Value.absent(),
  });
  SitesCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.url = const Value.absent(),
    this.reloadCount = const Value.absent(),
    this.totalReloadCount = const Value.absent(),
    this.hours = const Value.absent(),
    this.mintue = const Value.absent(),
  });
  static Insertable<Site> custom({
    Expression<int?>? id,
    Expression<String?>? title,
    Expression<String?>? url,
    Expression<int?>? reloadCount,
    Expression<int?>? totalReloadCount,
    Expression<int?>? hours,
    Expression<int?>? mintue,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (url != null) 'url': url,
      if (reloadCount != null) 'reload_count': reloadCount,
      if (totalReloadCount != null) 'total_reload_count': totalReloadCount,
      if (hours != null) 'hours': hours,
      if (mintue != null) 'mintue': mintue,
    });
  }

  SitesCompanion copyWith(
      {Value<int?>? id,
      Value<String?>? title,
      Value<String?>? url,
      Value<int?>? reloadCount,
      Value<int?>? totalReloadCount,
      Value<int?>? hours,
      Value<int?>? mintue}) {
    return SitesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      reloadCount: reloadCount ?? this.reloadCount,
      totalReloadCount: totalReloadCount ?? this.totalReloadCount,
      hours: hours ?? this.hours,
      mintue: mintue ?? this.mintue,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String?>(title.value);
    }
    if (url.present) {
      map['url'] = Variable<String?>(url.value);
    }
    if (reloadCount.present) {
      map['reload_count'] = Variable<int?>(reloadCount.value);
    }
    if (totalReloadCount.present) {
      map['total_reload_count'] = Variable<int?>(totalReloadCount.value);
    }
    if (hours.present) {
      map['hours'] = Variable<int?>(hours.value);
    }
    if (mintue.present) {
      map['mintue'] = Variable<int?>(mintue.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SitesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('reloadCount: $reloadCount, ')
          ..write('totalReloadCount: $totalReloadCount, ')
          ..write('hours: $hours, ')
          ..write('mintue: $mintue')
          ..write(')'))
        .toString();
  }
}

class $SitesTable extends Sites with TableInfo<$SitesTable, Site> {
  final GeneratedDatabase _db;
  final String? _alias;
  $SitesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _urlMeta = const VerificationMeta('url');
  late final GeneratedColumn<String?> url = GeneratedColumn<String?>(
      'url', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _reloadCountMeta =
      const VerificationMeta('reloadCount');
  late final GeneratedColumn<int?> reloadCount = GeneratedColumn<int?>(
      'reload_count', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _totalReloadCountMeta =
      const VerificationMeta('totalReloadCount');
  late final GeneratedColumn<int?> totalReloadCount = GeneratedColumn<int?>(
      'total_reload_count', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _hoursMeta = const VerificationMeta('hours');
  late final GeneratedColumn<int?> hours = GeneratedColumn<int?>(
      'hours', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _mintueMeta = const VerificationMeta('mintue');
  late final GeneratedColumn<int?> mintue = GeneratedColumn<int?>(
      'mintue', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, url, reloadCount, totalReloadCount, hours, mintue];
  @override
  String get aliasedName => _alias ?? 'sites';
  @override
  String get actualTableName => 'sites';
  @override
  VerificationContext validateIntegrity(Insertable<Site> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    }
    if (data.containsKey('reload_count')) {
      context.handle(
          _reloadCountMeta,
          reloadCount.isAcceptableOrUnknown(
              data['reload_count']!, _reloadCountMeta));
    }
    if (data.containsKey('total_reload_count')) {
      context.handle(
          _totalReloadCountMeta,
          totalReloadCount.isAcceptableOrUnknown(
              data['total_reload_count']!, _totalReloadCountMeta));
    }
    if (data.containsKey('hours')) {
      context.handle(
          _hoursMeta, hours.isAcceptableOrUnknown(data['hours']!, _hoursMeta));
    }
    if (data.containsKey('mintue')) {
      context.handle(_mintueMeta,
          mintue.isAcceptableOrUnknown(data['mintue']!, _mintueMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Site map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Site.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $SitesTable createAlias(String alias) {
    return $SitesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $SitesTable sites = $SitesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [sites];
}
