import "@typespec/versioning";
import "@azure-tools/typespec-azure-resource-manager";
import "./fleet.tsp";
import "./fleetmember.tsp";
import "./gate.tsp";
import "./update/common.tsp";
import "./update/run.tsp";
import "./update/strategy.tsp";
import "./update/autoupgradeprofile.tsp";

using Azure.ResourceManager;
using TypeSpec.Http;
using TypeSpec.Versioning;
using TypeSpec.OpenAPI;

@armProviderNamespace
@service(#{ title: "ContainerServiceFleetClient" })
@doc("Azure Kubernetes Fleet Manager api client.")
@versioned(Versions)
namespace Microsoft.ContainerService;

interface Operations extends Azure.ResourceManager.Operations {}

@doc("Azure Kubernetes Fleet Manager api versions.")
enum Versions {
  @doc("Azure Kubernetes Fleet Manager api version 2022-09-02-preview.")
  @useDependency(Azure.ResourceManager.Versions.v1_0_Preview_1)
  v2022_09_02_preview: "2022-09-02-preview",

  @doc("Azure Kubernetes Fleet Manager api version 2023-03-15-preview.")
  @useDependency(Azure.Core.Versions.v1_0_Preview_2)
  @useDependency(Azure.ResourceManager.Versions.v1_0_Preview_1)
  v2023_03_15_preview: "2023-03-15-preview",

  @doc("Azure Kubernetes Fleet Manager api version 2023-06-15-preview.")
  @useDependency(Azure.Core.Versions.v1_0_Preview_2)
  @useDependency(Azure.ResourceManager.Versions.v1_0_Preview_1)
  v2023_06_15_preview: "2023-06-15-preview",

  @doc("Azure Kubernetes Fleet Manager api version 2023-08-15-preview.")
  @useDependency(Azure.Core.Versions.v1_0_Preview_2)
  @useDependency(Azure.ResourceManager.Versions.v1_0_Preview_1)
  v2023_08_15_preview: "2023-08-15-preview",

  @doc("Azure Kubernetes Fleet Manager api version 2023-10-15.")
  @useDependency(Azure.Core.Versions.v1_0_Preview_2)
  @useDependency(Azure.ResourceManager.Versions.v1_0_Preview_1)
  v2023_10_15: "2023-10-15",

  @doc("Azure Kubernetes Fleet Manager api version 2024-02-02-preview.")
  @useDependency(Azure.Core.Versions.v1_0_Preview_2)
  @useDependency(Azure.ResourceManager.Versions.v1_0_Preview_1)
  v2024_02_02_preview: "2024-02-02-preview",

  @doc("Azure Kubernetes Fleet Manager api version 2024-04-01.")
  @useDependency(Azure.Core.Versions.v1_0_Preview_2)
  @useDependency(Azure.ResourceManager.Versions.v1_0_Preview_1)
  v2024_04_01: "2024-04-01",

  @doc("Azure Kubernetes Fleet Manager api version 2024-05-02-preview.")
  @useDependency(Azure.Core.Versions.v1_0_Preview_2)
  @useDependency(Azure.ResourceManager.Versions.v1_0_Preview_1)
  v2024_05_02_preview: "2024-05-02-preview",

  @doc("Azure Kubernetes Fleet Manager api version 2025-03-01.")
  @useDependency(Azure.Core.Versions.v1_0_Preview_2)
  @useDependency(Azure.ResourceManager.Versions.v1_0_Preview_1)
  @armCommonTypesVersion(Azure.ResourceManager.CommonTypes.Versions.v5)
  v2025_03_01: "2025-03-01",

  @doc("Azure Kubernetes Fleet Manager api version 2025-04-01-preview.")
  @useDependency(Azure.Core.Versions.v1_0_Preview_2)
  @useDependency(Azure.ResourceManager.Versions.v1_0_Preview_1)
  @armCommonTypesVersion(Azure.ResourceManager.CommonTypes.Versions.v5)
  v2025_04_01_preview: "2025-04-01-preview",
}
