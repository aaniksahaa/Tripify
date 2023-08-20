
entity_name = 'comment'

entity_name = entity_name.strip()

name = entity_name.lower()

Name = name.title()

a = f"""
# {Name}

## a. Get Single {Name} by {name}_id

Endpoint URL:    
```
GET
```
```
/api/v1/{name}/1
```  
Request Body: 
```
None
```
Example Response:    
```json

```

## b. Get {Name}s by querying on attributes ( Paginated )  

#### Note that, all attributes are optional, you can either mention, not mention or leave them blank    

Endpoint URL:  
```
GET
```
```
/api/v1/{name}?query=value
```
Request Body: 
```
None
```
Example Response:    
```json

```

## c. Create New {Name}

Endpoint URL: 
```
POST
```
```
/api/v1/{name}/
```  
Request Body:    
```json

```
Example Response:  
```json

```
## d. Update a {Name}
Endpoint URL: 
```
PUT
```
```
/api/v1/{name}/
```  
Request Body:    
```json

```
Example Response:  
```json

```

## e. Delete a {Name} ( Soft Deletion )

Endpoint URL:  
```
DELETE
```
```
api/v1/{name}/4
```  
Request Body: 
```
None
```
Example Response:    
```json

```

## f. Delete a {Name} ( Permanent Deletion )

Endpoint URL:
```
DELETE
```
```
/api/v1/{name}/danger/5
``` 
Request Body: `None`    
Example Response:    
```json

```
"""

print(a)

file_path = './data_generators/output.txt'

with open(file_path,'w') as file:
    file.write(a)
