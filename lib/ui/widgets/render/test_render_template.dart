import 'dart:convert';

String testRenderTemplateData = """
{
    "type": "list_view",
    "args": {
        "children": [
            {
                "type": "title_description_area_widget",
                "args": {
                    "title": "ID",
                    "text": "{{data.id}}",
                    "copyValue": true
                }
            },
            {
                "type": "title_description_area_widget",
                "args": {
                    "title": "Name",
                    "text": "{{data.name}}",
                    "copyValue": true
                }
            },
            {
                "type": "title_description_area_widget",
                "args": {
                    "title": "Login Url",
                    "text": "{{data.loginUrl}}",
                    "copyValue": true
                }
            },
            {
                "type": "title_description_area_widget",
                "args": {
                    "title": "Return Url",
                    "text": "{{data.returnUrl}}",
                    "copyValue": true
                }
            },
            {
                "type": "title_description_area_widget",
                "args": {
                    "title": "Logout Url",
                    "text": "{{data.logoutUrl}}",
                    "copyValue": true
                }
            },
            {
                "type": "title_description_area_widget",
                "args": {
                    "title": "Client Secret",
                    "text": "{{data.clientSecret}}",
                    "copyValue": true
                }
            },
            {
                "type": "title_description_area_widget",
                "args": {
                    "title": "Pkce",
                    "text": "{{data.pkce}}",
                    "copyValue": true
                }
            },
            {
                "type": "title_description_area_widget",
                "args": {
                    "title": "Allowed Grant Types",
                    "text": "{{comma=null}}{{for tag in data.allowedGrantTypes}}{{if comma}}, {{end}}{{tag.grantType}}{{comma=1}}{{end}}",
                    "copyValue": true
                }
            },
            {
                "type": "title_description_area_widget",
                "args": {
                    "title": "Allowed Scope Types",
                    "text": "{{comma=null}}{{for type in data.allowedScopeTags}}{{if comma}}, {{end}}{{type}}{{comma=1}}{{end}}",
                    "copyValue": true
                }
            },
            {
                "type": "detail_title_widget",
                "args": {
                    "title": "Flows"
                }
            },
            {
                "type": "expanded_row_area_widget",
                "args": {
                    "data": [
                        "Type",
                        "Workflow",
                        "Token",
                        "Token Duration"
                    ],
                    "isTitle": true
                }
            },
            {
                "type": "expanded_row_area_widget",
                "args": {
                    "data": [
                        "{{flow.type}}",
                        "{{flow.workflow}}",
                        "{{flow.token}}",
                        "{{flow.tokenDuration}}"
                    ]
                }
            },
            {
                "type": "detail_title_widget",
                "args": {
                    "title": "Tokens"
                }
            },
            {
                "type": "expanded_row_area_widget",
                "args": {
                    "data": [
                        "Type",
                        "Duration",
                        "Claims"
                    ],
                    "isTitle": true
                }
            },
            {
                "type": "expanded_row_area_widget",
                "args": {
                    "data": [
                        "{{token.type}}",
                        "{{token.duration}}",
                        "{{token.claims}}"
                    ]
                }
            },
            {
                "type": "sized_box",
                "args": {
                    "height": 2
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
// dynamic get testRenderTemplateData => json.decode(testRenderTemplate);
