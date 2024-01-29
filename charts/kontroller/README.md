# kontroller chart
kontroller helm chart

# 배포
## add repo
```
helm repo add opsnowsecurity https://opsnowsecurity.github.io/helm-charts
```

## install chart
```
helm upgrade --install my-release scarif/opsnow
```

## uninstall chart
```
helm uninstall my-release
```

## Application Configuration
| Envirenment  | Description                           |
|--------------|---------------------------------------|
| CLUSTER_ID | |
| ACCOUNT_ID | |
| ORGANIZATION_ID | |
| REGION | |
| KMANAGER_PROTOCOL | |
| KMANAGER_HOST | |
| KMANAGER_PORT | |
| VERSION_CHECK_INTERVAL | |
| APP_ENV | |

# configuration

| Parameter                                     | Description                           | Default       |
|-----------------------------------------------|---------------------------------------|---------------|
| replicaCount                                  | 파드 리플리카 수                             | 1             |
| image.repository                              | 이미지 저장소                               | ""            |
| image.pullPolicy                              | 이미지 pull policy                       | IfNotPresent  |
| image.tag                                     | 이미지 태그 버전                             | ""            |
| imagePullSecrets                              | 이미지 pull secrets                      | []            |
| updateStrategy.type                           | 파드 업데이트 전략, RollingUpdate or Recreate | RollingUpdate |
| serviceAccount.create                         | service account 생성 여부                 | true          |
| command                                       | 컨테이너 startup command                  | []            |
| args                                          | 컨테이너 startup argumnets                | []            |
| podAnnotations                                | 파드 annotation                         | {}            |
| podSecurityContext                            | 파드 securtiy context                   |               |
| securityContext                               | 컨테이너 security context                 |               |
| hostNetwork                                   | host network 사용 여부                    | false         |
| dnsPolicy                                     | dns policy                            | ClusterFirst  |
| podDisruptionBudget                           | pod disruption budget                 | {}            |
| health.enabled                                | health check 사용 여부                    | false         |
| readinessProbe                                | readiness probe                       | {}            |
| livenessProbe                                 | liveness probe                        | {}            |
| startupProbe                                  | startup probe                         | {}            |
| resources                                     | resources                             | {}            |
| autoscaling.enabled                           | autoscaling 사용 여부                     | false         |
| autoscaling.minReplicas                       | autoscaling min replica 수             | 1             |
| autoscaling.maxReplicas                       | autoscaling min replica 수             | 10            |
| autoscaling.targetCPUUtilizationPercentage    | 타겟 cpu 사용률                            | 80%           |
| autoscaling.targetMemoryUtilizationPercentage | 타겟 메모리 사용률                            | ""            |
| nodeSelector                                  | node selector 설정                      | {}            |
| tolerations                                   | tolerations 설정                        | {}            |
| affinity                                      | affinity 설정                           | {}            |
| configmap.enabled                             | configmap environment 사용 여부           | false         |
| configmap.data                                | configmap data                        | {}            |
| secret.enabled                                | secret environment 사용 여부              | false         |
| configmap.data                                | secret data                           | {}            |
| extraEnv                                      | 사용할 environment 설정                    | []            |
| envFromConfigMaps                             | envFrom으로 사용할 configmap               | []            |
| envFromSecrets                                | envFrom으로 사용할 secret                  | []            |
| extraObjects                                  | 배포할 k8s manifests yaml object         | []            |
| extraTemplates                                | 배포할 k8s manifests template string     | []            |
| persistence.enabled                           | persistence volume 사용 여부              | false         |
| persistence.accessModes                       | access modes                          | ReadWriteOnce |
| persistence.size                              | 10Gi                                  |               |
| volumeMounts                                  | 볼륨 마운트 설정                             | []            |
| volumes                                       | 파드 볼륨 설정                              | []            |

