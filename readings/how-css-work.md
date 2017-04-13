# How CSS Work (Simplified Version)

### HTML Rendering Process
1. HTML document sent from server loaded.
2. Browser Parsing HTML into document tree -> DOM
3. While HTML being parsed, stylesheets are interpreted and resolved called *Cascade*
    -   combining different stylesheets
    -   resolving conflicts btw CSS
    -   resolving importance!, origin, specificity

    * Specificity
      - IDs > Classes > Attributes and Pseudo-Classes[:hover] > Elements and Pseudo-Elements[:before])
      - if equal the last declaration take precedence.

4. CSS props are resolved -> CSSOM
    *   `box-sizing: border` will reduce the inner width of the content area.
    *   margins will sometimes collapse when two or more adjacent vertical margins touch ( no border and padding ) 
    *   margins will not collapse if have absolutelt positioned, floated, display(flex, grid, table)
5. Process the calculation of the Box Model called *Visual Formattig Model*
    -  positioning schemes ( absolute, float )
    -  formatting contexts ( flex, table, grid )
        - Flex containter has block outer type and flex for inner type.
    -  display modes (block, inline)
        - Display is shared btw an element and it's parent element.
        - `will-change` use for speed boost browser rendering before the element change
    -  stacking contexts (z-index, will-change)
