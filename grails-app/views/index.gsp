<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
	</head>
	<body>
		<h1>Simple Barcode reader with Javascript</h1>
		<h3>Scanned Barcode List</h3>
		<div id="barcodeList" style="padding: 20px">
			<ul>
			</ul>
		</div>
	<script>
        $(document).ready(function() {
            var pressed = false;
            var chars = [];
            $(window).keypress(function(e) {
                if (e.which >= 48 && e.which <= 57) {
                    chars.push(String.fromCharCode(e.which));
                }
                console.log(e.which + ":" + chars.join("|"));
                if (pressed == false) {
                    setTimeout(function(){
                        if (chars.length >= 10) {
                            var barcode = chars.join("");
                            console.log("Barcode Scanned: " + barcode);
                            // assign value to some input (or do whatever you want)
                            $("#barcodeList").find('ul').append('<li>' + barcode + '</li>');
                        }
                        chars = [];
                        pressed = false;
                    },500);
                }
                pressed = true;
            });
        });
        $("#barcode").keypress(function(e){
            if ( e.which === 13 ) {
                console.log("Prevent form submit.");
                e.preventDefault();
            }
        });

	</script>
	</body>
</html>
