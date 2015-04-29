
void delay(int ms) {
	try {
		Thread.sleep(ms);
	} catch ( java.lang.InterruptedException ie) {
		System.out.println(ie);
	}
}