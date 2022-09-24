## Lab environment for training and practicing for CKA exams

The Vagrant file creates following Ubuntu VMs - master(s), worker and load-balancer.  

**Master nodes** have been prepared for installing k8s cluster.

**Load Balancer node** has been prepared with:
  - simple haproxy configuration
  - simple nfs export ```/opt/vol/``` for testing persistent volumes

### Lab Diagram  with Details

![diagram](diagram.svg "diagram")

### Configure Network:

Internal IP addresses (you can copy the following to your ```/etc/hosts``` file):   
```bash
192.168.60.200 lbnode  
192.168.60.201 kubemaster01 ckamaster  
192.168.60.202 kubemaster02  
192.168.60.203 kubemaster03  
192.168.60.204 kubework01  
192.168.60.205 kubework02  
```

### Example Building Environment

#### For one master and one worker:

You will use:
  * vCPU: 3
  * RAM: 6GB

```
root@pop-os:~# vagrant up kubemaster01 kubework01
```  

#### For one master, one worker and lb:

You will use:
  * vCPU: 4
  * RAM: 6.5 GB

```
root@pop-os:~# vagrant up kubemaster01 kubework01 lbnode
```  

#### For start all VMs:

You will use:
  * vCPU: 7
  * RAM: 12.5 GB

```
root@pop-os:~# vagrant up
```  

### How Connecting in VMs

You can connect to all nodes using user "user" and submiting the private key:

```
root@pop-os:~# ssh user@192.168.60.201 -i key_rsa
``` 

Or using vagrant for connecting:

```
root@pop-os:~# vagrant ssh NAMEVM
``` 

Can you using user **vagrant** with password **vagrant**.

Now Have fun! 😃 