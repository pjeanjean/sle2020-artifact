#!/bin/bash

ROUTER_URL=$(kubectl get pod router --template={{.status.hostIP}})
ROUTER_PORT=$(kubectl get svc router -o=jsonpath='{.spec.ports[?(@.port==8080)].nodePort}')
KUBECONFIG=`printenv HOME`/.kube/config

java -Djdk.tls.client.protocols=TLSv1.2 -Dfr.inria.diverse.Router/mp-rest/url=http://$ROUTER_URL:$ROUTER_PORT -Dkube.config=$KUBECONFIG -jar backend/ClusterInspector/target/ClusterInspector-1.0-SNAPSHOT-runner.jar
