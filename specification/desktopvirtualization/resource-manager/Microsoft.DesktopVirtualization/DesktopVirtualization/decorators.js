const introducedInKey = Symbol.for("introducedIn");

/**
 * Mark when a field or operation was introduced in a specific API version
 * @param context - The decorator context
 * @param target - The target entity (field, operation, interface, etc.)
 * @param version - The API version when this was introduced (e.g., "2023-11-01-preview")
 */
export function $introducedIn(context, target, version) {
  // Store the version information in the program state
  context.program.stateMap(introducedInKey).set(target, version);
}

/**
 * Get the introduced version for an entity
 * @param program - The TypeSpec program
 * @param target - The target entity
 * @returns The version string or undefined
 */
export function getIntroducedVersion(program, target) {
  return program.stateMap(introducedInKey).get(target);
}
