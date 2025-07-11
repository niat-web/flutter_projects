// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$detailProviderHash() => r'a5f32a49b6792e897d59d840454571c87b97633d';

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

/// See also [detailProvider].
@ProviderFor(detailProvider)
const detailProviderProvider = DetailProviderFamily();

/// See also [detailProvider].
class DetailProviderFamily extends Family<AsyncValue<ProductModel>> {
  /// See also [detailProvider].
  const DetailProviderFamily();

  /// See also [detailProvider].
  DetailProviderProvider call(String id) {
    return DetailProviderProvider(id);
  }

  @override
  DetailProviderProvider getProviderOverride(
    covariant DetailProviderProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'detailProviderProvider';
}

/// See also [detailProvider].
class DetailProviderProvider extends AutoDisposeFutureProvider<ProductModel> {
  /// See also [detailProvider].
  DetailProviderProvider(String id)
    : this._internal(
        (ref) => detailProvider(ref as DetailProviderRef, id),
        from: detailProviderProvider,
        name: r'detailProviderProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$detailProviderHash,
        dependencies: DetailProviderFamily._dependencies,
        allTransitiveDependencies:
            DetailProviderFamily._allTransitiveDependencies,
        id: id,
      );

  DetailProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<ProductModel> Function(DetailProviderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DetailProviderProvider._internal(
        (ref) => create(ref as DetailProviderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ProductModel> createElement() {
    return _DetailProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DetailProviderProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DetailProviderRef on AutoDisposeFutureProviderRef<ProductModel> {
  /// The parameter `id` of this provider.
  String get id;
}

class _DetailProviderProviderElement
    extends AutoDisposeFutureProviderElement<ProductModel>
    with DetailProviderRef {
  _DetailProviderProviderElement(super.provider);

  @override
  String get id => (origin as DetailProviderProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
