#!/bin/bash
kind="Deployment"
name="my-nginx"

# Read the JSON object
json_object=$(cat sample.json)

# Get the manifest string
manifest=$(echo "$json_object" | jq -r '.manifest')

# Store the formatted YAML file
# formatted_yaml=$(echo "$manifest" | yq r - | sed 's/^  //g')


# Format the YAML string
formatted_yaml=$(echo -e "$manifest" | yq eval -)

result_yaml=$(echo -e "$formatted_yaml" | awk -v kind="$kind" -v name="$name" '
  /^kind: / { is_kind = ($2 == kind); is_name = 0; }
  is_kind && /^  name: / { is_name = ($2 == name); }
  is_kind && is_name && /replicas:/ { next; }
  { print; }
')

# echo "$result_yaml" > processed_formatted.yaml
# echo "$result_yaml" | sed -e :a -e '$!N;s/\n/\\n/;ta' > processed.txt

# Update the manifest key in the JSON object
updated_json=$(echo "$json_object" | jq '.manifest = "'"$result_yaml"'"')

# Print the modified JSON object
echo "$updated_json" > output1.json
