; pagodaqs2 make file for local development
core = "7.x"
api = "2"

projects[drupal][version] = "7.x"
; include the d.o. profile base
includes[] = "drupal-org.make"

; +++++ Libraries +++++

; htmlpurifier
; libraries[htmlpurifier][directory_name] = "htmlpurifier"
; libraries[htmlpurifier][type] = "library"
; libraries[htmlpurifier][destination] = "libraries"
; libraries[htmlpurifier][download][type] = "get"
; libraries[htmlpurifier][download][url] = "" ; TODO add download URI

