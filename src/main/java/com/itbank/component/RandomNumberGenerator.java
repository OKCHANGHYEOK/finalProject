package com.itbank.component;

import java.util.Random;

import org.springframework.stereotype.Component;

@Component
public class RandomNumberGenerator {

    private static final int LENGTH = 6;

    public String generateRandomNumberString() {
        Random random = new Random();
        StringBuilder sb = new StringBuilder(LENGTH);
        
        for (int i = 0; i < LENGTH; i++) {
            sb.append(random.nextInt(10)); // 0부터 9까지의 숫자를 랜덤하게 추가합니다.
        }

        return sb.toString();
    }
}