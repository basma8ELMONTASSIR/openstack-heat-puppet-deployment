#!/bin/bash

# Load OpenStack credentials
source ~/devstack/openrc admin admin

# Deploy the stack
openstack stack create -t ../heat-templates/infrastructure.yaml \
  --parameter key_name=my_key \
  --wait \
  my-stack
