## development

```bash
git clone <url>
cd <name>
cp .env.example .env
docker-compose build
docker-compose run --rm app bash
/app$ bundle install
/app$ yarn
/app$ rails db:create
/app$ rails db:migrate
/app$ rails db:seed
docker-compose up
```

## production

```bash
git clone <url>
cd <name>
cp .env.example .env
sed -i -e 's/COMPOSE_FILE=.*/COMPOSE_FILE=docker-compose.yml:docker-compose.production.yml/' .env
sed -i -e "s/SECRET_KEY_BASE=.*/SECRET_KEY_BASE=$(cat /dev/urandom | tr -dc 'a-f0-9' | head -c 128)/" .env
sed -i -e "s/APP_UID=.*/APP_UID=$(id -u)/" .env
sed -i -e "s/APP_GID=.*/APP_GID=$(id -g)/" .env
docker-compose build
docker-compose run --rm app bash
/app$ bundle install --without test development
/app$ yarn
/app$ rails db:create
/app$ rails db:migrate
/app$ rails assets:precompile
docker-compose up -d
```
