## PATCH /api/v1/user/password
パスワード変更成功.

### Example

#### Request
```
PATCH /api/v1/user/password 
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNywiaWF0IjoxNjU4OTg4NjY1LCJleHAiOjE2NjE1ODA2NjUsImp0aSI6ImMzMjU2OWJmLTk5OTEtNDFmMi1iZGRkLWQ2N2Q2NmE1MGY0OSJ9.5eh5Qvw5NNXJqNSRm6qvZEsV3vxth8Q0T_0w4DhUQnA
Content-Type: application/json
```

```json
{
  "password": "new_password"
}
```

#### Response
```
HTTP/1.1 200
Content-Length: 259
Content-Type: application/json; charset=utf-8
```

```json
{
  "message": "パスワードの変更に成功しました",
  "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNywiaWF0IjoxNjU4OTg4NjY1LCJleHAiOjE2NjE1ODA2NjUsImp0aSI6IjRiMjFiYzc1LWY3ZDctNDkzNC05MjEwLWUwMjIzN2VlNzQ4YSJ9.oPR3EZi_NJuWFQdCQpKtYVPhwuC1EKDANTMOJr3TBXs"
}
```

## PATCH /api/v1/user/password
エラーが発生した場合.

### Example

#### Request
```
PATCH /api/v1/user/password 
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxOCwiaWF0IjoxNjU4OTg4NjY1LCJleHAiOjE2NjE1ODA2NjUsImp0aSI6IjI0MGMzMjBlLWE0NzUtNDdjMi1iMGQ3LWE2MzE5MmVhODlmZSJ9.7Il8JEdeaS8dt9HmsEqxUU932IwGylPhhngLRakrG94
Content-Type: application/json
```

```json
{
  "password": "a"
}
```

#### Response
```
HTTP/1.1 422
Content-Length: 73
Content-Type: application/json; charset=utf-8
```

```json
{
  "errors": [
    "パスワードは4文字以上で入力してください"
  ]
}
```
