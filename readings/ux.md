# User Experices

### Theories

1. 1970s 4-level Aproach <Foley and Van Dam>
    a. Conceptual level
        - user mental model
        - set of familiar task-oriented objects and actions the user needs to know about to use the system.
        - ex. character, files, paragraph -> deleting, insert 
    b. Semantic level
        - desc the meaning conveyed by user command input and output display
        - specification of the actions from user mental model
        - ex. move the paragraph
    c. Syntactic level
        - how to perform a certain task.
        - how semantic command is formed.
        - ex. prefix vs postfix ( Edit )
    d. Lexical level
        - device dependencies
        - sequences of the actions
        - ex. Point to edit on menu bar->click ->select option within edit menu.

2. 1983 GOMS and the keystroke-level model by Card, Moran, Newell
    - GOMS = Goals / Operations / Methods / Selection Rules
    - Keystroke-Level = the time for keystroking, poiting, homing, drawing, thinking, waiting for system respond
    - GOMS example
        - G is like Edit document, sub goal is insert word.
        - Os are execution which is necessary to change aspect users' mental state of effect task env
            - press up-arrow key, move hand to mouse
            - recall file name, verify cursor ...
        - M = procedure for accomplishing a goal. ? set of operations
        - S = control structures for choosing methods
            - delete by repeated backspace
            - delete by select text and press Del
    - GOMS dose not explain in any detail how the notation works.

3. 1985 Kieras introduce NGOMSL
    - N for Natureal and L for Language
    - NGOMSL example
        > method 1 delete text
        >   step 1 ...
        >   step 2 ...
        > method 2 delete text
        >   step 1 ...
        >   step 2 ...
        >   step 3 ...
        > selection rules
        >   ......

4. 1988 Norman introduced 7 stags of actions
    - metal actions [execution]
        1. Forming the goal
        2. Forming the intention
        3. Specify the action
    - pshyical action [execution]
        4. Executing the action
    - metal actions [evaluation]
        5. Perceiving the system state
        6. Interpreting the system state
        7. Evaluating the outcome
    - [1-4]{ Execution } <--> {Evaluatoin}[5-7]
    - this model lead to 4 principle design
        1. The state and the action alternatives should be visible.
        2. There shoud be good conceptual model with a consistent system image.
        3. UI should includes good mappings that reveal the relationship btw stages.
        4. User should receive continous feedback.

5. 1980 SSOA by Shneiderman 
    - SSOA = Systactic-Semantic object-action
    - a representation of the user's knowledge in long-term mem.
    - syntacitc knowledge is varied, device dependent, easily forgotten, rote memorization
    - example which action erase a char ( delete, backspace, CTRL-H )
    - semantic knowledge is store in long-term mem 
        - task concept
        - computer concept
    - example of all knowledge in writing business letter using computer sw.
        - the user must have the high-level concept of writing (task action)
        - the letter (task object)
        - knowing the detail of save command (computer action and syntactic) 
        - file ( computer object )
        - user must know how to compose the sentence and recogize the mechanism for begining writing and ending a sentence (middle-level).
        - user must know the spelling each word (low-level task)
        - knowing which key to press (syntactic)
        - comprehend the motion of the cursor (computer concept)
