// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_and_currency.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetBankAndCurrencyCollection on Isar {
  IsarCollection<BankAndCurrency> get bankAndCurrencys => this.collection();
}

const BankAndCurrencySchema = CollectionSchema(
  name: r'BankAndCurrency',
  id: -7250739078118393372,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'updatedAt': PropertySchema(
      id: 1,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _bankAndCurrencyEstimateSize,
  serialize: _bankAndCurrencySerialize,
  deserialize: _bankAndCurrencyDeserialize,
  deserializeProp: _bankAndCurrencyDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'bank': LinkSchema(
      id: 2079710289004240724,
      name: r'bank',
      target: r'Bank',
      single: true,
      linkName: r'bankAndCurrencies',
    ),
    r'currency': LinkSchema(
      id: 7324858928343914278,
      name: r'currency',
      target: r'Currency',
      single: true,
      linkName: r'banksAndCurrency',
    )
  },
  embeddedSchemas: {},
  getId: _bankAndCurrencyGetId,
  getLinks: _bankAndCurrencyGetLinks,
  attach: _bankAndCurrencyAttach,
  version: '3.0.5',
);

int _bankAndCurrencyEstimateSize(
  BankAndCurrency object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _bankAndCurrencySerialize(
  BankAndCurrency object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeDateTime(offsets[1], object.updatedAt);
}

BankAndCurrency _bankAndCurrencyDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BankAndCurrency(
    createdAt: reader.readDateTime(offsets[0]),
    updatedAt: reader.readDateTime(offsets[1]),
  );
  object.id = id;
  return object;
}

P _bankAndCurrencyDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bankAndCurrencyGetId(BankAndCurrency object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bankAndCurrencyGetLinks(BankAndCurrency object) {
  return [object.bank, object.currency];
}

void _bankAndCurrencyAttach(
    IsarCollection<dynamic> col, Id id, BankAndCurrency object) {
  object.id = id;
  object.bank.attach(col, col.isar.collection<Bank>(), r'bank', id);
  object.currency.attach(col, col.isar.collection<Currency>(), r'currency', id);
}

extension BankAndCurrencyQueryWhereSort
    on QueryBuilder<BankAndCurrency, BankAndCurrency, QWhere> {
  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BankAndCurrencyQueryWhere
    on QueryBuilder<BankAndCurrency, BankAndCurrency, QWhereClause> {
  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BankAndCurrencyQueryFilter
    on QueryBuilder<BankAndCurrency, BankAndCurrency, QFilterCondition> {
  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BankAndCurrencyQueryObject
    on QueryBuilder<BankAndCurrency, BankAndCurrency, QFilterCondition> {}

extension BankAndCurrencyQueryLinks
    on QueryBuilder<BankAndCurrency, BankAndCurrency, QFilterCondition> {
  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterFilterCondition> bank(
      FilterQuery<Bank> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'bank');
    });
  }

  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterFilterCondition>
      bankIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'bank', 0, true, 0, true);
    });
  }

  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterFilterCondition>
      currency(FilterQuery<Currency> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'currency');
    });
  }

  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterFilterCondition>
      currencyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'currency', 0, true, 0, true);
    });
  }
}

extension BankAndCurrencyQuerySortBy
    on QueryBuilder<BankAndCurrency, BankAndCurrency, QSortBy> {
  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension BankAndCurrencyQuerySortThenBy
    on QueryBuilder<BankAndCurrency, BankAndCurrency, QSortThenBy> {
  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BankAndCurrency, BankAndCurrency, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension BankAndCurrencyQueryWhereDistinct
    on QueryBuilder<BankAndCurrency, BankAndCurrency, QDistinct> {
  QueryBuilder<BankAndCurrency, BankAndCurrency, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<BankAndCurrency, BankAndCurrency, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension BankAndCurrencyQueryProperty
    on QueryBuilder<BankAndCurrency, BankAndCurrency, QQueryProperty> {
  QueryBuilder<BankAndCurrency, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BankAndCurrency, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<BankAndCurrency, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
