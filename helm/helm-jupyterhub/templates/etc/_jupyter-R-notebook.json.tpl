    {
        "apiVersion": "v1",
        "kind": "Pod",
        "metadata": {
            "name": ${pod_name},
            "labels": {
                "name": ${pod_name}
            }
        },
        "spec": {
            "containers": [
                {
                    "name": "jupyter",
                    "securityContext": {"runAsUser": 0 },
                    "image": "jupyter/r-notebook",
                    "livenessProbe": {
                        "exec": {
                            "command": ["bash", "-c", "bash -c 'echo \"$(date +%F_%H:%M:%S)\" > /home/jovyan/work/.podhealth && echo ok'"]
                        },
                        "initialDelaySeconds": 245,
                        "timeoutSeconds": 2,
                        "periodSeconds": 20
                    },
                    "resources": {
                        "requests": {
                            "memory": ${mem_request},
                            "cpu": ${cpu_request}
                        },
                        "limits": {
                            "memory": ${mem_limit},
                            "cpu": ${cpu_limit}
                        }
                    },
                    "env": ${env_minus_nbdir},
                    "command": ["/bin/sh","-c"], 
                    "args": ["/usr/local/bin/start-singleuser.sh"],
                    "volumeMounts": [ {"name": "${username_nq}-nfs", "mountPath": "/home/jovyan/work"}, {"name": "no-api-access", "mountPath": "/var/run/secrets/kubernetes.io/serviceaccount"} ]
                }
            ],
            "volumes": ${vols}
        }
    }