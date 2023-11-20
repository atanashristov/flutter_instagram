/// Abstract base class for entities with specified ID type.
abstract class EntityBase<TId> {
  EntityBase._internal(this.id);
  final TId id;
}
