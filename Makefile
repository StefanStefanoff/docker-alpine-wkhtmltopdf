build-and-push:
	docker buildx build -f src/Dockerfile --platform linux/amd64 -t atrelios/docker-alpine-wkhtmltopdf:build-amd64 --push .
	docker buildx build -f src/Dockerfile --platform linux/arm64 -t atrelios/docker-alpine-wkhtmltopdf:build-arm64 --push .
	docker manifest create atrelios/docker-alpine-wkhtmltopdf:build --amend atrelios/docker-alpine-wkhtmltopdf:build-amd64 --amend atrelios/docker-alpine-wkhtmltopdf:build-arm64
	docker manifest push atrelios/docker-alpine-wkhtmltopdf:build
	docker buildx build --platform linux/amd64 -t atrelios/docker-alpine-wkhtmltopdf:latest-amd64 --push .
	docker buildx build --platform linux/arm64 -t atrelios/docker-alpine-wkhtmltopdf:latest-arm64 --push .
	docker manifest create atrelios/docker-alpine-wkhtmltopdf:latest --amend atrelios/docker-alpine-wkhtmltopdf:latest-amd64 --amend atrelios/docker-alpine-wkhtmltopdf:latest-arm64
	docker manifest push atrelios/docker-alpine-wkhtmltopdf:latest