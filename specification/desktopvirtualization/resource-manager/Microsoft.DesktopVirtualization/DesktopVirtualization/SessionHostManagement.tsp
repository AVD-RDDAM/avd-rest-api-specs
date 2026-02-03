import "@typespec/versioning";
import "@azure-tools/typespec-azure-core";
import "@azure-tools/typespec-azure-resource-manager";
import "@typespec/openapi";
import "@typespec/rest";
import "./models.tsp";
import "./HostPool.tsp";
import "./CustomOperations.tsp";

using TypeSpec.Rest;
using Azure.ResourceManager;
using TypeSpec.Http;
using Versioning;

namespace Microsoft.DesktopVirtualization;
/**
 * Schema for SessionHostManagement properties.
 */
@parentResource(HostPool)
@singleton("default")
model SessionHostManagement
  is Azure.ResourceManager.ProxyResource<
    SessionHostManagementProperties,
    false
  > {
  ...ResourceNameParameter<
    Resource = SessionHostManagement,
    KeyName = "sessionHostManagements",
    NamePattern = "^[A-Za-z0-9@.\\-_ ]*$"
  >;
}
@introducedIn("2023-11-01-preview")@introducedIn("2023-11-01-preview")
@added(Versions.vLatestPreview)
@armResourceOperations
interface InitiateSessionHostUpdate {
  /**
   * Initiates a hostpool update or schedule an update for the future.
   */
  #suppress "@azure-tools/typespec-client-generator-core/no-unnamed-types" "Backwards compatibility with existing clients."
  @action("initiateSessionHostUpdate")
  post is ArmResourceActionSync<
    SessionHostManagement,
    Request = {
      /**
       * The resource properties to be updated
       */
      @bodyRoot updateSessionHostsRequestBody?: UpdateSessionHostsRequestBody;
    },
    Response = void
  >;
}

@introducedIn("2023-11-01-preview")
@added(Versions.vLatestPreview)
@armResourceOperations
interface ControlSessionHostUpdate {
  /**
   * Control actions on a session host update.
   */
  @action("controlSessionHostUpdate")
  post is ArmResourceActionNoResponseContentAsync<
    SessionHostManagement,
    HostPoolUpdateControlParameter
  >;
}

@introducedIn("2023-11-01-preview")
@added(Versions.vLatestPreview)
@armResourceOperations
@tag("SessionHostManagement")
interface ControlSessionHostProvisioning {
  /**
   * Control provisioning of a hostpool.
   */
  @action("controlSessionHostProvisioning")
  post is ArmResourceActionNoResponseContentAsync<
    SessionHostManagement,
    HostPoolProvisioningControlParameter
  >;
}

#suppress "@azure-tools/typespec-azure-resource-manager/no-resource-delete-operation" "Service doesn't allow delete"
@introducedIn("2023-11-01-preview")
@added(Versions.vLatestPreview)
@armResourceOperations
interface SessionHostManagements {
  /**
   * Get a SessionHostManagement.
   */
  get is ArmResourceRead<SessionHostManagement>;

  /**
   * Create or update a SessionHostManagement.
   */
  createOrUpdate is ArmResourceCreateOrReplaceSync<SessionHostManagement>;

  /**
   * Update a SessionHostManagement.
   */
  @patch(#{ implicitOptionality: false })
  update is ArmCustomPatchSync<
    SessionHostManagement,
    Response = SessionHostManagement,
    Request = {
      /**
       * The properties to be updated.
       */
      @bodyRoot sessionHostManagement?: SessionHostManagementPatch;
    }
  >;

  /**
   * List SessionHostManagements.
   */
  listByHostPool is ArmResourceListByParent<
    SessionHostManagement,
    Response = SessionHostManagementList
  >;
}

@@maxLength(SessionHostManagement.name, 24);
@@minLength(SessionHostManagement.name, 3);
@@doc(SessionHostManagement.name, "The name of the sessionHostManagement");
@@doc(SessionHostManagement.properties,
  "Detailed properties for SessionHostManagement"
);
