abstract class IRepository<T> {
  Future<List<T>> getItems({Map<String, dynamic> query = const {}});
}
