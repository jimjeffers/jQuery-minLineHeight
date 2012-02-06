# Min-line-height:

Created in response to Tim Brown's article Molten Leading:
http://nicewebtype.com/notes/2012/02/03/molten-leading-or-fluid-line-height/

# Usage:

Select applicable elements with jQuery and pass an amount:

`$("#content p").minLineHeight(1.3)`

The minimum line height can be supplied in the following ways -

A float:
`$("#content p").minLineHeight(1.3)`  

As ems:
`$("#content p").minLineHeight("1.3rem")` 

As px:
`$("#content p").minLineHeight("13px")`

If the amount is passed as a float or any units other than px, the script will default to ems. In order for min-line-height to take effect an element must have a min-width, max-width, and default line-height (serves as the max-line-height) specified in CSS. Any element without one of the three properties will simply not get processed.

# Why you can't use custom CSS properties to handle this:

Ideally, specifying them min-line-height in a CSS file would be the more manageable, but research found that per the CSS 2.1 mandates browsers to ignore any unrecognized properties:

http://stackoverflow.com/questions/9143501/is-it-possible-to-utilize-a-custom-css-properties-with-javascript/9143684#9143684

This means the only way to access a property defined as...

`-js-min-line-height: 1.3`

...would be by re-requesting the CSS file with an AJAX request and parsing the CSS file in javascript. This wouldn't be effective for a number of performance reasons.