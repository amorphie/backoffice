String testRenderTemplateData = """
{
  "type": "neo_detail_page",
  "args": {
    "summary": {
      "type": "neo_bo_summary_widget",
      "args": {
        "name": "Role"
      }
    },
    "tabs": {
      "type": "neo_bo_tabview",
      "args": {
        "data": [
          {
            "title": "Details",
            "view": {
              "type": "list_view",
              "args": {
                "children": [
                  {
                    "type": "neo_bo_detail_item_widget",
                    "args": {
                      "title": "Tags",
                      "text": "\$.data.tags",
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
