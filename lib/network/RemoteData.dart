import 'dart:convert';

import 'package:base_mvvmp/network/AppServices.dart';
import 'package:base_mvvmp/util/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';

import 'model/BaseResponseModel.dart';

class RemoteData{
  Map request = new Map<String, dynamic>();
  Map result = new Map();

  Future<Map> getArticles(BuildContext context, String keyword, String page, String pageSize, String idCategories, String sortBy, String orderBy) async {
    request[Constant.PARAMETER_KEYWORD] = keyword;
    request[Constant.PARAMETER_PAGE] = page;
    request[Constant.PARAMETER_PAGE_SIZE] = pageSize;
    request[Constant.PARAMETER_ID_CATEGORY] = idCategories;
    request[Constant.PARAMETER_SORT_BY] = sortBy;
    request[Constant.PARAMETER_ORDER_BY] = orderBy;
    var response = await AppServices().callApi(Constant.API_ALL_ARTICLE, Constant.METHOD_NAME_IS_POST, request);
    responseStatusCode(context, response, false);
    result = jsonDecode(response.data);
    return Future.value(result);
  }

  void responseStatusCode(BuildContext context, BaseResponseModel baseResponseModel, bool isShowAlert){
    switch(baseResponseModel.status){
      case 200:
        if(isShowAlert == true) Toast.show(baseResponseModel.message, context);
        break;
      case 201:
        Toast.show(baseResponseModel.message, context);
        break;
      case 401:
        Toast.show(baseResponseModel.message, context);
        break;
      default:
        Toast.show(baseResponseModel.message, context);
        break;
    }
  }

}