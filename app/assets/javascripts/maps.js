//= require jquery
//= require jquery.turbolinks
//= require jquery-ujs
//= require materialize-sprockets
//= require gmaps
//= require turbolinks
//= require jquery-timeago
//= require materializer_init

$(document).ready(function(){
    window.mapper = {
      map: {},
      markers: [],
      initMap: function initMap(x, y, zoom) {
          this.map = new GMaps({
              div: '#map',
              lng: x,
              lat: y,
              zoom: zoom
          });
      },
      addMarker: function addMarker(a, b, chaine){
          this.map.addMarker({
            lng: b,
            lat: a,
            title: chaine
          })
      },
      fetcher: function () {
          //localhost:3000/map.json
        $.ajax({
            url: "/map.json",
            method: "get",
            success: function (data){
                console.log(JSON.stringify(data));
            },
            beforeSend: function () {
                console.log("start sanding ...");
            },
            complete: function () {
                console.log("finishing ...");
            }
        })
      }
    };
    mapper.initMap(15, 17, 5);
    console.log(mapper);
    console.log(google);

    function resizeGridMap() {
        var mapParentWidth = $('.row').width();
        var map = $('#map');
        //map.width(mapParentWidth);
        //map.height($(window).height() - map.offset().top);
        //map.css({'min-height': '15%'});
        console.log(mapParentWidth);
    }

    google.maps.event.addListener(mapper.map, 'resize', resizeGridMap);
    google.maps.event.trigger(mapper.map, 'resize');

});