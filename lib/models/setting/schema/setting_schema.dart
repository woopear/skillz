class SettingSchema {
  String? id;
  bool build;
  bool wait;

  SettingSchema({
    this.id,
    this.build = false,
    this.wait = false,
  });

  factory SettingSchema.fromMap(Map<String, dynamic> data, documentId) {
    bool build = data['build'];
    bool wait = data['wait'];

    return SettingSchema(id: documentId, build: build, wait: wait);
  }

  Map<String, dynamic> toMap() {
    return {
      'build': build,
      'wait': wait,
    };
  }
}
