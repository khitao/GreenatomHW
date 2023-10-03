package Task1_6;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {

        List<Person> people = new ArrayList<>();
        people.add(new Person("Никита", 25));
        people.add(new Person("Максим", 5));
        people.add(new Person("Алексей", 70));

        System.out.println("До Serialize: ");
        people.forEach(System.out::println);
        System.out.println("\n");

        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("people.ser"))) {
            oos.writeObject(people);
        } catch (IOException e) {
            e.printStackTrace();
        }


        System.out.println("После Serialize: ");
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream("people.ser"))) {
            List<Person> deserializedPeople = (List<Person>) ois.readObject();
            deserializedPeople.forEach(System.out::println);
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }


}
