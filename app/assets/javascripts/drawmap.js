var title_moved = false;
  var country_codes = ["VA", "CC", "GT", "JP", "SE", "TZ", "CD", "GU", "MM", "DZ", "MN", "PK", "SG", "VC", "CF", "GW", "MO", "PL", "SH", "VE", "CG", "MP", "PM", "SI", "ZW", "CH", "GY", "MQ", "PN", "SJ", "VG", "CI", "MR", "SK", "MS", "SL", "YE", "VI", "CK", "ID", "MT", "SM", "CL", "IE", "LA", "MU", "SN", "CM", "FI", "LB", "MV", "PR", "SO", "CN", "FJ", "LC", "MW", "CO", "FK", "MX", "PT", "VN", "MY", "SR", "FM", "MZ", "CR", "PW", "FO", "ST", "IL", "LI", "PY", "BA", "CU", "SV", "CV", "FR", "IN", "LK", "VU", "BB", "IO", "CX", "RE", "UA", "SY", "CY", "IQ", "SZ", "BD", "CZ", "IR", "YT", "BE", "YU", "IS", "BF", "EC", "FX", "IT", "OM", "BG", "BH", "LR", "UG", "BI", "EE", "LS", "BJ", "LT", "EG", "EH", "LU", "RO", "UK", "BM", "LV", "BN", "UM", "BO", "KE", "NA", "LY", "BR", "KG", "NC", "BS", "HK", "KH", "BT", "KI", "NE", "QA", "RU", "US", "HM", "NF", "BV", "ER", "HN", "NG", "RW", "BW", "ES", "ET", "NI", "AD", "BY", "KM", "AE", "BZ", "HR", "KN", "TC", "AF", "NL", "TD", "UY", "AG", "HT", "KP", "UZ", "GA", "HU", "TF", "AI", "DE", "KR", "TG", "NO", "TH", "GD", "NP", "ZA", "WF", "AL", "GE", "TJ", "AM", "GF", "NR", "TK", "AN", "DJ", "KW", "AO", "DK", "TM", "GH", "MA", "KY", "NU", "TN", "DM", "GI", "KZ", "TO", "AQ", "MC", "TP", "AR", "MD", "AS", "DO", "PA", "TR", "AT", "GL", "NZ", "AU", "GM", "MG", "GN", "ZM", "MH", "TT", "AW", "PE", "SA", "GP", "WS", "PF", "SB", "TV", "CA", "GQ", "JM", "SC", "TW", "AZ", "GR", "MK", "PG", "SD", "GS", "JO", "ML", "PH"]
$(function(){
    var country_codes = ["VA", "CC", "GT", "JP", "SE", "TZ", "CD", "GU", "MM", "DZ", "MN", "PK", "SG", "VC", "CF", "GW", "MO", "PL", "SH", "VE", "CG", "MP", "PM", "SI", "ZW", "CH", "GY", "MQ", "PN", "SJ", "VG", "CI", "MR", "SK", "MS", "SL", "YE", "VI", "CK", "ID", "MT", "SM", "CL", "IE", "LA", "MU", "SN", "CM", "FI", "LB", "MV", "PR", "SO", "CN", "FJ", "LC", "MW", "CO", "FK", "MX", "PT", "VN", "MY", "SR", "FM", "MZ", "CR", "PW", "FO", "ST", "IL", "LI", "PY", "BA", "CU", "SV", "CV", "FR", "IN", "LK", "VU", "BB", "IO", "CX", "RE", "UA", "SY", "CY", "IQ", "SZ", "BD", "CZ", "IR", "YT", "BE", "YU", "IS", "BF", "EC", "FX", "IT", "OM", "BG", "BH", "LR", "UG", "BI", "EE", "LS", "BJ", "LT", "EG", "EH", "LU", "RO", "UK", "BM", "LV", "BN", "UM", "BO", "KE", "NA", "LY", "BR", "KG", "NC", "BS", "HK", "KH", "BT", "KI", "NE", "QA", "RU", "US", "HM", "NF", "BV", "ER", "HN", "NG", "RW", "BW", "ES", "ET", "NI", "AD", "BY", "KM", "AE", "BZ", "HR", "KN", "TC", "AF", "NL", "TD", "UY", "AG", "HT", "KP", "UZ", "GA", "HU", "TF", "AI", "DE", "KR", "TG", "NO", "TH", "GD", "NP", "ZA", "WF", "AL", "GE", "TJ", "AM", "GF", "NR", "TK", "AN", "DJ", "KW", "AO", "DK", "TM", "GH", "MA", "KY", "NU", "TN", "DM", "GI", "KZ", "TO", "AQ", "MC", "TP", "AR", "MD", "AS", "DO", "PA", "TR", "AT", "GL", "NZ", "AU", "GM", "MG", "GN", "ZM", "MH", "TT", "AW", "PE", "SA", "GP", "WS", "PF", "SB", "TV", "CA", "GQ", "JM", "SC", "TW", "AZ", "GR", "MK", "PG", "SD", "GS", "JO", "ML", "PH"]
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
          $('h1#main-title').animate({width: "28%"}, 750);
          title_moved = true;
        };
        var regions = selectedRegions;
        regionclick(regions);
    }});
  
    $('#random_button').on( "click", function() {
      var selected = country_codes[Math.floor(Math.random() * country_codes.length)];
      console.log(selected)
      map.clearSelectedRegions();
      map.setSelectedRegions(selected);
      $(this).fadeOut();
        setTimeout(function() {
          $('#random_button').fadeIn();
        },3000); 
    });
});
function regionclick(regions){
        $.ajax({
             async: false,
             type: 'GET',
             url: "map/" +regions,
             success: function(data) {
                  //callback
             }
        });
        $.get( "map/" +regions+ "/countryname");
        $.get( "map/" +regions+ "/glance");
        $.get( "map/" +regions+ "/background");
        $.get( "map/" +regions+ "/twitter");
        $.get( "map/" +regions+ "/news");
        $.get( "map/" +regions+ "/youtube");
}