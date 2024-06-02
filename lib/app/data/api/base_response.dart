import 'package:get/get.dart';



abstract class BaseResponse {
  BaseResponse._();
 static bool handleApiResponse(Response response) {
    if (response.statusCode == 200) {
      final responseData = response.body;
      // Process responseData here
      return true; // Successful response
    } else {
      print('Error: ${response.statusCode}');
      print('Error Body: ${response.body}');
      // You can show a snackbar or dialog with error message to the user
      return false; // Unsuccessful response
    }
  }
}