String testRenderTemplateData = """
{
    "type": "neo_detail_page",
    "args": {
        "summary": {
            "type": "neo_bo_summary_widget",
            "args": {
                "name": "Test Kullanıcısı"
            }
        },
        "tabs": {
            "type": "neo_bo_tabview",
            "args": {
                "data": [
                    {
                        "title": "Tab1",
                        "view": {
                            "type": "list_view",
                            "args": {
                                "children": [
                                    {
                                        "type": "neo_bo_detail_item_widget",
                                        "args": {
                                            "title": "First Name",
                                            "text": "\$.data.firstName",
                                            "copyValue": true
                                        }
                                    },
                                    {
                                        "type": "neo_bo_detail_item_widget",
                                        "args": {
                                            "title": "Last Name",
                                            "text": "\$.data.lastName",
                                            "copyValue": true
                                        }
                                    },
                                    {
                                        "type": "neo_bo_detail_item_widget",
                                        "args": {
                                            "title": "Reference",
                                            "text": "\$.data.reference",
                                            "copyValue": true
                                        }
                                    },
                                    {
                                        "type": "neo_bo_detail_item_widget",
                                        "args": {
                                            "title": "E-Mail",
                                            "text": "\$.data.eMail",
                                            "copyValue": true
                                        }
                                    },
                                    {
                                        "type": "neo_bo_detail_item_widget",
                                        "args": {
                                            "title": "Created At",
                                            "text": "\$.createdAt",
                                            "copyValue": true
                                        }
                                    }
                                ]
                            }
                        }
                    }
                ]
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
