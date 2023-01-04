# Create a resource group for the cluster resources
az group create --name sec-rg --location centralus

# To create the cluster and generate ssh keys
az aks create --resource-group sec-rg --name sec-cluster --node-count 1 --enable-addons monitoring --generate-ssh-keys

# To allow kubectl to communicate with the cluster using a separate config file (aksconfig)
az aks get-credentials --resource-group sec-rg --name sec-cluster --file ~/.kube/aksconfig --overwrite-existing

# To confirm the creation of the cluster
kubectl get nodes