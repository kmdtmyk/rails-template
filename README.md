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

## production

```bash
git clone <url>
cd <name>
cp .env.development .env
sed -i -e 's/RAILS_ENV=development/RAILS_ENV=production/g' .env
docker-compose build
docker-compose run --rm app bundle install
docker-compose run --rm app rails db:create
docker-compose run --rm app rails db:migrate
docker-compose run --rm app rails assets:precompile
docker-compose up
```

## credentials

```bash
rails credentials:edit
```
