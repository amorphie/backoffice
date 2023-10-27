import 'dart:convert';

String _testRenderTemplate = """
  
            {
                "type": "padding",
                "args": {
                    "padding": {
                        "bottom": 8,
                        "top": 5
                    }
                },
                "child": {
                    "type": "text",
                    "args": {
                        "text": "Birth Certificate",
                        "style": {
                            "fontWeight": "w400",
                            "color": "#1d1f29"
                        }
                    }
                }
            }   
""";
dynamic get testRenderTemplateData => json.decode(_testRenderTemplate);
