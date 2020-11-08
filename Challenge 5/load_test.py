import http.client, json, os, sys, urllib
from urllib.parse import urlparse
import random

# K8s api service
# host = "35.242.234.237"

# VM Infrastructure
host = "tipuric.tk"

def CallAPI (method="GET", host=None, function=None, headers=None, body=None):
        
    request_path = "/api/{0}".format(function)
    
    try:
        conn = http.client.HTTPConnection(host)    
        conn.request (method, request_path, json.dumps(body), headers)
        response = conn.getresponse()
        print(response.status)
        data = response.read().decode("UTF-8")
        result = None
        if len(data) > 0:
            result = json.loads(data)
        return result
    except Exception as ex:
        print(ex)
        raise ex

def Authenticate (username=None, password=None):
    headers = {
        'Content-Type': 'application/json'
    }

    body = {
        "username": username,
        "password": password
    }

    apikey = ''
    
    result = CallAPI(method="POST", host=host, function="authenticate", headers=headers, body = body)
    
    if (result != None):
        apikey = result['token']
    
    return apikey

def AddProduct (apikey=None, brandId=None, typeId=None, description=None, name=None, pictureUri=None, pictureName=None, price=None):

    headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + apikey
    }

    body = {
        "catalogBrandId": brandId,
        "catalogTypeId": typeId,
        "description": description,
        "name": name,
        "pictureUri": pictureUri,
        "pictureName": pictureName,
        "price": price
    }

    productId = 0
    result = CallAPI(method="POST", host=host, function="catalog-items", headers=headers, body = body)
    if (result != None):
        productId = result['catalogItem']['id']
        print(json.dumps(result, sort_keys=True, indent=2))
    return productId

def GetProductById (productId=None):
    headers = {
        'Content-Type': 'application/json',
    }

    result = CallAPI(method="GET", host=host, function="catalog-items/{0}".format(productId), headers=headers, body = None)
    if (result != None):
        print(json.dumps(result, sort_keys=True, indent=2))

def DeleteProductById (apikey=None, productId=None):
    headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + apikey
    }

    result = CallAPI(method="DELETE", host=host, function="catalog-items/{0}".format(productId), headers=headers, body = None)
    
    if (result != None):
        print(json.dumps(result, sort_keys=True, indent=2))

brand_ids = [1,2,3,4,5,11,12,13,14,15]
type_ids = [1,2,3,4,11,12,13,14]

# Authenticate
apikey = Authenticate("admin@microsoft.com", "Pass@word1")
print("API key:", apikey)

for i in range(0, 1000):
    
    # Add a Product
    nas_product_id = AddProduct(apikey, random.choice(brand_ids), random.choice(type_ids), "The product of value " + str(i), "Product no. " + str(i), "/images/products/" + str(random.randint(1,12)) + ".png", "Some nice product picture", random.randint(50,10000)/100)

    # Get a Product
    GetProductById(nas_product_id)

    # Delete every second Product
    # if (i % 2):
    #     try:
    #         DeleteProductById(apikey, nas_product_id)
    #     except Exception as ex:
    #         print(ex)
    #         raise ex

