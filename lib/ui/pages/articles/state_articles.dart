import 'package:boke/locator.dart';
import 'package:boke/model/model.dart';
import 'package:boke/services/services.dart';
import 'package:loveli_core/loveli_core.dart';

class StateArticles extends ViewStateRefreshListModel {
  WebRepository repository = locator<WebRepository>();

  final String subjectId;
  StateArticles(this.subjectId);

  List<Topic> _news;
  List<Topic> get news => _news;

  @override
  Future<List> loadData({int pageNum}) async {
    final ModelPage<Topic> res =
        await repository.subjectTopics(subjectId, page: pageNum, per: ViewStateRefreshListModel.pageSize);
    return res.items;
  }

  @override
  onCompleted(List data) {
    return super.onCompleted(data);
  }
}
