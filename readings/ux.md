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

6. My Theory
    - It's true content
    - benefit to user / listener / audient
    - on the right time and place
    - come from good intention.
    - polite introducing

### Principles

#### Recognize the Diversity

1. User Profile
    - Novice or first time users who have no syntactic knowledge and less symatic knowledge
    - Knowledgeable users
    - Expert frequent users -> power user

2. Task profile
    - Frequent actions might performed by special keys
    - Intermediately frequent actions -> CTRL+?
    - Less frequent actions -> goto command mode
    - Infrequent actions or complex actions -> GUI, Menu, Form Fill

3. Interactoin styles
    - Menu selection
        - *good*
            - shorten learning
            - reduces key-strokes
            - structure decision making
            - permit user of dialog-manament
            - allow easy support of error handling
        - *bad*
            - imposes danger of many menus
            - may slow frequent users.
            - consumes screen space
    - Form Filin
        - *good*
            - simplified data entry
            - requires medest training
            - make assistance convenient
            - permit use of form-manage tools
        - *bad*
            - consume screen space
    - Command language
        - *good*
            - flexible
            - appeals to "power user"
            - support user initiative
            - convenient for creating user-defined macro.
       - *bad*
            - required memo
    - Natural language
        - *good*
            - releieves burden of learning syntax
        - *bad*
            - requires clarificatoin dialog
            - more key strokes
            - not show context
            - unpredictable
    - Direct Manipulation
        - *good*
            - presents task concepts visually
            - easy to learn
            - easy to retain
            - allow errors to be avoided
            - encourages exploration
            - permit hight subjective stisfaction
        - *bad*
            - hard to program
            - GUI required

2. Dialog Design: 8 Golden Rules
    
    1. Strive for consistency
    2. Enable frequent user to use shortcuts.
    3. Offer informative feedback.
    4. Yield closure
    5. Offer simple error handling.
    6. Permit easy reversal of actions.
    7. Support internal locus of control
    8. Reduce short-term memory load (7+-2)

3. User friendliness :) are

    1. Time to learn
    2. Speed of performance
    3. Rate of error by users
    4. Retention overtime
    5. Subjective satisfaction
    
#### Usability

[10 Usability Heuristics for User Interface Design](http://designingwebinterfaces.com/6-tips-for-a-great-flex-ux-part-5)
1. __Visibiliy of system status__
2. Match between system and the real world
3. __User control and freedom__
4. Consistency and standards
5. __Error prevention__
6. Recognition rather than recall
7. Flexibility and efficiency of use
8. Aesthetic and minimalist design
9. Help users recognize, diagnose, and recover from errors
10. Help and document
        
        

#### UI Priciples

1. Typography: 5 Simple Rules
    - Start body test look good determined by these 4 typographic.
    - POINT SIZE is the size of the letters.
        - In print, 10-12pt
        - On the web, 15 - 25 px
    - LINE SPACING is the verical distance btw lines
        - It should be 120 - 145%
        - `line-height` in CSS
    - LINE LEIGHT is the horizontal width of the text block
        - It should average of 45-90 characters per line
        - PAGE MARGIN usually larger than 1 inch
    - FONT CHOICE
        - use the professional font
2. Color
    - Choose color pallete
3. Location / Position
    - eye travel time
    - mouse travel time
4. Form
    - the bold label above the fields
