# Prolog
**Treap**

map-put - sets a key-value pair

map-get - checks whether a key exists in a map

map-remove - removes a pair with a given key

map-replace - replaces a value if a key is found

---

## The original task
Implement an associative array (map).

**Develop rules:**

| Rule | Description |
| ---- | ----------- |
| `tree_build(ListMap, TreeMap)` | Building a tree from an ordered set of key-value pairs |
| `map_get(TreeMap, Key, Value)` | Checking that the tree contains the given key-value pair. |
| `map_put(TreeMap, Key, Value, Result)` | Adding a key-value pair to the tree, or replacing the current value for the key. |
| `map_remove(TreeMap, Key, Result)` | Removing the mapping for the key. |
| `map_replace(Map, Key, Value, Result)` | Replacing a value for the key values with the specified one, if the key existed in the map. |

**Rules should not analyze the tail of a list unless it has the required key.**
