import 'package:tektok/app/utils/common/logger_util.dart';
import 'package:tektok/app/utils/constant/filter_constant.dart';
import 'package:tektok/data/models/common/filter_model.dart';

class ApiFilterUtil {
  FilterQuery? addSearch(column, operator, value) {
    try {
      if (value == null) return null;
      return FilterQuery(
        field: column,
        operator: operator,
        value: value,
      );
    } catch (e) {
      logger.safeLog(e);
      return null;
    }
  }

  String? buildQuery({List<FilterQuery>? data, Map<String, dynamic>? params}) {
    String queryString = '';
    if (data != null && data.isNotEmpty) {
      var i = 0;
      for (var filter in data) {
        if (filter == null) continue;
        var comma = i > 0 ? "," : "";
        if (OPERATOR_CONSTANTS.LIKE == filter.operator) {
          queryString += '$comma${filter.field}=%${filter.value}%';
        } else {
          if (filter.value is List) {
            if (filter.value.length == 0) continue;
            var value = Uri.encodeComponent(
                '[${buildQuery(data: filter.group, params: null)}]');
            queryString += '$comma${filter.field}${filter.operator}$value';
          } else {
            queryString +=
                '$comma${filter.field}${filter.operator}${filter.value}';
          }
        }

        if (filter.operator2 != null) {
          queryString += ":${filter.operator2!}";
        }

        i++;
      }

      if (queryString == "") return null;

      if (params != null) {
        params["filter"] = queryString;
      }
    }
    return queryString;
  }
}

ApiFilterUtil apiFilterUtil = ApiFilterUtil();
