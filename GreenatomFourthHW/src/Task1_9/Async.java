package Task1_9;

import java.util.Timer;
import java.util.TimerTask;

public class Async {
    public static void main(String[] args) {
        Timer timer = new Timer();


        TimerTask timerTask = new TimerTask() {
            @Override
            public void run() {
                System.err.println("Асинхронный привет!");
                try {
                    Thread.sleep(5000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                System.err.println("Асинхронный пока!");
            }
        };


        timer.schedule(timerTask, 0, 10000);


        while (true) {
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.err.println("Работает основная программа");
        }
    }
}
