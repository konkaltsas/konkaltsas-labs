RESOURCE_GROUP_NAME=kk-tf-resource-group
LOCATION=westeurope
STORAGE_ACCOUNT_NAME=kktfstorageaccount
STORAGE_SKU=Standard_LRS
ENCRYPTION_SERVICES=blob
CONTAINER_NAME=kkdeploynsaztfstate

NETSCALER_OFFER="netscalervpx-141"
NETSCALER_PUBLICHER="citrix"
NETSCALER_PLAN="netscalerbyol"

# Accept terms to provision NetScaler
az vm image terms accept \
--offer $NETSCALER_OFFER \
--publisher $NETSCALER_PUBLICHER \
--plan $NETSCALER_PLAN

# Create resource group
az group create \
--name $RESOURCE_GROUP_NAME \
--location $LOCATION

# Create storage account
az storage account create \
--resource-group $RESOURCE_GROUP_NAME \
--name $STORAGE_ACCOUNT_NAME \
--sku $STORAGE_SKU \
--encryption-services $ENCRYPTION_SERVICES

# Create blob container
az storage container create \
--name $CONTAINER_NAME \
--account-name $STORAGE_ACCOUNT_NAME

ACCOUNT_KEY=$(az storage account keys list \
--resource-group $RESOURCE_GROUP_NAME \
--account-name $STORAGE_ACCOUNT_NAME \
--query '[0].value' -o tsv)

export ARM_ACCESS_KEY=$ACCOUNT_KEY