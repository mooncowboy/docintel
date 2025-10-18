az apim backend create \
  --service-name rifiel-apim-we \
  --resource-group core \
  --url https://rifiel-doc-we.cognitiveservices.azure.com \
  --protocol https \
  --name doc-west 

az apim backend create \
  --service-name rifiel-apim-ne \
  --resource-group core \
  --url https://rifiel-doc-ne.cognitiveservices.azure.com \
  --protocol https \
  --name doc-north

  az apim nv create \
  --service-name rifiel-apim-we \
  --resource-group core \
  --display-name "activeBackend" \
  --name-value-id activeBackend \
  --value doc-west

  az apim api import \
  --service-name rifiel-apim-we \
  --resource-group core \
  --path documentintelligence \
  --specification-url https://raw.githubusercontent.com/Azure/azure-rest-api-specs/main/specification/cognitiveservices/data-plane/DocumentIntelligence/preview/2024-11-30/documentintelligence.json \
  --api-id documentintelligence \
  --display-name "Document Intelligence Proxy"