# Min-line-height:

Created in response to Tim Brown's article Molten Leading:
http://nicewebtype.com/notes/2012/02/03/molten-leading-or-fluid-line-height/

# Usage:

Select applicable elements with jQuery and pass an amount:

`$("#content p").minLineHeight(1.3)`

The minimum line height can be supplied in the following ways:

`$("#content p").minLineHeight(1.3)` or `$("#content p").minLineHeight("1.3rem")` or `$("#content p").minLineHeight("13px")`

If the amount is passed as a float or any units other than px, the script will default to ems.

# Why you can't use custom CSS properties to handle this:

Ideally, specifying them min-line-height in a CSS file would be the most manageable way of maintaining the min-line-height property, but Research found that per the CSS 2.1 spec the web browser ignores any property it doesn't recognize:

http://stackoverflow.com/questions/9143501/is-it-possible-to-utilize-a-custom-css-properties-with-javascript/9143684#9143684

This means the only way to access a property defined as...

`-js-min-line-height: 1.3`

...would be by re-requesting the CSS file with an AJAX request and parsing the CSS file in javascript. This wouldn't be effective for a number of performance reasons.