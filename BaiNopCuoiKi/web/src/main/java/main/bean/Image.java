package main.bean;
import java.nio.file.FileSystems;
import java.nio.file.Path;

public class Image {
    String id;
    String src;

    public Image(String id, String src) {
        this.id = id;
        this.src = src;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public static Path getPath() {
//        Path path = Path.of(FileSystems.getDefault().getPath("web/src/main/webapp/img/Data").toAbsolutePath().toString());
//        return path;
//    }
//    public static void main(String[] args) {
//
//        System.out.println("-----2--");
//        System.out.println(getPath());
//
        return null;
    }
}

