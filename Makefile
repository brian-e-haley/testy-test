start:
	yarn install
	docker-compose build
	docker-compose up --remove-orphans
deploy:
	yarn install
	gcloud config set project ${PROJECT}
	gcloud builds submit
