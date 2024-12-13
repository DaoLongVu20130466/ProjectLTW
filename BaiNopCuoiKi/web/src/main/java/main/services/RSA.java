package main.services;

import java.security.*;
import java.util.Base64;

import org.bouncycastle.jce.provider.BouncyCastleProvider;
public class RSA {
    public static RSA  instance;
    public static RSA getInstance() {
        if (instance == null) {
            instance = new RSA();
        }
        return instance;
    }
    public KeyPair generateKeyPair() throws NoSuchAlgorithmException {
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
        keyPairGenerator.initialize(2048); // Độ dài key (2048 bits là một giá trị thông dụng)
        return keyPairGenerator.generateKeyPair();
    }
    // Hàm tạo chữ ký số
    public byte[] signData(byte[] data, PrivateKey privateKey) throws Exception {
        Signature signature = Signature.getInstance("SHA256withRSA", "BC");
        signature.initSign(privateKey);
        signature.update(data);
        return signature.sign();
    }

    // Hàm xác minh chữ ký số
    public boolean verifySignature(byte[] data, byte[] signature, PublicKey publicKey) throws Exception {
        Signature verifier = Signature.getInstance("SHA256withRSA", "BC");
        verifier.initVerify(publicKey);
        verifier.update(data);
        return verifier.verify(signature);
    }
    // Hàm mã hóa Public Key sang chuỗi Base64
    public String encodePublicKey(PublicKey publicKey) {
        byte[] publicKeyBytes = publicKey.getEncoded();
        return Base64.getEncoder().encodeToString(publicKeyBytes);
    }

    // Hàm mã hóa Private Key sang chuỗi Base64
    public String encodePrivateKey(PrivateKey privateKey) {
        byte[] privateKeyBytes = privateKey.getEncoded();
        return Base64.getEncoder().encodeToString(privateKeyBytes);
    }

    public static void main(String[] args) throws NoSuchAlgorithmException {
        KeyPair kp =   RSA.getInstance().generateKeyPair();
        // PublicKey
        PublicKey publicKey = kp.getPublic();
        // PrivateKey
        PrivateKey privateKey = kp.getPrivate();

    }
}
