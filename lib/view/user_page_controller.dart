
import 'package:diginav/model/user.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class UserPageController {

  static PagingController<int, User> getPagingController(int firstPageKey) {
      final _pagingController = PagingController<int, User>(firstPageKey: firstPageKey,);
      return _pagingController;
    }
  Future<void> _fetchPage(int pageKey) async {
  }

}
