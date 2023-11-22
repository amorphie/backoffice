import 'dart:convert';

String testRenderTemplateData = """
{
    "type": "padding",
    "args": {
        "padding": 10,
        "child": {
            "type": "form",
            "args": {
                "child": {
                    "type": "column",
                    "args": {
                        "mainAxisSize": "min",
                        "children": [
                            {
                                "type": "save_context",
                                "args": {
                                    "key": "form_context"
                                }
                            },
                            {
                                "type": "sized_box",
                                "args": {
                                    "height": 16
                                }
                            },
                            {
                                "type": "text_form_field",
                                "id": "old_password",
                                "args": {
                                    "decoration": {
                                        "hintText": "Old Password",
                                        "labelText": "Old Password"
                                    },
                                    "validators": [
                                        {
                                            "type": "required"
                                        }
                                    ]
                                }
                            }
                        ]
                    }
                }
            }
        }
    }
}
""";
// String _testRenderTemplate = """
// {
//     "type": "title_description_area_widget",
//     "args": {
//         "title": "Title",
//         "text": "text",
//         "copyValue": true
//     }
// }
// """;
// dynamic get testRenderTemplateData => json.decode(testRenderTemplate);
