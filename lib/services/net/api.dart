import 'package:boke/config/config.dart';
import 'package:dio/dio.dart';
import 'package:loveli_core/loveli_core.dart';
import 'package:boke/locator.dart';

final Http http = Http();

class Http extends BaseHttp {
  @override
  void init() {
    options.baseUrl = locator<Config>().requestBaseURL;
    interceptors.add(WebApiInterceptor());
  }
}

class WebApiInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    ResponseData respData = ResponseData.fromJson(response.data);
    if (respData.success) {
      response.data = respData.data;
      return http.resolve(response);
    } else {
      throw NotSuccessException.fromRespData(respData);
    }
  }
}

class ResponseData extends BaseResponseData {
  bool get success => code == 0;

  ResponseData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'];
  }
}
