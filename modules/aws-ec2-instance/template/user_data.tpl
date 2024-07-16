#!/bin/bash -xe
exec > >(tee /var/log/user-data.log|logger -t user-data ) 2>&1
echo BEGIN
date '+%Y-%m-%d %H:%M:%S'

mkdir /home/ec2-user/backup/

cat <<'EOF' >> /tmp/backup.sh
#!/bin/bash
cd /home/ec2-user/backup/

time_stamp=$(date +%Y-%m-%dT%H-%M-%S)

#compress the backup
sudo tar fczP backup-$time_stamp.tar.gz  ${backup_path}

#push the backup to the bucket
sudo aws s3 cp backup-$time_stamp.tar.gz  s3://${bucket_name}

echo "the backup file backup-$time_stamp.tar.gz has been uploaded to backet s3://${bucket_name} "
EOF

chmod +x /tmp/backup.sh
crontab<<EOF
0 2 * * *  sh /tmp/backup.sh
EOF