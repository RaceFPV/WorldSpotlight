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
    fill: '#ccd1d9',
    "fill-opacity": 1,
    stroke: 'none',
    "stroke-width": 0,
    "stroke-opacity": 1
      },
      selected: {
        fill: '#F4A582'
      }
    },
  series: {
    regions: [{
      values: applyingData,
      scale: ['#ffc9d3', '#37bc9b'],
      normalizeFunction: 'polynomial'
    }]
  },
  onRegionLabelShow: function(e, el, code){
    el.html(el.html());
  },
    backgroundColor: '#fff',
      onRegionSelected: function(){
        var region = map.getSelectedRegions();
        $.get( "map/" +region+ "")
    }});
});
});