import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify.dart';

void getData() async {
  try {
    String graphQLDocument = '''query ListTodos {
      listTodos {
        items {
          id
          name
          description
        }
        nextToken
      }
    }''';

    var operation = Amplify.API.query(
        request: GraphQLRequest<String>(
      document: graphQLDocument,
    ));

    var response = await operation.response;
    var data = response.data;

    print('Query result: ' + data);
  } on ApiException catch (e) {
    print('Query failed: $e');
  }
}
