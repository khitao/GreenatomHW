package Task1_3.One;


public class Main {
    public static void main(String[] args) {
        for (int i = 0; i < 2; i++) {

            try {
                new MyException();

            } catch (Throwable e) {
                System.out.println("e = " + e);

                if (e.getCause() instanceof MyException) {
                    MyException ex = (MyException) e.getCause();
                    System.out.println("e instanceof " + MyException.class.getName() + ", s = " + ex.get());
                }

            }

        }
    }

}


