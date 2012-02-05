# Min-line-height:

Created in response to Tim Brown's article Molten Leading (http://nicewebtype.com/notes/2012/02/03/molten-leading-or-fluid-line-height/)

Script written by J. Jeffers - for latest please visit repository on github (https://github.com/jimjeffers/jQuery-minLineHeight)

# Usage:

Select applicable elements with jQuery and pass an amount:

> $("#content p").minLineHeight(1.3) 

The minimum line height can be supplied in the following ways:

> $("#content p").minLineHeight(1.3) 
> $("#content p").minLineHeight("1.3rem") 
> $("#content p").minLineHeight("13px")

If the amount is passed as a float or any units other than px then the script will default to ems.