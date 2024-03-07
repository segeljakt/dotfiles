;; extends

;; Highlight all item declarations

(struct_item name: (type_identifier) @type.definition)
(enum_item name: (type_identifier) @type.definition)
(enum_variant name: (identifier) @type.definition)
(type_item name: (type_identifier) @type.definition)
(use_declaration argument: (scoped_identifier name: (identifier) @type.definition))

(use_wildcard (identifier) @namespace)
("::" @namespace)

;; Builtin types --------------------------------------------------------------
((type_identifier) @custom.type.std
 (#any-of? @custom.type.std
    "Option" "Result" "Vec" "String" "Rc" "Box" "HashMap"
    "RefCell" "Cow" "Cell" "Arc" "Mutex" "RwLock" "BTreeMap" "BTreeSet"
    "BinaryHeap" "LinkedList" "VecDeque" "HashSet"
    "Range" "RangeFrom" "RangeFull" "RangeInclusive" "RangeTo" "RangeToInclusive"
    "IpAddr" "Ipv4Addr" "Ipv6Addr" "SocketAddr" "SocketAddrV4" "SocketAddrV6"
    "OsString" "Path" "PathBuf" "Url"
    "Duration" "Instant" "SystemTime" "SystemTimeError" "SystemTime" "SystemTimeError"
    "Error" "ErrorKind" "Result" "FromStr" "From" "Into" "TryFrom" "TryInto" "Try"
    "Borrow" "BorrowMut" "ToOwned" "AsRef" "AsMut" "Deref" "DerefMut" "From" "Into"
))

(scoped_identifier path: (identifier) @custom.path.std 
 (#any-of? @custom.path.std
    "Option" "Result" "Vec" "String" "Rc" "Box" "HashMap"
    "RefCell" "Cow" "Cell" "Arc" "Mutex" "RwLock" "BTreeMap" "BTreeSet"
    "BinaryHeap" "LinkedList" "VecDeque" "HashSet"
    "Range" "RangeFrom" "RangeFull" "RangeInclusive" "RangeTo" "RangeToInclusive"
    "IpAddr" "Ipv4Addr" "Ipv6Addr" "SocketAddr" "SocketAddrV4" "SocketAddrV6"
    "OsString" "Path" "PathBuf" "Url"
    "Duration" "Instant" "SystemTime" "SystemTimeError" "SystemTime" "SystemTimeError"
    "Error" "ErrorKind" "Result" "FromStr" "From" "Into" "TryFrom" "TryInto" "Try"
    "Borrow" "BorrowMut" "ToOwned" "AsRef" "AsMut" "Deref" "DerefMut" "From" "Into"
))

;; Builtin traits -------------------------------------------------------------
((type_identifier) @custom.trait.std
 (#any-of? @custom.trait.std "Fn" "FnOnce" "FnMut"))
;; Builtin variables ----------------------------------------------------------
((type_identifier) @variable.builtin 
 (#any-of? @variable.builtin "Self"))

;; Builtin derives ------------------------------------------------------------

(attribute_item
  (attribute
    ((identifier) @id (#eq? @id "derive"))
    arguments: (token_tree (identifier) @custom.macro.std (#match? @custom.macro.std "^(Debug|Clone|PartialEq|Eq|Hash|PartialOrd|Ord)$"))
    )
  )

((identifier) @type.builtin (#match? @type.builtin "^Self$"))
((crate) @keyword)

(attribute_item (attribute (identifier) @custom.macro.attribute))
(attribute (scoped_identifier (identifier) @custom.macro.attribute .))
(attribute_item ((_) @custom.macro.attribute))

;; Brackets

(type_arguments (["<" ">"] @custom.type.brackets))
(attribute_item (["[" "]"] @custom.macro.brackets))
(attribute arguments: (token_tree ["(" ")"] @custom.macro.inner.brackets))
