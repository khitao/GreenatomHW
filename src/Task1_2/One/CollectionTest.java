package Task1_2.One;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.HashSet;
import java.util.TreeSet;

public class CollectionTest {
    public static void main(String[] args) {
        int numElements = 100000;


        //ArrayList
        ArrayList<Integer> arrayList = new ArrayList<>();

        long startTime = System.nanoTime();
        for (int i = 0; i < numElements; i++) {
            arrayList.add(i);
        }
        long endTime = System.nanoTime();
        long arrayListAddTime = endTime - startTime;

        startTime = System.nanoTime();
        boolean arrayListContains = arrayList.contains(numElements - 1);
        endTime = System.nanoTime();
        long arrayListSearchTime = endTime - startTime;

        startTime = System.nanoTime();
        arrayList.remove(0);
        endTime = System.nanoTime();
        long arrayListRemoveTime = endTime - startTime;

        //LinkedList
        startTime = System.nanoTime();
        LinkedList<Integer> linkedList = new LinkedList<>();
        for (int i = 0; i < numElements; i++) {
            linkedList.add(i);
        }
        endTime = System.nanoTime();
        long linkedListAddTime = endTime - startTime;

        startTime = System.nanoTime();
        boolean linkedListContains = linkedList.contains(numElements - 1);
        endTime = System.nanoTime();
        long linkedListSearchTime = endTime - startTime;

        startTime = System.nanoTime();
        linkedList.remove(0);
        endTime = System.nanoTime();
        long linkedListRemoveTime = endTime - startTime;

        //TreeSet
        startTime = System.nanoTime();
        TreeSet<Integer> treeSet = new TreeSet<>();
        for (int i = 0; i < numElements; i++) {
            treeSet.add(i);
        }
        endTime = System.nanoTime();
        long treeSetAddTime = endTime - startTime;

        startTime = System.nanoTime();
        boolean treeSetContains = treeSet.contains(numElements - 1);
        endTime = System.nanoTime();
        long treeSetSearchTime = endTime - startTime;

        startTime = System.nanoTime();
        treeSet.remove(0);
        endTime = System.nanoTime();
        long treeSetRemoveTime = endTime - startTime;

        //HashSet
        startTime = System.nanoTime();
        HashSet<Integer> hashSet = new HashSet<>();
        for (int i = 0; i < numElements; i++) {
            hashSet.add(i);
        }
        endTime = System.nanoTime();
        long hashSetAddTime = endTime - startTime;

        startTime = System.nanoTime();
        boolean hashSetContains = hashSet.contains(numElements - 1);
        endTime = System.nanoTime();
        long hashSetSearchTime = endTime - startTime;

        startTime = System.nanoTime();
        hashSet.remove(0);
        endTime = System.nanoTime();
        long hashSetRemoveTime = endTime - startTime;


        System.out.println("ArrayList:");
        System.out.println("Добавление: " + arrayListAddTime + " наносекунд");
        System.out.println("Поиск: " + arrayListSearchTime + " наносекунд");
        System.out.println("Удаление: " + arrayListRemoveTime + " наносекунд");

        System.out.println();

        System.out.println("LinkedList:");
        System.out.println("Добавление: " + linkedListAddTime + " наносекунд");
        System.out.println("Поиск: " + linkedListSearchTime + " наносекунд");
        System.out.println("Удаление: " + linkedListRemoveTime + " наносекунд");

        System.out.println();

        System.out.println("TreeSet:");
        System.out.println("Добавление: " + treeSetAddTime + " наносекунд");
        System.out.println("Поиск: " + treeSetSearchTime + " наносекунд");
        System.out.println("Удаление: " + treeSetRemoveTime + " наносекунд");

        System.out.println();

        System.out.println("HashSet:");
        System.out.println("Добавление: " + hashSetAddTime + " наносекунд");
        System.out.println("Поиск: " + hashSetSearchTime + " наносекунд");
        System.out.println("Удаление: " + hashSetRemoveTime + " наносекунд");
    }
}
