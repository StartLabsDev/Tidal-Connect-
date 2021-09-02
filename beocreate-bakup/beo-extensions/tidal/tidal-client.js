var tidal = (function() {

var tidalEnabled = false;


$(document).on("tidal", function(event, data) {
	if (data.header == "tidalSettings") {
		
		if (data.content.tidalEnabled) {
			tidalEnabled = true;
			$("#tidal-enabled-toggle").addClass("on");
		} else {
			tidalEnabled = false;
			$("#tidal-enabled-toggle").removeClass("on");
		}
		
		if (data.content.loggedInAs) {
			$("#tidal-logged-in-section").removeClass("hidden");
			$("#tidal-logged-out-section").addClass("hidden");
			$(".tidal-username").text(data.content.loggedInAs);
		} else {
			$("#tidal-logged-in-section").addClass("hidden");
			$("#tidal-logged-out-section").removeClass("hidden");
			$(".tidal-username").text("");
		}
		beo.notify(false, "tidal");
	}
	
});


function toggleEnabled() {
	enabled = (!tidalEnabled) ? true : false;
	if (enabled) {
		beo.notify({title: "Turning tidal Connect on...", icon: "attention", timeout: false});
	} else {
		beo.notify({title: "Turning tidal Connect off...", icon: "attention", timeout: false});
	}
	beo.send({target: "tidal", header: "tidalEnabled", content: {enabled: enabled}});

}


return {
	toggleEnabled: toggleEnabled,
	logIn: true,
	logOut: false
};

})();