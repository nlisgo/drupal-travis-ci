; drupal-travis make file
core = "7.x"
api = "2"

; Change the version to test it.
; Finally push it once it's tested.
projects[drupal][version] = "7.x"

; include the d.o. profile base
includes[] = "drupal-org.make"

; +++++ Libraries +++++
