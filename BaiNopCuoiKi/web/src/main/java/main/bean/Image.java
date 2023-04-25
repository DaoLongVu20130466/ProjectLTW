package main.bean;
import java.nio.file.FileSystems;
import java.nio.file.Path;

public class Image {
    public static Path getPath(){
        Path path = Path.of(FileSystems.getDefault().getPath("web/src/main/webapp/img/Data").toAbsolutePath().toString());
        return path;
    }
    public static void main(String[] args) {

        System.out.println("-----2--");
        System.out.println(getPath());

    }
}
