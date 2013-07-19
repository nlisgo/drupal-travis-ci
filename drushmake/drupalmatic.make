; drupal-travis make file
; How to make make files:
; https://drupal.org/node/1006620

core = 7.x
api = 2

; Change the Drupal core version to test it.
; Finally push it once it's tested.
projects[drupal][version] = 7.22

; include the d.o. profile base
includes[] = "drupal-org.make"
