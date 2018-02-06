```bash
git clone <url>
cd <name>
docker-compose build
docker-compose run --rm app bundle install
docker-compose run --rm app rails db:create
docker-compose up
```
