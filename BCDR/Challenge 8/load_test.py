import http.client, json, os, sys, urllib
import random, urllib.request

# K8s api service
# host = "35.242.234.237"

# VM Infrastructure
host = "tipuric.tk"

# Number of WebSite tests
web_site_test_num = 1000

# Number of API tests
api_test_num = 1000

# API Testing Credentials
api_user = "admin@netapp.com"
api_password = "Pass@word1"

def CallWebSite (host=None, path="/"):
    try:            
        response = urllib.request.urlopen('http://' + host + path)
        print(response.getcode())
    except Exception as ex:
        print(ex)
        raise ex


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

# Load Testing the Web Site
print("Load Testing the Web Site...")
for i in range(0, web_site_test_num):
    CallWebSite(host)
    CallWebSite(host, "/basket")
    CallWebSite(host, "/?CatalogModel.BrandFilterApplied=" + str(random.choice(brand_ids)) + 
        "&CatalogModel.TypesFilterApplied=" + str(random.choice(type_ids)))
    CallWebSite(host, "/Identity/Account/Login")

# Load Testing the Web Site
print("Load Testing the API...")
# Authenticate
apikey = Authenticate(api_user, api_password)
print("API key:", apikey)

for i in range(0, api_test_num):
    
    # Add a Product
    nas_product_id = AddProduct(apikey, random.choice(brand_ids), random.choice(type_ids), 
        "The product of value " + str(i), "Product no. " + str(i), "/images/products/" + str(random.randint(1,12)) + ".png", 
        "Some nice product picture", random.randint(50,10000)/100)

    # Get a Product
    GetProductById(nas_product_id)

    # Delete every second Product
    if (i % 2):
        try:
            DeleteProductById(apikey, nas_product_id)
        except Exception as ex:
            print(ex)
            raise ex

