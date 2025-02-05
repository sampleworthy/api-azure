#!/bin/bash

# Variables
RESOURCE_GROUP="fastapi-hb-rg"
LOCATION="eastus"
APP_SERVICE_PLAN="fastapi-hb-asp"
WEB_APP_NAME="fastapi-hb-web"

# Create a resource group
az group create --name $RESOURCE_GROUP --location $LOCATION

# Create an App Service plan with B1 SKU
az appservice plan create --name $APP_SERVICE_PLAN --resource-group $RESOURCE_GROUP --sku B1 --is-linux

# Create a Web App
az webapp create --resource-group $RESOURCE_GROUP --plan $APP_SERVICE_PLAN --name $WEB_APP_NAME --runtime "PYTHON|3.8"

echo "Azure Web App created successfully"