import 'package:bloc/bloc.dart';
import 'package:chanzel_app/ProductS.dart';
import 'package:meta/meta.dart';
import 'package:hive/hive.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial()) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    try {
      final box = Hive.box('favorites'); 
      final List<Product> favoriteProducts = List<Product>.from(
        box.get('favoritesList', defaultValue: []) ?? [],
      );
      emit(FavouriteLoadSuccess(favoriteProducts));
    } catch (e) {
      emit(FavouriteError('Failed to load favorites'));
    }
  }

  Future<void> addFavorite(Product product) async {
    try {
      final box = Hive.box('favorites'); 
      final List<Product> favoriteProducts = List<Product>.from(
        box.get('favoritesList', defaultValue: []) ?? [],
      );
      favoriteProducts.add(product);
      box.put('favoritesList', favoriteProducts);
      emit(FavouriteAddSuccess(product));
    } catch (e) {
      emit(FavouriteError('Failed to add favorite'));
    }
  }

  Future<void> removeFavorite(Product product) async {
    try {
      final box = Hive.box('favorites');
      final List<Product> favoriteProducts = List<Product>.from(
        box.get('favoritesList', defaultValue: []) ?? [],
      );
      favoriteProducts.remove(product);
      box.put('favoritesList', favoriteProducts);
      emit(FavouriteRemoveSuccess(product));
    } catch (e) {
      emit(FavouriteError('Failed to remove favorite'));
    }
  }
}
