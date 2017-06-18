/**
 * Created by zhouhao on 17-6-18.
 */

$(document).ready(function() {
    var image = new Array();
    var w = 320, h = 240;
    var pos = 0;
    $("#webcam").webcam({
        width: w,
        height: h,
        mode: "callback",
        swffile: "/static/swf/jscam_canvas_only.swf", // canvas only doesn't implement a jpeg encoder, so the file is much smaller
        onTick: function (remain) {
            if (0 == remain) {
                $("#status").text("Cheese!");
            } else {
                $("#status").text(remain + " seconds remaining...");
            }
        },
        onSave: function (data) {
            image.push(data);
            pos += 4 * w;
            if (pos == 4 * w * h) {
                $.post("/camerapost/",
                    {w: w, h: h, pix: image.join('|')},
                    function (img) {
                        pos = 0;
                        image = new Array();
                        console.log(img);
                        $("#img").attr("src",img)
                    });
            }
        },
        onCapture: function () {
            webcam.save();
            // Show a flash for example
        },
        debug: function (type, string) {
            // Write debug information to console.log() or a div, ...
        },
        onLoad: function () {
            // Page load
            //var cams = webcam.getCameraList();
             var cams = webcam.getCameraList();

                for(var i in cams) {

                    $("#cams").append("<li>" + cams[i] + "</li>");

                }
        }
    });
    $("#save").click(
          function(){
            webcam.capture()
          }
    );
});