String testRenderTemplateData = """
{
    "type": "list_view",
    "args": {
        "children": [
            {
                "type":"name_template_widget",
                "args" : {
                  "name" : "Test Kullanıcısı"
                }
            },
            {
                "type": "title_description_area_widget",
                "args": {
                    "title": "Name",
                    "text": "Banking Services Contract 30-VK11-1",
                    "copyValue": true
                }
            },
            {
                "type": "title_description_area_widget",
                "args": {
                    "title": "ID",
                    "text": "14a8b2e6-c72d-403f-81e9-99b03d9919a8",
                    "copyValue": true
                }
            },
            {
                "type": "title_description_area_widget",
                "args": {
                    "title": "Status",
                    "text": "OnHold"
                }
            },
            {
                "type": "title_description_area_widget",
                "args": {
                    "title": "Base Status",
                    "text": "OnHold"
                }
            },
            {
                "type": "title_description_area_widget",
                "args": {
                    "title": "Tags",
                    "text": "  customer-info , id-card",
                    "copyValue": true
                }
            },
            {
                "type": "title_description_area_widget",
                "args": {
                    "title": "Formats",
                    "text": ""
                }
            },
            {
                "type": "title_description_area_widget",
                "args": {
                    "title": "Allowed Client Details",
                    "text": ""
                }
            },
            {
                "type": "title_description_area_widget",
                "args": {
                    "title": "Optimize Size",
                    "text": "None"
                }
            },
            {
                "type": "expansion_tile",
                "args": {
                    "title": {
                        "type": "detail_title_widget",
                        "args": {
                            "title": "Document Online Sign"
                        }
                    },
                    "children": [
                         {
                              "type": "neo_bo_webview_area_widget",
                                "args": {
                                  "name": "Webview Area"
                            }
                        },
                        {
                            "type": "title_description_area_widget",
                            "args": {
                                "title": "Document Allowed Client Detail",
                                "text": "direct-sales, mobile-ib, dealer, web-ib"
                            }
                        },
                        {
                            "type": "title_description_area_widget",
                            "args": {
                                "title": "Document Allowed Client Detail",
                                "text": "doc-bankacilik-hizmetleri-sozlesmesi-30-VK11"
                            }
                        }
                    ]
                }
            },
            {
                "type": "title_description_area_widget",
                "args": {
                    "title": "Document Allowed Client Detail",
                    "text": "direct-sales, mobile-ib, dealer, web-ib"
                }
            },
            {
                "type": "title_description_area_widget",
                "args": {
                    "title": "Document Allowed Client Detail",
                    "text": "doc-bankacilik-hizmetleri-sozlesmesi-30-VK11"
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
