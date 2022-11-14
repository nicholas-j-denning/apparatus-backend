package com.revature.apparatus.Models;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Search {
    @JsonProperty("input")
    private String input;

    public Search() {
    }

    public Search(String input) {
        this.input = input;
    }

    public String getInput() {
        return this.input;
    }

    public void setInput(String input) {
        this.input = input;
    }

    public Search input(String input) {
        setInput(input);
        return this;
    }
}