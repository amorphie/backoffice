String testRenderTemplateData = """
{
  "type": "neo_detail_page",
  "args": {
    "summary": {
      "type": "neo_bo_summary_widget",
      "args": {
        "name": "Resource"
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
                    "type": "neo_bo_datagrid_widget",
                    "args": {
                      "title": "Flows",
                      "columns":
                        {
                          "type": "Type",
                          "workflow": "Workflow",
                          "tokenDuration": "Token Duration"
                        },
                      "data": "\$.data.flows"
                    }
                  },
                  {
                    "type": "neo_bo_expanded_row_widget",
                    "args": {
                      "data": [
                        "type",
                        "workflow",
                        "tokenDuration"
                      ]
                    }
                  },
                  {
                    "type": "neo_bo_detail_item_widget",
                    "args": {
                      "title": "Created At",
                      "text": "\$.createdAt",
                      "copyValue": true
                    }
                  },
                  {
                    "type": "neo_bo_detail_item_widget",
                    "args": {
                      "title": "Status",
                      "text": "\$.data.status",
                      "copyValue": true
                    }
                  },
                  {
                    "type": "neo_bo_detail_item_widget",
                    "args": {
                      "title": "Return URL",
                      "text": "\$.data.returnUrl",
                      "copyValue": true
                    }
                  },
                  {
                    "type": "neo_bo_detail_item_widget",
                    "args": {
                      "title": "Login URL",
                      "text": "\$.data.loginUrl",
                      "copyValue": true
                    }
                  },
                  {
                    "type": "neo_bo_detail_item_widget",
                    "args": {
                      "title": "Logout URL",
                      "text": "\$.data.logoutUrl",
                      "copyValue": true
                    }
                  },
                  {
                    "type": "neo_bo_detail_item_widget",
                    "args": {
                      "title": "Pkce",
                      "text": "\$.data.pkce",
                      "copyValue": true
                    }
                  },
                  {
                    "type": "neo_bo_detail_item_widget",
                    "args": {
                      "title": "Description",
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
