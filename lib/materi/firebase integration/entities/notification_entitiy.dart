class NotificationEntity {
  String title;
  String body;
  String? image;
  String priority;
  String clickAction;

  NotificationEntity({
    required this.title,
    required this.body,
    this.image,
    required this.priority,
    required this.clickAction,
  });

  factory NotificationEntity.fromJson(Map<String, dynamic> json) {
    return NotificationEntity(
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      image: json['image'] ?? '',
      priority: json['priority'] ?? '',
      clickAction: json['click_action'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'image': image,
      'priority': priority,
      'click_action': clickAction,
    };
  }
}
