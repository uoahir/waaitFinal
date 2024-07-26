package com.waait.github;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor // 기본 생성자 추가
public class CreateRepoRequest {
    private String name;
    private String description;

    @JsonProperty("private")
    private boolean isPrivate;
}
