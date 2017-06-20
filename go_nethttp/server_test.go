package main

import (
	"bytes"
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestGetHelloQuery(t *testing.T) {
	req, err := http.NewRequest("GET", "/api/v1/hello-query?name=foo%20bar", nil)
	if (err != nil) {
		t.Fatal(err)
	}
	reqRec := httptest.NewRecorder()
	handler := http.HandlerFunc(GetHelloQuery)
	handler.ServeHTTP(reqRec, req)

	if (reqRec.Code != http.StatusOK) {
		t.Errorf("Status code wrong: %v", reqRec.Code)
	}

	if (reqRec.Body.String() != `{"hello":"foo bar"}`) {
		t.Errorf("Body wrong: %v", reqRec.Body.String())
	}
}

func TestPostHelloParse(t *testing.T) {
	bodyBuffer := bytes.NewBuffer([]byte(`{"name":"foo bar"}`))
	req, err := http.NewRequest("POST", "/api/v1/hello-parse", bodyBuffer)
	if (err != nil) {
		t.Fatal(err)
	}
	reqRec := httptest.NewRecorder()
	handler := http.HandlerFunc(PostHelloParse)
	handler.ServeHTTP(reqRec, req)

	if (reqRec.Code != http.StatusOK) {
		t.Errorf("Status code wrong: %v", reqRec.Code)
	}

	if (reqRec.Body.String() != `{"hello":"foo bar"}`) {
		t.Errorf("Body wrong: %v", reqRec.Body.String())
	}
}
