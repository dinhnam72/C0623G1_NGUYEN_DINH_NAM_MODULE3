package com.example.ss10bt2;

public class Calculator {
    public static String calculate(double firstOperand,String calculation,double secondOperand){
        String result = "";
        switch (calculation){
            case "add":
                result += firstOperand + " + " + secondOperand + " = "+(firstOperand + secondOperand);
                break;
            case "subtract":
                result += firstOperand + " - " + secondOperand + " = "+ (firstOperand - secondOperand);
                break;
            case "multiply":
                result +=firstOperand + " * " + secondOperand + " = "+ (firstOperand * secondOperand);
                break;
            case "division":
                if (secondOperand!=0){
                    result +=firstOperand + " / " + secondOperand + " = "+ (firstOperand / secondOperand);
                }else {
                    result ="Lỗi chia cho O";
                }
                break;
        }
        return result;
    }

}
