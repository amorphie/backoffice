var w = """
{
        "type": "list_view",
        "children": [
            {
                "type": "text",
                "args": {
                    "text": "Name",
                    "style": {
                        "fontWeight": "bold",
                        "color": "#1d1f29"
                    }
                }
            },
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
                        "text": "{{for lang in data.documentDefinitionLanguageDetails}}{{if lang.multiLanguage.languageType.code=='en-EN'}} {{lang.multiLanguage.name}}{{end}}{{end}}",
                        "style": {
                            "fontWeight": "w400",
                            "color": "#1d1f29"
                        }
                    }
                }
            },
            
            {{for item in [{"name": "ID","text": data.id},{"name": "Created At","text": data.createdAt},{"name": "Status","text": data.status.code},{"name": "Base Status","text": data.baseStatus.code}]}}

            {
                "type": "text",
                "args": {
                    "text": "{{item.name}}",
                    "style": {
                        "fontWeight": "bold",
                        "color": "#1d1f29"
                    }
                }
            },
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
                        "text": "{{item.text}}",
                        "style": {
                            "fontWeight": "w400",
                            "color": "#1d1f29"
                        }
                    }
                }
            },
            {{end}}
            {
                "type": "text",
                "args": {
                    "text": "Tags",
                    "style": {
                        "fontWeight": "bold",
                        "color": "#1d1f29"
                    }
                }
            },
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
                        "text": "{{comma=null}}{{for tag in data.documentTagsDetails}} {{if comma}},{{end}} {{tag.tags.code}}{{comma=1}}{{end}}",
                        "style": {
                            "fontWeight": "w400",
                            "color": "#1d1f29"
                        }
                    }
                }
            },
            {
                "type": "text",
                "args": {
                    "text": "Document Operations",
                    "style": {
                        "fontWeight": "bold",
                        "color": "#1d1f29"
                    }
                }
            },
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
                        "text": "{{if data.documentOperations.documentManuelControl}}OK{{else}}None{{end}}{{ comma=null }}{{ for tag in data.documentOperations.documentOperationsTagsDetail }}{{ if comma }}, {{ else }}{{ end }}{{ comma=1 }}{{tag.tags.code}}{{end}}",
                        "style": {
                            "fontWeight": "w400",
                            "color": "#1d1f29"
                        }
                    }
                }
            },
            {
                "type": "text",
                "args": {
                    "text": "Formats",
                    "style": {
                        "fontWeight": "bold",
                        "color": "#1d1f29"
                    }
                }
            },
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
                        "text": "{{ comma=null }}{{ for format in data.documentUpload.documentFormatDetails }}{{ if comma }}, {{ else }}{{ end }}{{ comma=1 }}{{format.documentFormat.documentFormatType.code}}{{end}}",
                        "style": {
                            "fontWeight": "w400",
                            "color": "#1d1f29"
                        }
                    }
                }
            },
            {
                "type": "text",
                "args": {
                    "text": "Allowed Client Details",
                    "style": {
                        "fontWeight": "bold",
                        "color": "#1d1f29"
                    }
                }
            },
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
                        "text": "{{ comma=null }}{{ for format in data.documentUpload.documentAllowedClientDetails }}{{ if comma }}, {{ else }}{{ end }}{{ comma=1 }}{{format.documentAllowedClients.code}}{{end}}",
                        "style": {
                            "fontWeight": "w400",
                            "color": "#1d1f29"
                        }
                    }
                }
            },
            {
                "type": "text",
                "args": {
                    "text": "Optimize Size",
                    "style": {
                        "fontWeight": "bold",
                        "color": "#1d1f29"
                    }
                }
            },
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
                        "text": "{{if data.documentOptimize.size}}Ok{{else}}None{{end}}",
                        "style": {
                            "fontWeight": "w400",
                            "color": "#1d1f29"
                        }
                    }
                }
            },
            {
                "type": "text",
                "args": {
                    "text": "documentOptimizeType",
                    "style": {
                        "fontWeight": "bold",
                        "color": "#1d1f29"
                    }
                }
            },
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
                        "text": "{{data.documentOptimize.documentOptimizeType.code}}",
                        "style": {
                            "fontWeight": "w400",
                            "color": "#1d1f29"
                        }
                    }
                }
            }
        ]
    }

""";
