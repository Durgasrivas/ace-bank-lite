package com.acebank.lite.models;

import java.time.LocalDateTime;

public record LoanRequest(
    int id,
    String userName,
    String email,
    String loanType,
    double loanAmount,
    String status,
    LocalDateTime createdAt
) {}
