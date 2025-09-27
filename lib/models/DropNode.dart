class DropNode {
  final String label;
  final bool selectable;          // false => header/group only
  final List<DropNode> children;  // nested items

  const DropNode.header(this.label, {this.children = const []}) : selectable = false;
  const DropNode.item(this.label) : selectable = true, children = const [];
}