## Web API v1

- [認証](api/v1/logins_controller.md)
- [パスワード変更](api/v1/user/passwords_controller.md)

ログイン成功時に返ってくるtokenを、他のapi送信時には毎回リクエストヘッダに 
`Authorization: Bearer <token>` をつけて送信する。
有効なトークンが送信されていない場合は、401 Unauthorized が返ってくる。
