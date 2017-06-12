kube-backup
===========
[![Docker Repository on Quay](https://quay.io/repository/stackpoint/kube-state-backup/status "Docker Repository on Quay")](https://quay.io/repository/stackpoint/kube-state-backup)

Kubernetes state backup script, designed to be ran as Kubernetes CronJob.

Props to @pieterlange [kube-backup](https://github.com/pieterlange/kube-backup) project.

Setup
-----
Use the Helm [chart](helm) and deploy it to Kubernetes as `CronJob` which will ensure cluster backups of Kubernetes resource definitions to your AWS S3 or GCS bucket.

Install for the first time
--------------------------
### AWS S3
```bash
helm upgrade --install kube-backup kube-state-backup --namespace kube-backup \
    --set schedule="*/50 * * * *",aws.enabled="true" \
    --set aws.accessKeyId="UNF37N93MG374B27",aws.secretAccessKey="AvgjbYndf9TMF8Y3F3J993TMTJ2309T" \
    --set aws.bucket="my-kube-state-backup-bucket",aws.region="eu-west-2" \
    --set jobCleanup.enabled="true"
```

### GCS
```bash
helm upgrade --install kube-backup kube-state-backup --namespace kube-backup \
    --set schedule="*/50 * * * *",gcs.enabled="true",gcs.projectId="project-123" \
    --set gcs.accessKeyId="GOOG74NFENMO3",gcs.secretAccessKey="8GNFEIUMFEFNW7NRIQRJ38RNRQRRR8" \
    --set gcs.bucket="my-kube-state-backup",gcs.region="eu" \
    --set jobCleanup.enabled="true"
```

### Run upgrades e.g. for schedule or docker image change
```bash
helm upgrade kube-backup kube-state-backup --reuse-values --set schedule="*/30 * * * *"
helm upgrade kube-backup kube-state-backup --reuse-values --set imageTag="0.1.8"
```


License
-------
This project is MIT licensed.
