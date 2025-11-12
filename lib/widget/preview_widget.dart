import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:tmdb_flutter/widget/button_app.dart';
import 'package:tmdb_flutter/widget/section_title.dart';

@Preview(name: "Button App Preview")
Widget buttonAppPreview() {
  return ButtonApp(
    buttonText: "Click Me",
    onPressed: () {
      // Preview action
    },
  );
}

@Preview(name: "Section Title Preview")
Widget sectionTitlePreview() {
  return SectionTitle(title: "Sample Section");
}


