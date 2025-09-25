; extends

(jsx_opening_element
  "<" @tsx_tag_open_brace (#set! "priority" 110)
  name: [
    (identifier) @tsx_tag_name
    (member_expression) @tsx_tag_name
    (jsx_namespace_name) @tsx_tag_name
  ]
  ">" @tsx_tag_close_brace (#set! "priority" 110))

(jsx_closing_element
  "</" @tsx_tag_open_brace (#set! "priority" 110)
  name: [
    (identifier) @tsx_tag_name
    (member_expression) @tsx_tag_name
    (jsx_namespace_name) @tsx_tag_name
  ]
  ">" @tsx_tag_close_brace (#set! "priority" 110))

(jsx_self_closing_element
  "<" @tsx_tag_open_brace (#set! "priority" 110)
  name: [
    (identifier) @tsx_tag_name
    (member_expression) @tsx_tag_name
    (jsx_namespace_name) @tsx_tag_name
  ]
  "/>" @tsx_tag_close_brace (#set! "priority" 110))

(jsx_attribute
  (property_identifier) @tsx_attribute
  "=" @tsx_attribute_equal_sign
  (jsx_expression
    "{" @tsx_attribute_opening_bracket
    [
      (member_expression)
      (property_identifier)
      (identifier)
      (call_expression)
      (arrow_function)
      (function_expression)
      (object)
      (array)
      (string)
      (template_string)
      (number)
      (null)
      (undefined)
      (this)
      (binary_expression)
      (unary_expression)
      (update_expression)
      (ternary_expression)
      (assignment_expression)
      (parenthesized_expression)
      (jsx_element)
      (new_expression)
      (await_expression)
      (yield_expression)
      (sequence_expression)
      (spread_element)
    ] @tsx_attribute_expression
    "}" @tsx_attribute_closing_bracket))

(jsx_attribute
  (property_identifier) @tsx_attribute
  "=" @tsx_attribute_equal_sign
  (string) @tsx_attribute_string)

;;(jsx_attribute
;;  (property_identifier) @tsx_attribute_boolean)
