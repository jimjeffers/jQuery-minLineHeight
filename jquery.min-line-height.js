(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  jQuery.fn.minLineHeight = function(amount) {
    var calculateLineHeight, elements, minLineHeight, parseUnits;
    parseUnits = function(value) {
      return {
        value: parseFloat(value.replace(/[a-zA-Z]/g, "")),
        units: value.replace(/[^a-zA-Z]/g, "")
      };
    };
    calculateLineHeight = function(element) {
      var currentLineHeight, currentWidthDiff, fontSize, lineHeightRange, maxLineHeight, maxWidth, minLineHeightPx, minWidth, width, widthRange, widthRatio;
      width = element.width();
      maxWidth = parseUnits(element.css("max-width"));
      minWidth = parseUnits(element.css("min-width"));
      maxLineHeight = parseUnits(element.data("max-line-height"));
      fontSize = parseUnits(element.css("font-size"));
      if (minLineHeight.units !== "px") {
        minLineHeightPx = minLineHeight.value * fontSize.value;
      } else {
        minLineHeightPx = minLineHeight.value;
      }
      widthRange = maxWidth.value - minWidth.value;
      currentWidthDiff = element.width() - minWidth.value;
      widthRatio = currentWidthDiff / widthRange;
      lineHeightRange = maxLineHeight.value - minLineHeightPx;
      currentLineHeight = minLineHeightPx + lineHeightRange * widthRatio;
      element.css("line-height", "" + currentLineHeight + "px");
      return element;
    };
    minLineHeight = parseUnits("" + amount);
    elements = [];
    this.each(function() {
      var el;
      el = $(this);
      if (el.css("max-width") !== "none" && el.css("min-width") !== "none" && el.css("line-height") !== "none") {
        el.attr("data-max-line-height", el.css("line-height"));
        return elements.push(calculateLineHeight(el));
      }
    });
    return $(window).resize(__bind(function() {
      var element, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = elements.length; _i < _len; _i++) {
        element = elements[_i];
        _results.push(calculateLineHeight(element));
      }
      return _results;
    }, this));
  };
}).call(this);
