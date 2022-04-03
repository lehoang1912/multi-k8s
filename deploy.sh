docker build -t lnhoang2769/multi-client:latest -t lnhoang2769/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t lnhoang2769/multi-server:latest -t lnhoang2769/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t lnhoang2769/multi-worker:latest -t lnhoang2769/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push lnhoang2769/multi-client:latest
docker push lnhoang2769/multi-server:latest
docker push lnhoang2769/multi-worker:latest

docker push lnhoang2769/multi-client:$SHA
docker push lnhoang2769/multi-server:$SHA
docker push lnhoang2769/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=lnhoang2769/multi-server:$SHA
kubectl set image deployments/client-deployment client=lnhoang2769/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=lnhoang2769/multi-worker:$SHA