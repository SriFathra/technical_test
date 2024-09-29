class HomeState {}

class HomeInitState extends HomeState {}

class Homeloading extends HomeState {}

class ProductFetched extends HomeState {
  final List<Map<String, dynamic>> products;
  final List<Map<String, dynamic>> categories;
  final List<Map<String, dynamic>> wellnessList;

  ProductFetched(
      {required this.products,
      required this.categories,
      required this.wellnessList});
}

class HomeError extends HomeState {
  String error;
  HomeError(this.error);
}
