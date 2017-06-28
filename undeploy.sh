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
  echo "AWS_REGION not exported, using default"
fi

# Check BUCKET_NAME
if test -z "$BUCKET_NAME"; then
  echo "Please export BUCKET_NAME"
  exit -3
fi

if test -z "$DELETE_BUCKET"; then
  echo "DELETE_BUCKET not exported as true, S3 bucket will remain"
  DELETE_BUCKET=false
fi

cd ansible
ansible-playbook undeploy.yml \
  -e "cloudformation_bucket=$BUCKET_NAME" \
  -e "delete_bucket=$DELETE_BUCKET" \
  -i '127.0.0.1,' -v
