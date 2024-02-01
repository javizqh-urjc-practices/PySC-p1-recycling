(define (problem recycling_gripper)
(:domain recycling_gripper)
; We define 3 different items, 2 types of trash bins, one table and a robot
(:objects
  table floor - location
  organic_trashbin - location
  paper_trashbin - location
  bottle newspaper rotten_apple laptop - item
  walle eva - robot
  grip1_walle grip2_walle grip_eva - gripper
)

; Initially everything is on the floor and robot is by the table
(:init
  (robot_at walle table)
  (robot_at eva organic_trashbin)
  (gripper_free grip1_walle)
  (gripper_free grip2_walle)
  (gripper_free grip_eva)
  (robot_gripper grip1_walle walle)
  (robot_gripper grip2_walle walle)
  (robot_gripper grip_eva eva)
  (item_at bottle floor)
  (item_at laptop paper_trashbin)
  (item_at newspaper floor)
  (item_at rotten_apple floor)
)

; The goal is to clean the floor!
(:goal (and
    (item_at bottle table)
    (item_at rotten_apple organic_trashbin)
    (item_at newspaper paper_trashbin)
    (item_at laptop table)
  )
)

)
