$("document").ready(function() {
            // create the image rotator
            
            setInterval("rotateImages1()", 4000);
            setInterval("rotateImages2()", 4500);
            setInterval("rotateImages3()", 5000);
           
        });

        function rotateImages1() {
            var oCurPhoto1 = $('#photoShow1 div.current');
            var oNxtPhoto1 = oCurPhoto1.next();
            if (oNxtPhoto1.length == 0)
                oNxtPhoto1 = $('#photoShow1 div:first');

            oCurPhoto1.removeClass('current').addClass('previous');
            oNxtPhoto1.css({ opacity: 0.0 }).addClass('current').animate({ opacity: 1.0 }, 1000,
                function() {
                    oCurPhoto1.removeClass('previous');
                });
            }

function rotateImages2() {
            var oCurPhoto2 = $('#photoShow2 div.current');
            var oNxtPhoto2 = oCurPhoto2.next();
            if (oNxtPhoto2.length == 0)
                oNxtPhoto2 = $('#photoShow2 div:first');

            oCurPhoto2.removeClass('current').addClass('previous');
            oNxtPhoto2.css({ opacity: 0.0 }).addClass('current').animate({ opacity: 1.0 }, 1000,
                function() {
                    oCurPhoto2.removeClass('previous');
                });
            }

function rotateImages3() {
            var oCurPhoto3 = $('#photoShow3 div.current');
            var oNxtPhoto3 = oCurPhoto3.next();
            if (oNxtPhoto3.length == 0)
                oNxtPhoto3 = $('#photoShow3 div:first');

            oCurPhoto3.removeClass('current').addClass('previous');
            oNxtPhoto3.css({ opacity: 0.0 }).addClass('current').animate({ opacity: 1.0 }, 1000,
                function() {
                    oCurPhoto3.removeClass('previous');
                });

        }
  
