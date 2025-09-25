; extends

(import_statement
  (import_clause
    [
     (identifier) @import
     (named_imports
      (import_specifier
        name: (identifier) @import 
      ))
    ]))

(lexical_declaration
  (variable_declarator
    name: (identifier) @variable.level_1
    value:[
      (string)
      (template_string)
      (number)
      (call_expression)
      (null)
      (undefined)
      (identifier)
      (object
        (pair
          key: (property_identifier) @variable.level_2
          value: [
            (string)
            (template_string)
            (number)
            (call_expression)
            (null)
            (undefined)
            (identifier)
            (object
              (pair
                key: (property_identifier) @variable.level_3
                value:[
                  (string)
                  (template_string)
                  (number)
                  (call_expression)
                  (null)
                  (undefined)
                  (identifier)
                  (object
                    (pair
                      key: (property_identifier) @variable.level_4
                      value:[
                        (string)
                        (template_string)
                        (number)
                        (call_expression)
                        (null)
                        (undefined)
                        (identifier)
                        (object)
                      ]))
                ]))
          ]))
    ]))

(
 object
  (
   pair
    key: (property_identifier) @variable.level_2
    value: [
      (string)
      (template_string)
      (number)
      (call_expression)
      (null)
      (undefined)
      (identifier)
      (
        object
          (
           pair
            key: (property_identifier) @variable.level_3
            value: [
              (string)
              (template_string)
              (number)
              (call_expression)
              (null)
              (undefined)
              (identifier)
              (
               object
                (
                 pair
                  key: (property_identifier) @variable.level_4
                  value: [
                    (string)
                    (template_string)
                    (number)
                    (call_expression)
                    (null)
                    (undefined)
                    (identifier)
                    (object)
                  ]
                )
              )
            ]
          )
      )
    ]

  )
)
