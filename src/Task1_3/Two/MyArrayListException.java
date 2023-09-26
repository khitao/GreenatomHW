package Task1_3.Two;

public class MyArrayListException extends Exception {
    public MyArrayListException() {
        super("Cannot add more than 10 elements.");
    }

    public MyArrayListException(String message) {
        super(message);
    }

    public MyArrayListException(String message, Throwable cause) {
        super(message, cause);
    }

    public MyArrayListException(Throwable cause) {
        super("Cannot add more than 10 elements.", cause);
    }

    @Override
    public String getMessage() {
        return "Custom Message: " + super.getMessage();
    }

    @Override
    public void printStackTrace() {
        System.err.println("Custom Stack Trace:");
        super.printStackTrace();
    }
}
