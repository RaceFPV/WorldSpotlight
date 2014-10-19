var title_moved = false;
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
      onRegionSelected: function(e, code, isSelected, selectedRegions){
        if(title_moved === false){
          $('h1#main-title').animate({width: "28%"}, 2000);
          title_moved = true;
        };
        var regions = selectedRegions;
        regionclick(regions);
    }});
});
function regionclick(regions){
        $.get( "map/" +regions);
        $.get( "map/" +regions+ "/countryname");
        $.get( "map/" +regions+ "/glance");
        $.get( "map/" +regions+ "/background");
        $.get( "map/" +regions+ "/twitter");
        $.get( "map/" +regions+ "/news");
        $.get( "map/" +regions+ "/youtube");
}