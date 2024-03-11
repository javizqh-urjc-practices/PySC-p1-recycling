(define (domain recycling_gripper)
(:requirements :strips :typing)


; Types definition
(:types
  location
  gripper
  robot
  item
)

(:predicates
  (robot_at ?r - robot ?l - location)
  (item_at ?it - item ?l - location)
  (robot_gripper ?g - gripper ?r - robot)
  (gripper_free ?g - gripper)
  (gripper_carry ?g - gripper ?it - item)
)

; Move action. The robot moves from one location (A) to another (B).
; The only precondition is that the robot must be in the initial location.
; Consequence: The robot is now at B and not at A.
(:action move
  :parameters (?r - robot ?from ?to - location)
  :precondition
    (and 
      (robot_at ?r ?from)
    )
  :effect
    (and
      (robot_at ?r ?to)
      (not (robot_at ?r ?from))
    )
)

; Pick-up action. The robot picks an object at a location.
; Both the robot and the object must be in that location.
; The robot's gripper must be free.
; Consequences:
;     - The item is no longer at the given location.
;     - The robot is now carrying the object and its gripper is not free.
(:action pick
  :parameters (?it - item ?l - location ?r - robot ?g - gripper)
  :precondition 
    (and
      (item_at ?it ?l)
      (robot_at ?r ?l)
      (robot_gripper ?g ?r)
      (gripper_free ?g)
    )
:effect
  (and
    (gripper_carry ?g ?it)
    (not (item_at ?it ?l))
    (not (gripper_free ?g)))
  )

; Drop-off action. The robot drops an object at a location.
; The robot must be in that location and must be carrying that object.
; Consequences:
;     - The item is now at the given location.
;     - The robot is no longer carrying the object and its gripper is free.
(:action drop
:parameters (?it - item ?l - location ?r - robot ?g - gripper)
:precondition
  (and 
    (robot_at ?r ?l)
    (robot_gripper ?g ?r)
    (gripper_carry ?g ?it)
  )
:effect 
  (and 
    (item_at ?it ?l)
    (gripper_free ?g)
    (not (gripper_carry ?g ?it))
  )
)

)

(define (domain recycling_gripper)
(:requirements :strips :typing)


; Types definition
(:types
  location
  gripper
  robot
  item
)

(:predicates
  (robot_at ?r - robot ?l - location)
  (item_at ?it - item ?l - location)
  (robot_gripper ?g - gripper ?r - robot)
  (gripper_free ?g - gripper)
  (gripper_carry ?g - gripper ?it - item)
)

; Move action. The robot moves from one location (A) to another (B).
; The only precondition is that the robot must be in the initial location.
; Consequence: The robot is now at B and not at A.
(:action move
  :parameters (?r - robot ?from ?to - location)
  :precondition
    (and 
      (robot_at ?r ?from)
    )
  :effect
    (and
      (robot_at ?r ?to)
      (not (robot_at ?r ?from))
    )
)

; Pick-up action. The robot picks an object at a location.
; Both the robot and the object must be in that location.
; The robot's gripper must be free.
; Consequences:
;     - The item is no longer at the given location.
;     - The robot is now carrying the object and its gripper is not free.
(:action pick
  :parameters (?it - item ?l - location ?r - robot ?g - gripper)
  :precondition 
    (and
      (item_at ?it ?l)
      (robot_at ?r ?l)
      (robot_gripper ?g ?r)
      (gripper_free ?g)
    )
:effect
  (and
    (gripper_carry ?g ?it)
    (not (item_at ?it ?l))
    (not (gripper_free ?g)))
  )

; Drop-off action. The robot drops an object at a location.
; The robot must be in that location and must be carrying that object.
; Consequences:
;     - The item is now at the given location.
;     - The robot is no longer carrying the object and its gripper is free.
(:action drop
:parameters (?it - item ?l - location ?r - robot ?g - gripper)
:precondition
  (and 
    (robot_at ?r ?l)
    (robot_gripper ?g ?r)
    (gripper_carry ?g ?it)
  )
:effect 
  (and 
    (item_at ?it ?l)
    (gripper_free ?g)
    (not (gripper_carry ?g ?it))
  )
)

)
