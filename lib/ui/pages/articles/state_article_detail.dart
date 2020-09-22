import 'package:boke/locator.dart';
import 'package:boke/model/model.dart';
import 'package:boke/services/services.dart';
import 'package:loveli_core/loveli_core.dart';

class StateArticleDetail extends ViewStateModel {
  final String topicId;

  StateArticleDetail({this.topicId});

  Topic _topic;
  Topic get topic => _topic;

  final repository = locator<WebRepository>();

  Future<Topic> loadTopic() async {
    setBusy();
    try {
      _topic = await repository.topicDetail(topicId);
      setIdle();
      return _topic;
    } catch (e, s) {
      setError(e, s);
      return null;
    }
  }
}
