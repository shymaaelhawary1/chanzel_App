part of 'favourite_cubit.dart';

@immutable
abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class FavouriteLoadSuccess extends FavouriteState {
  final List<Product> favoriteProducts;

  FavouriteLoadSuccess(this.favoriteProducts);
}

class FavouriteAddSuccess extends FavouriteState {
  final Product addedProduct;

  FavouriteAddSuccess(this.addedProduct);
}

class FavouriteRemoveSuccess extends FavouriteState {
  final Product removedProduct;

  FavouriteRemoveSuccess(this.removedProduct);
}

class FavouriteError extends FavouriteState {
  final String message;

  FavouriteError(this.message);
}
