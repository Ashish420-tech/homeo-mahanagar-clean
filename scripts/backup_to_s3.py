#!/usr/bin/env python3
"""Backup local data directory to S3 with timestamped folder.

Requirements:
  - boto3 installed on the EC2 instance
  - EC2 instance role with s3:PutObject permission or AWS credentials configured
Usage:
  python3 scripts/backup_to_s3.py --source /path/to/data --bucket my-backup-bucket
"""

import argparse
import boto3
import os
from datetime import datetime
from botocore.exceptions import ClientError

def upload_dir(path, bucket, prefix='backups'):
    s3 = boto3.client('s3')
    date_str = datetime.utcnow().strftime('%Y%m%dT%H%M%SZ')
    base_prefix = f"{prefix}/{date_str}"
    uploaded = 0
    for root, dirs, files in os.walk(path):
        for fname in files:
            full_path = os.path.join(root, fname)
            rel_path = os.path.relpath(full_path, path)
            s3_key = f"{base_prefix}/{rel_path}"
            try:
                s3.upload_file(full_path, bucket, s3_key)
                print(f"Uploaded {full_path} to s3://{bucket}/{s3_key}")
                uploaded += 1
            except ClientError as e:
                print(f"Failed to upload {full_path}: {e}")
    return uploaded

def main():
    parser = argparse.ArgumentParser(description='Backup directory to S3')
    parser.add_argument('--source', default='data', help='Source directory to backup')
    parser.add_argument('--bucket', required=True, help='Target S3 bucket name')
    parser.add_argument('--prefix', default='homeo-backup', help='S3 prefix/folder')
    args = parser.parse_args()

    if not os.path.isdir(args.source):
        print(f"Source directory {args.source} does not exist.")
        return

    print(f"Starting backup of {args.source} to bucket {args.bucket}")
    count = upload_dir(args.source, args.bucket, args.prefix)
    print(f"Backup complete. Files uploaded: {count}")


if __name__ == '__main__':
    main()
