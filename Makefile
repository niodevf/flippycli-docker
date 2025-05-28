build:
	docker build -t flippydrivecli --platform linux/amd64 --build-arg ARCH=amd64 .
buildarm:
	docker build -t flippydrivecli --platform linux/arm --build-arg ARCH=arm .
run:
	docker run -p 7031:7031 flippydrivecli