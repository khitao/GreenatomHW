package Task1_2.Two;

import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

public class SwapKeysAndValues {
    public static void main(String[] args) {

        HashMap<String, Integer> originalMap = new HashMap<>();

        originalMap.put("One", 1);
        originalMap.put("Two", 2);
        originalMap.put("Three", 2);


        Map<Integer, String> reversedMap = originalMap.entrySet()
                .stream()
                .collect(Collectors.toMap(Map.Entry::getValue, Map.Entry::getKey));


        System.out.println("Исходная HashMap: " + originalMap);
        System.out.println("Перевернутая HashMap: " + reversedMap);
    }
}
