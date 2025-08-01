# TrafficManager

> see https://aka.ms/autorest

This is the AutoRest configuration file for TrafficManager.

---

## Getting Started

To build the SDK for TrafficManager, simply [Install AutoRest](https://aka.ms/autorest/install) and in this folder, run:

> `autorest`

To see additional help and options, run:

> `autorest --help`

---

## Configuration

### Basic Information

These are the global settings for the TrafficManager API.

``` yaml
openapi-type: arm
tag: package-2022-04
```

### Suppression

``` yaml
directive:
  - suppress: OperationsAPIImplementation
    reason: We do have a operations api as "/providers/Microsoft.Network/operations"
    from: trafficmanager.json
    where: $.paths
  - suppress: RequiredPropertiesMissingInResourceModel
    reason: This will cause breaking changes in .NET SDK
    from: trafficmanager.json
    where: $.definitions.HeatMapModel
  - suppress: RequiredPropertiesMissingInResourceModel
    reason: This will cause breaking changes in .NET SDK
    from: trafficmanager.json
    where: $.definitions.TrafficManagerGeographicHierarchy
  - suppress: RequiredPropertiesMissingInResourceModel
    reason: This will cause breaking changes in .NET SDK
    from: trafficmanager.json
    where: $.definitions.Profile
  - suppress: RequiredPropertiesMissingInResourceModel
    reason: This will cause breaking changes in .NET SDK
    from: trafficmanager.json
    where: $.definitions.Endpoint
  - suppress: RequiredPropertiesMissingInResourceModel
    reason: This will cause breaking changes in .NET SDK
    from: trafficmanager.json
    where: $.definitions.UserMetricsModel
```

### Tag: package-preview-2024-04

These settings apply only when `--tag=package-preview-2024-04` is specified on the command line.

```yaml $(tag) == 'package-preview-2024-04'
input-file:
  - Microsoft.Network/preview/2024-04-01-preview/trafficmanager.json
```

### Tag: package-2022-04

These settings apply only when `--tag=package-2022-04` is specified on the command line.

```yaml $(tag) == 'package-2022-04'
input-file:
  - Microsoft.Network/stable/2022-04-01/trafficmanager.json
```
### Tag: package-preview-2022-04

These settings apply only when `--tag=package-preview-2022-04` is specified on the command line.

``` yaml $(tag) == 'package-preview-2022-04'
input-file:
  - Microsoft.Network/preview/2022-04-01-preview/trafficmanager.json
```

### Tag: package-2018-08

These settings apply only when `--tag=package-2018-08` is specified on the command line.

``` yaml $(tag) == 'package-2018-08'
input-file:
- Microsoft.Network/stable/2018-08-01/trafficmanager.json
```

### Tag: package-2018-04

These settings apply only when `--tag=package-2018-04` is specified on the command line.

``` yaml $(tag) == 'package-2018-04'
input-file:
- Microsoft.Network/stable/2018-04-01/trafficmanager.json
```

### Tag: package-2018-03

These settings apply only when `--tag=package-2018-03` is specified on the command line.

``` yaml $(tag) == 'package-2018-03'
input-file:
- Microsoft.Network/stable/2018-03-01/trafficmanager.json
```

### Tag: package-2018-02

These settings apply only when `--tag=package-2018-02` is specified on the command line.

``` yaml $(tag) == 'package-2018-02'
input-file:
- Microsoft.Network/stable/2018-02-01/trafficmanager.json
- Microsoft.Network/preview/2017-09-01-preview/trafficmanageranalytics.json

# Needed when there is more than one input file
override-info:
  title: TrafficManagerManagementClient

directive:
  - suppress: R3023
    reason: it's implemented in the main network spec
    approved-by: "@fearthecowboy"

  - where: $.paths["/providers/Microsoft.Network/checkTrafficManagerNameAvailability"].post.operationId
    suppress: R2066
    reason: the name does include it.
    approved-by: "@fearthecowboy"

  - suppress: R3018
    reason: Existing API; can't change.
    approved-by: "@fearthecowboy"

  - where: $.definitions.TrafficManagerUserMetricsKeyModel.properties
    suppress: R3006
    reason: Existing API; can't change without breaking API. Will consider in future API version
    approved-by: "@fearthecowboy"

```

### Tag: package-2017-09-preview

These settings apply only when `--tag=package-2017-09-preview` is specified on the command line.

``` yaml $(tag) == 'package-2017-09-preview'
input-file:
- Microsoft.Network/stable/2017-05-01/trafficmanager.json
- Microsoft.Network/preview/2017-09-01-preview/trafficmanageranalytics.json

# Needed when there is more than one input file
override-info:
  title: TrafficManagerManagementClient
```

### Tag: package-2017-09-preview-only

These settings apply only when `--tag=package-2017-09-preview-only` is specified on the command line.

``` yaml $(tag) == 'package-2017-09-preview-only'
input-file:
- Microsoft.Network/preview/2017-09-01-preview/trafficmanageranalytics.json
```

### Tag: package-2017-05

These settings apply only when `--tag=package-2017-05` is specified on the command line.

``` yaml $(tag) == 'package-2017-05'
input-file:
- Microsoft.Network/stable/2017-05-01/trafficmanager.json
```

### Tag: package-2017-03

These settings apply only when `--tag=package-2017-03` is specified on the command line.

``` yaml $(tag) == 'package-2017-03'
input-file:
- Microsoft.Network/stable/2017-03-01/trafficmanager.json
```

### Tag: package-2015-11

These settings apply only when `--tag=package-2015-11` is specified on the command line.

``` yaml $(tag) == 'package-2015-11'
input-file:
- Microsoft.Network/stable/2015-11-01/trafficmanager.json
```

---

# Code Generation

## Swagger to SDK

This section describes what SDK should be generated by the automatic system.
This is not used by Autorest itself.

``` yaml $(swagger-to-sdk)
swagger-to-sdk:
  - repo: azure-sdk-for-net
  - repo: azure-sdk-for-python
  - repo: azure-libraries-for-java
  - repo: azure-sdk-for-go
  - repo: azure-sdk-for-node
  - repo: azure-sdk-for-js
  - repo: azure-sdk-for-ruby
    after_scripts:
      - bundle install && rake arm:regen_all_profiles['azure_mgmt_traffic_manager']
  - repo: azure-resource-manager-schemas
  - repo: azure-powershell
```

## Python

See configuration in [readme.python.md](./readme.python.md)

## Go

See configuration in [readme.go.md](./readme.go.md)

## Java

These settings apply only when `--java` is specified on the command line.
Please also specify `--azure-libraries-for-java-folder=<path to the root directory of your azure-libraries-for-java clone>`.

``` yaml $(java)
java:
  azure-arm: true
  fluent: true
  namespace: com.microsoft.azure.management.trafficmanager
  license-header: MICROSOFT_MIT_NO_CODEGEN
  payload-flattening-threshold: 1
  output-folder: $(azure-libraries-for-java-folder)/azure-mgmt-trafficmanager
```
