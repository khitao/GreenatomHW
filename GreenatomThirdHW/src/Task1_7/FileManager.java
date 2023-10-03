package Task1_7;

import java.io.*;

public class FileManager {

    public static void main(String[] args) {

        if (args.length < 2) {
            System.out.println("Использование: java Task1_7.FileManager <путь_до_файла> <команда>");
            return;
        }

        String wayToFile = args[0];
        String operation = args[1];

        switch (operation) {
            case "-create" -> createFile(wayToFile);
            case "-read" -> readFile(wayToFile);
            case "-write" -> {
                if (args.length < 3) {
                    System.out.println("Использование: java Task1_7.FileManager <путь_до_файла> -write \"текст\"");
                    return;
                }
                String content = args[2];
                writeFile(wayToFile, content);
            }
            case "-delete" -> deleteFile(wayToFile);
            default -> System.out.println("Неверная операция. Доступные команды: -create, -read, -write, -delete");
        }
    }

    private static void createFile(String filePath) {
        try {
            File file = new File(filePath);
            if (file.createNewFile()) {
                System.out.println("Файл успешно создан: " + filePath);
            } else {
                System.out.println("Файл с таким именем уже существует: " + filePath);
            }
        } catch (IOException e) {
            System.out.println("Ошибка создания файла: " + e.getMessage());
        }
    }

    private static void readFile(String filePath) {
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }
        } catch (IOException e) {
            System.out.println("Ошибка чтения из файла: " + e.getMessage());
        }
    }

    private static void writeFile(String filePath, String content) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            writer.write(content);
            System.out.println("Успешно записано в файл: " + filePath);
        } catch (IOException e) {
            System.out.println("Ошибка записи в файл: " + e.getMessage());
        }
    }

    private static void deleteFile(String filePath) {
        File file = new File(filePath);
        if (file.delete()) {
            System.out.println("Файл успешно удален: " + filePath);
        } else {
            System.out.println("Ошибка удаления файла. Файла не существует: " + filePath);
        }
    }
}

//nikita@MBP-Nikita GreenatomThirdHW % javac -d . src/Task1_7/FileManager.java

//nikita@MBP-Nikita GreenatomThirdHW % java Task1_7.FileManager myfile.txt -create

//nikita@MBP-Nikita GreenatomThirdHW % java Task1_7.FileManager myfile.txt -write "blablabla"

//nikita@MBP-Nikita GreenatomThirdHW % java Task1_7.FileManager myfile.txt -read

//nikita@MBP-Nikita GreenatomThirdHW %  java Task1_7.FileManager myfile.txt -delete
