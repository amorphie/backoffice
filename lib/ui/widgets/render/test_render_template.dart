import 'dart:convert';

String _testRenderTemplate = """
{
    "type": "list_view",
    "args" : {
       "children": [
        {
            "type": "title_description_area_widget",
            "args": {
                "title": "ID",
                "text": "205668d7-6f4a-4a51-9f17-1592342f083c",
                "copyValue": true
            }
        },
        {
            "type": "title_description_area_widget",
            "args": {
                "title": "Reference",
                "text": "12342352432",
                "copyValue": true
            }
        },
        {
            "type": "title_description_area_widget",
            "args": {
                "title": "Phone Number",
                "text": "90 (533) 3245353",
                "copyValue": true
            }
        },
        {
            "type": "title_description_area_widget",
            "args": {
                "title": "E-mail Address",
                "text": "fbaggins@hotmail.com",
                "copyValue": true
            }
        },
        {
            "type": "title_description_area_widget",
            "args": {
                "title": "Status",
                "text": "Active",
                "copyValue": true
            }
        }
    ]
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
dynamic get testRenderTemplateData => json.decode(_testRenderTemplate);
