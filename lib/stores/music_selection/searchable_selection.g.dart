// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searchable_selection.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchableSelectionStore<T> on _SearchableSelectionStore<T>, Store {
  Computed<List<String>>? _$filteredIdsComputed;

  @override
  List<String> get filteredIds =>
      (_$filteredIdsComputed ??= Computed<List<String>>(() => super.filteredIds,
              name: '_SearchableSelectionStore.filteredIds'))
          .value;

  final _$itemSelectedAtom =
      Atom(name: '_SearchableSelectionStore.itemSelected');

  @override
  ObservableMap<String, bool> get itemSelected {
    _$itemSelectedAtom.reportRead();
    return super.itemSelected;
  }

  @override
  set itemSelected(ObservableMap<String, bool> value) {
    _$itemSelectedAtom.reportWrite(value, super.itemSelected, () {
      super.itemSelected = value;
    });
  }

  final _$currentSearchAtom =
      Atom(name: '_SearchableSelectionStore.currentSearch');

  @override
  String get currentSearch {
    _$currentSearchAtom.reportRead();
    return super.currentSearch;
  }

  @override
  set currentSearch(String value) {
    _$currentSearchAtom.reportWrite(value, super.currentSearch, () {
      super.currentSearch = value;
    });
  }

  final _$_SearchableSelectionStoreActionController =
      ActionController(name: '_SearchableSelectionStore');

  @override
  dynamic clearSearch() {
    final _$actionInfo = _$_SearchableSelectionStoreActionController
        .startAction(name: '_SearchableSelectionStore.clearSearch');
    try {
      return super.clearSearch();
    } finally {
      _$_SearchableSelectionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itemSelected: ${itemSelected},
currentSearch: ${currentSearch},
filteredIds: ${filteredIds}
    ''';
  }
}
