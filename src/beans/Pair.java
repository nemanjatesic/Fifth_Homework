package beans;

import java.io.Serializable;

public class Pair implements Serializable {
    private String key;
    private String value;

    public Pair() { }

    public String getKey() {
        return key;
    }

    public Pair setKey(String key) {
        this.key = key;
        return this;
    }

    public String getValue() {
        return value;
    }

    public Pair setValue(String value) {
        this.value = value;
        return this;
    }
}
