# User Experience

### Theories

1. (1970s) 4-level Approach -- Foley and Van Dam
    1. Conceptual level
        - user mental model
        - set of familiar task-oriented objects and actions the user needs to know about to use the system.
        - ex. character, files, paragraph -> deleting, insert 
    2. Semantic level
        - desc the meaning conveyed by user command input and output display
        - specification of the actions from user mental model
        - ex. move the paragraph
    3. Syntactic level
        - how to perform a certain task.
        - how semantic command is formed.
        - ex. prefix vs postfix ( Edit )
    4. Lexical level
        - device dependencies
        - sequences of the actions
        - ex. Point to edit on menu bar->click ->select option within edit menu.

2. (1983) GOMS and the keystroke-level model by Card, Moran, Newell
    - GOMS = Goals / Operations / Methods / Selection Rules
    - Keystroke-Level = the time for keystroking, poiting, homing, drawing, thinking, waiting for system respond
    - GOMS example
        - G is like Edit document, sub-goal is inserting a word.
        - Os are execution which is necessary to change aspect users' mental state of effect task env
            - press up-arrow key, move a hand to the mouse
            - recall file name, verify cursor ...
        - M = procedure for accomplishing a goal. ? set of operations
        - S = control structures for choosing methods
            - delete by repeated backspace
            - delete by select text and press Del
    - GOMS does not explain in any detail how the notation works.

3. (1985) Kieras introduce NGOMSL
    - N for Natural and L for Language
    - NGOMSL example
        ```
        method 1 delete text
          step 1 ...
          step 2 ...
        method 2 delete text
          step 1 ...
          step 2 ...
          step 3 ...
        selection rules
          ......
        ```

4. (1988) Norman introduced 7 stags of actions
    - metal actions [execution]
        - 1. Forming the goal
        - 2. Forming the intention
        - 3. Specify the action
    - physical action [execution]
        - 4. Executing the action
    - metal actions [evaluation]
        - 5. Perceiving the system state
        - 6. Interpreting the system state
        - 7. Evaluating the outcome
        
    - [1-4]{ Execution } <--> {Evaluatoin}[5-7]
    - this model lead to 4 principle design
        1. The state and the action alternatives should be visible.
        2. There should be a good conceptual model with a consistent system image.
        3. UI should include good mappings that reveal the relationship btw stages.
        4. The user should receive continuous feedback.

5. (1980) SSOA by Shneiderman 
    - SSOA = Syntactic-Semantic object-action
    - a representation of the user's knowledge in long-term mem.
    - syntactic knowledge is varied, device dependent, easily forgotten, rote memorization
    - an example which action erase a char ( delete, backspace, CTRL-H )
    - semantic knowledge storing in long-term mem 
        - task concept
        - computer concept
    - an example of all knowledge in writing a business letter using computer software.
        - the user must have the high-level concept of writing (task action)
        - the letter (task object)
        - knowing the detail of save command (computer action and syntactic) 
        - file ( computer object )
        - the user must know how to compose the sentence and recognize the mechanism for beginning writing and ending a sentence (middle-level).
        - the user must know the spelling each word (low-level task)
        - knowing which key to press (syntactic)
        - comprehend the motion of the cursor (computer concept)
