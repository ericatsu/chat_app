class Conversation {
  String? currentUrl;
  String? message;
  List<Data>? data;
  String? status;

  Conversation({this.currentUrl, this.message, this.data, this.status});

  Conversation.fromJson(Map<String, dynamic> json) {
    currentUrl = json['currentUrl'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['currentUrl'] = currentUrl;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class Data {
  int? id;
  String? lastMessage;
  List<String>? members;
  String? topic;
  int? modifiedAt;

  Data({this.id, this.lastMessage, this.members, this.topic, this.modifiedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lastMessage = json['last_message'];
    members = json['members'].cast<String>();
    topic = json['topic'];
    modifiedAt = json['modified_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['last_message'] = lastMessage;
    data['members'] = members;
    data['topic'] = topic;
    data['modified_at'] = modifiedAt;
    return data;
  }
}

class Message {
  int? id;
  int? chatId;
  String? sender;
  String? message;
  int? modifiedAt;

  Message({this.id, this.chatId, this.sender, this.message, this.modifiedAt});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chatId = json['chat_id'];
    sender = json['sender'];
    message = json['message'];
    modifiedAt = json['modified_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['chat_id'] = chatId;
    data['sender'] = sender;
    data['message'] = message;
    data['modified_at'] = modifiedAt;
    return data;
  }
}
