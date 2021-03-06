#! sh -e

# Check AWS_ACCESS_KEY_ID
if test -z "$AWS_ACCESS_KEY_ID"; then
  echo "Please export AWS_ACCESS_KEY_ID"
  exit -1
fi
# Check AWS_SECRET_ACCESS_KEY
if test -z "$AWS_SECRET_ACCESS_KEY"; then
  echo "Please export AWS_SECRET_ACCESS_KEY"
  exit -2
fi

# Check AWS_REGION
if test -z "$AWS_REGION"; then
  echo "AWS_REGION not set, using us-east-1"
  AWS_REGION='us-east-1'
fi

# Check BUCKET_NAME
if test -z "$BUCKET_NAME"; then
  echo "Please export BUCKET_NAME"
  exit -3
fi

cd ansible
ansible-playbook deploy.yml \
  -e "cloudformation_bucket=$BUCKET_NAME" \
  -i '127.0.0.1,' -v
