## development

```bash
git clone <url>
cd <name>
cp .env.development .env
docker-compose build
docker-compose run --rm app bash
/app$ bundle install
/app$ yarn
/app$ rails db:create
/app$ rails db:migrate
docker-compose up
```

## production

```bash
git clone <url>
cd <name>
cp .env.development .env
sed -i -e 's/RAILS_ENV=development/RAILS_ENV=production/g' .env
docker-compose build
docker-compose run --rm app bash
/app$ bundle install
/app$ yarn
/app$ rails db:create
/app$ rails db:migrate
/app$ rails assets:precompile
/app$ sed -i -e "s/SECRET_KEY_BASE=/SECRET_KEY_BASE=$(rails secret)/g" .env
docker-compose up -d
```
