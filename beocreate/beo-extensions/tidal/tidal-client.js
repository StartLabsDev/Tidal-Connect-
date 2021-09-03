var tidal = (function() {

var tidalEnabled = false;

console.log('tidal-client.js added');

$(document).on("tidal", function(event, data) {
  console.log('tidal-client.js - RECEIVED EVENT');
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
	
	if (data.header == "logInError") {
		//beo.ask("tidal-login-error-prompt");
		beo.notify({title: "Error logging in", message: "The user name or password may be incorrect, or the account is not a tidal Premium account.", timeout: false, buttonTitle: "Dismiss", buttonAction: "close"});
	}
});

function testFunction() {
  console.log(this);
}

function toggleEnabled() {
        console.log('toggleEnabled() - called');
	enabled = (!tidalEnabled) ? true : false;
	if (enabled) {
		beo.notify({title: "Turning tidal Connect on...", icon: "attention", timeout: false});
	} else {
		beo.notify({title: "Turning tidal Connect off...", icon: "attention", timeout: false});
	}
	beo.send({target: "tidal", header: "tidalEnabled", content: {enabled: enabled}});
}

function logIn() {
	
	beo.startTextInput(3, "Log In with tidal", "Enter your tidal user name and password.", {placeholders: {password: "Password", text: "User name"}, minLength: {text: 2, password: 3}}, function(input) {
		if (input) {
			beo.send({target: "tidal", header: "logIn", content: {username: input.text, password: input.password}});
			beo.notify({title: "Updating settings...", icon: "attention", timeout: false, id: "tidal"});
		}
	});
}

function logOut() {
	beo.send({target: "tidal", header: "logOut"});
	beo.notify({title: "Updating settings...", icon: "attention", timeout: false, id: "tidal"});
}


return {
	toggleEnabled: toggleEnabled,
	logIn: logIn,
	logOut: logOut
};

})();