import muthesius.net.*;
import org.webbitserver.*;
import SimpleOpenNI.*;

SimpleOpenNI	context;
KinectStates	ks;

void setup() {
	context = new SimpleOpenNI(this);
	if (!context.isInit()) {
		println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
		exit();
		return;
	}
	context.enableDepth();
	context.enableUser();
	ks = new KinectStates(context);
}

void draw() {
	// Update the cam
	context.update();
	println( ks.getCurrentAction() );
}

void onNewUser(SimpleOpenNI curContext, int userId) {
	println("onNewUser - userId: " + userId);
	println("\tstart tracking skeleton");
	curContext.startTrackingSkeleton(userId);
}

void websocketOnOpen(WebSocketConnection con){
	println("A client joined");
}

void websocketOnClosed(WebSocketConnection con){
	println("A client left");
}
