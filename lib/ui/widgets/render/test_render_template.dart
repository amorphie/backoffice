import 'dart:convert';

String _testRenderTemplate = """
{
    "type": "title_description_area_widget",
    "args": {
        "title": "Title",
        "text": "text",
        "copyValue": true
    }
} 
""";
dynamic get testRenderTemplateData => json.decode(_testRenderTemplate);
