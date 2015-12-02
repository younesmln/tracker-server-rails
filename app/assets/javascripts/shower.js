$(document).ready(function(){
    mapper = {
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
});