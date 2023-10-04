import 'dart:convert';

String _testRenderTemplate = """
{
  "type": "rich_text",
  "args": {
    "text": {
      "children": [
        {
          "text": "Deneme "
        },
        {
          "style": {
            "fontSize": 20.0,
            "fontWeight": "bold"
          },
          "text": "Render "
        },
        {
          "text": " Widget"
        }
      ],
      "style": {
        "color": "#000000",
        "fontSize": 12.0
      }
    }
  }
}
""";
dynamic get testRenderTemplateData => json.decode(_testRenderTemplate);
