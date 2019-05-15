(*
  1 Suspicious-looking start-of-comment mark.
  2 Suspicious-looking end-of-comment mark.
  3 Deprecated feature.
  4 Fragile pattern matching: matching that will remain complete even
    if additional constructors are added to one of the variant types
    matched.
  5 Partially applied function: expression whose result has function
    type and is ignored.
  6 Label omitted in function application.
  7 Method overridden.
  8 Partial match: missing cases in pattern-matching.
  9 Missing fields in a record pattern.
 10 Expression on the left-hand side of a sequence that doesn't have type
    "unit" (and that is not a function, see warning number 5).
 11 Redundant case in a pattern matching (unused match case).
 12 Redundant sub-pattern in a pattern-matching.
 13 Instance variable overridden.
 14 Illegal backslash escape in a string constant.
 15 Private method made public implicitly.
 16 Unerasable optional argument.
 17 Undeclared virtual method.
 18 Non-principal type.
 19 Type without principality.
 20 Unused function argument.
 21 Non-returning statement.
 22 Preprocessor warning.
 23 Useless record "with" clause.
 24 Bad module name: the source file name is not a valid OCaml module name.
 25 Deprecated: now part of warning 8.
 26 Suspicious unused variable: unused variable that is bound
    with "let" or "as", and doesn't start with an underscore ("_")
    character.
 27 Innocuous unused variable: unused variable that is not bound with
    "let" nor "as", and doesn't start with an underscore ("_")
    character.
 28 Wildcard pattern given as argument to a constant constructor.
 29 Unescaped end-of-line in a string constant (non-portable code).
 30 Two labels or constructors of the same name are defined in two
    mutually recursive types.
 31 A module is linked twice in the same executable.
 32 Unused value declaration.
 33 Unused open statement.
 34 Unused type declaration.
 35 Unused for-loop index.
 36 Unused ancestor variable.
 37 Unused constructor.
 38 Unused extension constructor.
 39 Unused rec flag.
 40 Constructor or label name used out of scope.
 41 Ambiguous constructor or label name.
 42 Disambiguated constructor or label name (compatibility warning).
 43 Nonoptional label applied as optional.
 44 Open statement shadows an already defined identifier.
 45 Open statement shadows an already defined label or constructor.
 46 Error in environment variable.
 47 Illegal attribute payload.
 48 Implicit elimination of optional arguments.
 49 Absent cmi file when looking up module alias.
 50 Unexpected documentation comment.
 51 Warning on non-tail calls if @tailcall present.
 52 Fragile constant pattern.
 53 Attribute cannot appear in this context
 54 Attribute used more than once on an expression
 55 Inlining impossible
 56 Unreachable case in a pattern-matching (based on type information).
 57 Ambiguous or-pattern variables under guard
 58 Missing cmx file
 59 Assignment to non-mutable value
 60 Unused module declaration
 61 Unboxable type in primitive declaration
 62 Type constraint on GADT type declaration
  A all warnings
  C warnings 1, 2.
  D Alias for warning 3.
  E Alias for warning 4.
  F Alias for warning 5.
  K warnings 32, 33, 34, 35, 36, 37, 38, 39.
  L Alias for warning 6.
  M Alias for warning 7.
  P Alias for warning 8.
  R Alias for warning 9.
  S Alias for warning 10.
  U warnings 11, 12.
  V Alias for warning 13.
  X warnings 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 30.
  Y Alias for warning 26.
  Z Alias for warning 27.
*)
