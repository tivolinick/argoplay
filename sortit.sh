
NS_TO_DELETE=openshift-gitops

oc get namespace $NS_TO_DELETE -o json > tmp_ns.json
vi tmp_ns.json
echo READY?
read a

oc proxy &
sleep 10
curl -k -H "Content-Type: application/json" -X PUT --data-binary @tmp_ns.json http://127.0.0.1:8001/api/v1/namespaces/$NS_TO_DELETE/finalize

oc get namespace $NS_TO_DELETE # namespaces not found

#kill -9 %%







#https://api.argondf.cp.fyre.ibm.com:64


echo kill the BG process
