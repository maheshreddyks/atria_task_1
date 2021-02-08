# API Endpoints

Please access all the below endpoints with the following structure.

url - > SERVER_ADDRESS:SERVER_PORT

Please send the following headers in the request

```
Content-Type : application/json
```

### 1. Signup - (User)

###### POST {url}/api/signup

User can signup using this endpoint.

###### Input structure

|           | Mandatory | Description |
| --------- | --------- | ----------- |
| email     | yes       | email       |
| full_name | yes       | name        |
| password  | yes       | password    |
| age       | yes       | age         |



###### Input

```json
{
    "email": "mahesh@test.inn",
    "full_name": "Mahesh Reddy",
    "password": "123456",
    "age": 26
}
```

###### Output structure

|         | type    |
| ------- | ------- |
| status  | boolean |
| message | string  |
| errors  | array   |



###### Output

```json
{
    "message": "Mahesh Reddy signed up successfully.",
    "status": true
}
```

```json
{
    "errors": {
        "email": [
            "has already been taken"
        ]
    },
    "status": false
}
```

### 2. PrePopulate Topics

###### GET {url}/api/pre_populate_data

prepopulating topics data using this endpoint.


###### Output structure

|         | type    |
| ------- | ------- |
| status  | boolean |
| message | string  |
| errors  | array   |



###### Output

```json
{
    "message": "data_prepopulated_sucessfully",
    "status": true
}
```


For all the topic based endpoints, Basic Authentication has been implemented.
Please add the header 
key will be Base encode64 of username and password.
```
authorization: "Basic key"
```
### 3. List All Topics

###### GET {url}/api/topics/list

Fetches all topics list data using this endpoint.


###### Output structure

|            | type    | description                                                  |
| ---------- | ------- | ------------------------------------------------------------ |
| status     | boolean | status of the request                                        |
| count      | integer | total topics available count                                 |
| topics     | array   | list of available topics. each topic in an object            |
| id         | integer | This ID will be available whenever the topic has to be added to an user |
| short_desc | string  | Description of the topic                                     |
| topic_name | string  | topic title                                                  |



###### Output

```json
{
    "count": 2,
    "status": true,
    "topics": [
        {
            "id": 1,
            "short_desc": "Sport includes all forms of competitive physical activity or games which,[1] through casual or organized participation, at least in part aim to use, maintain or improve physical ability and skills while providing enjoyment to participants, and in some cases, entertainment for spectators.[2] Sports can bring positive results to one's physical health. Hundreds of sports exist, from those between single contestants, through to those with hundreds of simultaneous participants, either in teams or competing as individuals",
            "topic_name": "sports"
        },
        {
            "id": 2,
            "short_desc": "A car (or automobile) is a wheeled motor vehicle used for transportation. Most definitions of cars say that they run primarily on roads, seat one to eight people, have four wheels, and mainly transport people rather than goods.[2][3].Cars came into global use during the 20th century,",
            "topic_name": "cars"
        }
    ]
}
```

```json
{
    "count": 0,
    "status": true,
    "topics": []
}
```
### 4. Add a Topic of interest to a USER

###### POST {url}/api/topics/add

User can add the list of topics to their interest using this endpoint.


###### Input structure

|             | Mandatory | Description             |
| ----------- | --------- | ----------------------- |
| topic_names | yes       | the array of topic name |



###### Input

```json
{
    "topic_names": ["cars","sports"]
}
```


###### Output structure

|         | type    |
| ------- | ------- |
| status  | boolean |
| message | string  |



###### Output

```json
{
    "message": "topic_names added successfully",
    "status": true
}
```

```json
{
    "message": "some topic_names entered are unavailable or already alloted",
    "status": false
}
```

```json
{
    "message": "topic_ids unavailable",
    "status": false
}
```



### 5. Users's Topic of interests

###### GET {url}/api/topics

Fetches all topics list in which the user is interested using this endpoint.


###### Output structure

|            | type    | description                                                  |
| ---------- | ------- | ------------------------------------------------------------ |
| status     | boolean | status of the request                                        |
| count      | integer | total topics available count                                 |
| topics     | array   | list of available topics. each topic in an object            |
| id         | integer | This ID will be available whenever the topic has to be added to an user |
| short_desc | string  | Description of the topic                                     |
| topic_name | string  | topic title                                                  |



###### Output

```json
{
    "count": 2,
    "status": true,
    "topics": [
        {
            "id": 1,
            "short_desc": "Sport includes all forms of competitive physical activity or games which,[1] through casual or organized participation, at least in part aim to use, maintain or improve physical ability and skills while providing enjoyment to participants, and in some cases, entertainment for spectators.[2] Sports can bring positive results to one's physical health. Hundreds of sports exist, from those between single contestants, through to those with hundreds of simultaneous participants, either in teams or competing as individuals",
            "topic_name": "sports"
        },
        {
            "id": 2,
            "short_desc": "A car (or automobile) is a wheeled motor vehicle used for transportation. Most definitions of cars say that they run primarily on roads, seat one to eight people, have four wheels, and mainly transport people rather than goods.[2][3].Cars came into global use during the 20th century,",
            "topic_name": "cars"
        }
    ]
}
```

```json
{
    "count": 0,
    "status": true,
    "topics": []
}
```
