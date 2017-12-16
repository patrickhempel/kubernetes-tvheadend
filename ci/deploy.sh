#!/usr/bin/env bash

KUBECTL="kubectl -n $KUBE_NAMESPACE"

echo "creating namespace..."
$KUBECTL get namespace $KUBE_NAMESPACE 2> /dev/null || $KUBECTL create namespace $KUBECTL

echo -e "\ncreating pv..."
$KUBECTL get pv tvheadend-record 2> /dev/null || $KUBECTL create -f 01.pv.yml

echo -e "\ncreating pvc..."
$KUBECTL get pvc tvheadend-record-claim 2> /dev/null || $KUBECTL create -f 02.pvc.yml

echo -e "\ncreating daemonset..."
$KUBECTL get ds tvheadend 2> /dev/null || $KUBECTL create -f 03.ds.yml

echo -e "\ncreating services..."
$KUBECTL get service tvheadend 2> /dev/null || $KUBECTL create -f 04.service.yml