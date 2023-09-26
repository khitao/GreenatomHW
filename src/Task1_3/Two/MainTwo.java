package Task1_3.Two;

import java.util.ArrayList;

public class MainTwo {
    public static void main(String[] args) {
        ArrayList<String> arrayList = new ArrayList<>(10);

        try {
            for (int i = 0; i < 11; i++) {
                if (arrayList.size() < 10) {
                    arrayList.add("Element " + i);
                } else {
                    throw new MyArrayListException();
                }
            }
        } catch (MyArrayListException e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
        }
    }
}
