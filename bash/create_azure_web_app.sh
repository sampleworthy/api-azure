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

# Check if the web app was created successfully
if [ $? -eq 0 ]; then
    echo "Web App created successfully. Setting the startup command..."
    # Set the startup command
    az webapp config set --resource-group $RESOURCE_GROUP --name $WEB_APP_NAME --startup-file "gunicorn -w 4 -k uvicorn.workers.UvicornWorker backend-api.main:app"
    echo "Startup command set successfully."
else
    echo "Failed to create Web App."
    exit 1
fi

echo "Azure Web App created and configured successfully"