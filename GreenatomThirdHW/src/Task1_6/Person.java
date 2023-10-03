package Task1_6;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.Serializable;

class Person implements Serializable {
    private static final long serialVersionUID = 1L;

    private String name;
    private int age;
    private transient String activity;

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
        this.activity = calculateActivity(age);
    }

    private String calculateActivity(int age) {
        if (age >= 0 && age < 3) {
            return "Сидит дома";
        } else if (age >= 3 && age < 7) {
            return "Ходит в детский сад";
        } else if (age >= 7 && age < 18) {
            return "Учится в школе";
        } else if (age >= 17 && age < 23) {
            return "Учится в институте";
        } else if (age >= 24 && age < 65) {
            return "Работает";
        } else {
            return "На пенсии";
        }
    }

    @Override
    public String toString() {
        return "Person{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", activity=" + activity +
                '}';
    }


    private void readObject(ObjectInputStream ois) throws IOException, ClassNotFoundException {
        ois.defaultReadObject();
        this.activity = calculateActivity(this.age);
    }
}

