# orchestration

> simple replicas of docker images

<..>

## tons of competition

- Docker Swarm
- Kubernetes
- OpenShift
- Mesos
- ...more every month it seems
<..>
Easily manage a set of replicas (Docker Swarm)
<pre>
    <code>
docker service create --replicas 5 -p 80:80 --name web jesse/mywebapp:1.0 # initial deploy

docker service scale web=8 # scaling up/down

docker service update --image jesse/mywebapp:1.1 web # rolling updates
    </code>
</pre>
<..>
Docker Swarm Routing Mesh

>..allows a service to be reached by the same port on all nodes in the swarm, even if the node does not have the service deployed on it...

<..>
So basically...

1. Commit
2. CI Builds images
3. Store image in private registry
4. Deploy/Update replicas in swarm


<..>

## cloud hosting of containers

- Amazon EC2 Container Service 
- Heroku Container Runtime
- Azure Cloud Service (like ec2)
- Azure Cloud Instances (billed by the second, ephimeral)
- ...more
