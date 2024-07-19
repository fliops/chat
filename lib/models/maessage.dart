class Message {
  final String message;
  final String id;

  Message(this.message, this.id);

  factory Message.fromJson(Map<String, dynamic> jsonData) {
    // Check if the 'message' key exists and is not null
    if (jsonData.containsKey('message') && jsonData['message'] != null) {
      return Message(jsonData['message'],jsonData['id']);
    } else {
      // Handle the case where 'message' is missing or null
      throw TypeError();
    }
  }
}
