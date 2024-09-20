# Datenreisende Library Chart Repository

Welcome to the official **Datenreisende** Helm Library Chart repository! This repository hosts the Helm library charts used to standardize and simplify the deployment of applications and services in my HomeLab. These library charts provide reusable templates and best practices that can be shared across multiple Helm charts.



## Available Helm Charts

| Chart Name | Version | Type |
|------------|---------|------|
| helmlet | 0.1.7 | library |
## How to Add This Repository
To add this Helm library chart repository to your local Helm client, you can use the following command:

```bash
helm repo add library-charts https://datenreisende.github.io/library-charts
```

After adding the repository, update your local Helm repo cache:
```bash
helm repo update
```

## Using Library Charts

Using as a Dependency

To use a library chart from this repository as a dependency in your Helm chart, add the following to your Chart.yaml:
```yaml
dependencies:
  - name: helmlet
    version: "<LATEST_VERSION>"
    repository: "https://datenreisende.github.io/library-charts"
```
Replace <LATEST_VERSION> with the latest version available in this repository.

Then, in your Helm chart templates, you can use the library chart as a template:

```yaml
{{- include "helmlet.app" . }}
```

## OCI Support
You can also pull the library charts from the OCI registry:
```bash
helm pull oci://ghcr.io/datenreisende/library-charts/helmlet --version <LATEST_VERSION>
```
Replace <LATEST_VERSION> with the version you need.

## Pre-Built Charts

For ready-to-use Helm charts that utilize these library charts, visit the Datenreisende Helm Chart Repository. This repository contains a collection of application-specific Helm charts designed for various use cases in my HomeLab.

https://datenreisende.github.io/charts

## Contributing

If you would like to contribute to this repository, feel free to submit a pull request. Contributions in the form of new charts, updates to existing charts, or improvements to the documentation are always welcome!

## License

This repository is licensed under the MIT License. See the LICENSE file for more details.
