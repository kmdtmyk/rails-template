## development

```bash
git clone <url>
cd <name>
cp .env.development .env
docker-compose build
docker-compose run --rm app bundle install
docker-compose run --rm app rails db:create
docker-compose up
```

## credentials

```bash
rails credentials:edit
```
