
build17.0:
#	docker build -t localhost:5000/kubelessdyaapl:17.0$$RUNTIME_TAG_MODIFIER -f Dockerfile.17.0 .
	docker build -t localhost:5000/kubelessdyaapl:17.0 -f Dockerfile.17.0 .

push17.0:
#	docker push localhost:5000/kubelessdyaapl:17.0$$RUNTIME_TAG_MODIFIER 
	docker push localhost:5000/kubelessdyaapl:17.0 

# Mandatory jobs
build-all: build17.0
push-all: push17.0 