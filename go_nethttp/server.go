package main

import (
	"fmt"
	"log"
	"net/http"
	"encoding/json"
)

type HelloResponse struct {
	Hello string `json:"hello"`
}

type HelloPostBody struct {
	Name string `json:"name"`
}

func main() {
	http.HandleFunc("/api/v1/hello-query", GetHelloQuery)
	http.HandleFunc("/api/v1/hello-parse", PostHelloParse)
	err := http.ListenAndServe(":4000", nil)
	if (err != nil) {
		log.Fatal(err)
	}
}

func GetHelloQuery(res http.ResponseWriter, req *http.Request) {
	if (req.Method != "GET") {
		http.Error(res, http.StatusText(http.StatusNotFound), http.StatusNotFound)
		return
	}
	name := req.URL.Query().Get("name")
	response_struct := HelloResponse{Hello: name}
	response_json, _ := json.Marshal(response_struct)
	fmt.Fprintf(res, string(response_json))
}

func PostHelloParse(res http.ResponseWriter, req *http.Request) {
	if (req.Method != "POST") {
		http.Error(res, http.StatusText(http.StatusNotFound), http.StatusNotFound)
		return
	}
	decoder := json.NewDecoder(req.Body)
	defer req.Body.Close()
	var request_struct HelloPostBody;
	decoder.Decode(&request_struct)
	name := string(request_struct.Name)
	response_struct := HelloResponse{Hello: name}
	response_json, _ := json.Marshal(response_struct)
	fmt.Fprintf(res, string(response_json))
}
