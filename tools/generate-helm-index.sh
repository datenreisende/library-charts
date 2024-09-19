#!/bin/bash

# This script generates an index.yaml file for a Helm repository.
# It assumes that the charts are stored in the charts directory and that the
# repository is hosted on GitHub Pages.

# Path to the directory containing the charts
CHART_DIR="./charts"
# Base URL to the repository where the charts are hosted
BASE_URL="https://datenreisende.github.io/charts/charts/"
# Output file
OUTPUT_FILE="index.yaml"

# Start the index.yaml
echo "apiVersion: v1" > $OUTPUT_FILE
echo "entries:" >> $OUTPUT_FILE

# Loop through each directory in the charts directory
for dir in "$CHART_DIR"/*; do
  if [ -d "$dir" ]; then
    # Extract the chart name
    chart_name=$(basename "$dir")

    # Extract metadata from Chart.yaml
    chart_version=$(grep '^version:' "$dir/Chart.yaml" | awk '{print $2}')
    app_version=$(grep '^appVersion:' "$dir/Chart.yaml" | awk '{print $2}')
    description=$(grep '^description:' "$dir/Chart.yaml" | sed 's/^description: //')
    type=$(grep '^type:' "$dir/Chart.yaml" | awk '{print $2}')
    name=$(grep '^name:' "$dir/Chart.yaml" | awk '{print $2}')

    # Add the chart entry to index.yaml
    echo "  $chart_name:" >> $OUTPUT_FILE
    echo "    - apiVersion: v2" >> $OUTPUT_FILE
    echo "      appVersion: \"$app_version\"" >> $OUTPUT_FILE
    echo "      description: $description" >> $OUTPUT_FILE
    echo "      name: $name" >> $OUTPUT_FILE
    echo "      type: $type" >> $OUTPUT_FILE
    echo "      version: $chart_version" >> $OUTPUT_FILE
    echo "      urls:" >> $OUTPUT_FILE
    echo "        - $BASE_URL$chart_name/" >> $OUTPUT_FILE
  fi
done

echo "index.yaml created."
