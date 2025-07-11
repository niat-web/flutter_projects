// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryListHash() => r'f3be4aeb4afc3a58b28d0cd39c3a1f9fff1ff071';

/// See also [categoryList].
@ProviderFor(categoryList)
final categoryListProvider = AutoDisposeFutureProvider<List<String>>.internal(
  categoryList,
  name: r'categoryListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoryListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CategoryListRef = AutoDisposeFutureProviderRef<List<String>>;
String _$categoryProductsHash() => r'e14abfda30f8f05efabe1078c70c64224cac296f';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [categoryProducts].
@ProviderFor(categoryProducts)
const categoryProductsProvider = CategoryProductsFamily();

/// See also [categoryProducts].
class CategoryProductsFamily extends Family<AsyncValue<List<ProductModel>>> {
  /// See also [categoryProducts].
  const CategoryProductsFamily();

  /// See also [categoryProducts].
  CategoryProductsProvider call(String category) {
    return CategoryProductsProvider(category);
  }

  @override
  CategoryProductsProvider getProviderOverride(
    covariant CategoryProductsProvider provider,
  ) {
    return call(provider.category);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'categoryProductsProvider';
}

/// See also [categoryProducts].
class CategoryProductsProvider
    extends AutoDisposeFutureProvider<List<ProductModel>> {
  /// See also [categoryProducts].
  CategoryProductsProvider(String category)
    : this._internal(
        (ref) => categoryProducts(ref as CategoryProductsRef, category),
        from: categoryProductsProvider,
        name: r'categoryProductsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$categoryProductsHash,
        dependencies: CategoryProductsFamily._dependencies,
        allTransitiveDependencies:
            CategoryProductsFamily._allTransitiveDependencies,
        category: category,
      );

  CategoryProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final String category;

  @override
  Override overrideWith(
    FutureOr<List<ProductModel>> Function(CategoryProductsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CategoryProductsProvider._internal(
        (ref) => create(ref as CategoryProductsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ProductModel>> createElement() {
    return _CategoryProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryProductsProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CategoryProductsRef on AutoDisposeFutureProviderRef<List<ProductModel>> {
  /// The parameter `category` of this provider.
  String get category;
}

class _CategoryProductsProviderElement
    extends AutoDisposeFutureProviderElement<List<ProductModel>>
    with CategoryProductsRef {
  _CategoryProductsProviderElement(super.provider);

  @override
  String get category => (origin as CategoryProductsProvider).category;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
