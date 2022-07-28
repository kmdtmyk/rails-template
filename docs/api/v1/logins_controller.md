## POST /api/v1/login
ログイン成功.

### Example

#### Request
```
POST /api/v1/login 
Content-Type: application/json
```

```json
{
  "username": "user1",
  "password": "pass1"
}
```

#### Response
```
HTTP/1.1 200
Content-Length: 295
Content-Type: application/json; charset=utf-8
```

```json
{
  "user": {
    "id": 15,
    "username": "user1",
    "name": "ユーザ1",
    "furigana": "ゆーざ1",
    "admin": false
  },
  "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNSwiaWF0IjoxNjU4OTg4NjY0LCJleHAiOjE2NjE1ODA2NjQsImp0aSI6ImQyMzBmNDM2LWY1MDktNGYyMC1hM2IwLTkxNjQyYjE1MWE4ZiJ9.FprnsWm9Wsu_OnBBmm8XF00zDyycVSqavdsyeYqXpU8"
}
```

## POST /api/v1/login
ログイン失敗.

### Example

#### Request
```
POST /api/v1/login 
Content-Type: application/json
```

```json
{
  "username": "user1",
  "password": "違うパスワード"
}
```

#### Response
```
HTTP/1.1 401
Content-Length: 35
Content-Type: application/json; charset=utf-8
```

```json
{
  "message": "Authentication failed"
}
```
