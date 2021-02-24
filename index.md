---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
title: Home
nav_order: 1
permalink: /
---

# Git it done
{: .fs-9 }

Focus on building great solutions on Azure instead of writing documentation.
PSDocs for Azure automatically generates documentation for Azure infrastructure as code (IaC) artifacts.
{: .fs-6 .fw-300 }

[Get started now](#getting-started){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 } [View it on GitHub](https://github.com/Azure/PSDocs.Azure){: .btn .fs-5 .mb-4 .mb-md-0 }

---

## Getting started

### Annotate templates file

In its simplest structure, an Azure template has the following elements:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {  },
  "variables": {  },
  "functions": [  ],
  "resources": [  ],
  "outputs": {  }
}
```

Additionally a `metadata` property can be added in most places throughout the template.
For example:

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "metadata": {
        "name": "Storage Account",
        "description": "Create or update a Storage Account."
    },
    "parameters": {
        "storageAccountName": {
            "type": "string",
            "metadata": {
                "description": "Required. The name of the Storage Account."
            }
        },
        "tags": {
            "type": "object",
            "defaultValue": {
            },
            "metadata": {
                "description": "Optional. Tags to apply to the resource.",
                "example": {
                    "service": "<service_name>",
                    "env": "prod"
                }
            }
        }
    },
    "resources": [
    ],
    "outputs": {
        "resourceId": {
            "type": "string",
            "value": "[resourceId('Microsoft.Storage/storageAccounts', variables('storageAccountName'))]",
            "metadata": {
                "description": "A unique resource identifier for the storage account."
            }
        }
    }
}
```
