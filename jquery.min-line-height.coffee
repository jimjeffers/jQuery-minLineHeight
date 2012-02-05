# Min-line-height:
# ===============================================================================
# Created in response to Tim Brown's article Molten Leading 
# (http://nicewebtype.com/notes/2012/02/03/molten-leading-or-fluid-line-height/)
#
# Script written by J. Jeffers - for latest please visit repository on github
# (https://github.com/jimjeffers/jQuery-minLineHeight)
#
# Usage:
# ===============================================================================
# Select applicable elements with jQuery and pass an amount:
# $("#content p").minLineHeight(1.3) 
# 
# The minimum line height can be supplied in the following ways:
# $("#content p").minLineHeight(1.3) 
# $("#content p").minLineHeight("1.3rem") 
# $("#content p").minLineHeight("13px")
#
# If the amount is passed as a float or any units other than px
# then the script will default to ems.

jQuery.fn.minLineHeight = (amount) ->
  
  # Help parse values from various units.
  parseUnits = (value) ->
    value: parseFloat value.replace(/[a-zA-Z]/g,"")
    units: value.replace(/[^a-zA-Z]/g,"")
  
  # Calculates the line height for a 
  calculateLineHeight = (element) ->
    # Properties
    width             = element.width()
    maxWidth          = parseUnits element.css("max-width")
    minWidth          = parseUnits element.css("min-width")
    maxLineHeight     = parseUnits element.data("max-line-height")
    fontSize          = parseUnits element.css("font-size")
    
    # Get proper min line height.
    if minLineHeight.units != "px"
      minLineHeightPx = minLineHeight.value*fontSize.value
    else
      minLineHeightPx = minLineHeight.value
    
    # Calculations
    widthRange        = maxWidth.value - minWidth.value
    currentWidthDiff  = element.width() - minWidth.value
    widthRatio        = currentWidthDiff / widthRange
    lineHeightRange   = maxLineHeight.value - minLineHeightPx
    currentLineHeight = minLineHeightPx + lineHeightRange * widthRatio
    
    # Set line height
    element.css("line-height","#{currentLineHeight}px")
    element
  
  # Set min-line-height
  minLineHeight = parseUnits "#{amount}"
  
  # Initial array for applicable elements.
  elements = []
  @each ->
    el = $(this)
    if el.css("max-width") != "none" and el.css("min-width") != "none" and el.css("line-height") != "none"
      el.attr("data-max-line-height",el.css("line-height"))
      elements.push calculateLineHeight el
    
  $(window).resize =>
    for element in elements
      calculateLineHeight element