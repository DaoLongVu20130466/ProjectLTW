package main.services;

public class DashBoardService {
    private static DashBoardService instance;
    public static DashBoardService getInstance() {
        if (instance == null) {
            instance = new DashBoardService();
        }
        return instance;
    }
}
