package Task1_8;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Main {
    public static void main(String[] args) {
        Developer dev1 = new Developer("Наташа", Arrays.asList("Java", "C++"));
        Developer dev2 = new Developer("Эрнест", Arrays.asList("Java", "Python"));
        Developer dev3 = new Developer("Элла", Arrays.asList("С#", "Python", "JavaScript"));

        Stream<Developer> developerStream = Stream.of(dev1, dev2, dev3);


        Map<String, Long> languageFrequency = developerStream
                .flatMap(developer -> developer.getLanguages().stream())
                .collect(Collectors.groupingBy(String::valueOf, Collectors.counting()));

        System.out.println(languageFrequency + "\n");

        Set<String> uniqueLanguages = languageFrequency.entrySet().stream()
                .filter(entry -> entry.getValue() == 1)
                .map(Map.Entry::getKey)
                .collect(Collectors.toSet());

        System.out.println(uniqueLanguages + "\n");

        developerStream = Stream.of(dev1, dev2, dev3);

        List<Developer> uniqueDevelopers = developerStream
                .filter(developer -> developer.getLanguages().stream().anyMatch(uniqueLanguages::contains))
                .toList();

        uniqueDevelopers.forEach(developer -> System.out.print(developer.getName() + " "));


    }
}
