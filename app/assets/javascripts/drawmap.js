$(document).ready(function() {
  
  //draw the world map

  //only draw it once
  if ($('.jvectormap-container').length > 0) {
  var parent = document.getElementById('worldmap');
  parent.removeChild(parent.childNodes[0]);
  }
$(function(){
    var map;
    map = new jvm.WorldMap({
    container: $('#worldmap'),
    map: 'world_mill_en',
    zoomAnimate: true,
    regionsSelectable: true,
    regionsSelectableOne: true,
    regionStyle: {
      initial: {
    fill: '#333',
    "fill-opacity": 1,
    stroke: '#fff',
    "stroke-width": 1,
    "stroke-opacity": .2
      },
      selected: {
        fill: '#F7DF2D',
        "fill-opacity": 1
      },
      hover: {
        fill: '#FFE62B',
        "fill-opacity": 1
      }
    },
    backgroundColor: 'transparent',
      onRegionLabelShow: function(e, el, code){
    e.preventDefault();
      },
      onRegionSelected: function(){
        var region = map.getSelectedRegions();
        $.get( "map/" +region+ "")
    }});
});
});