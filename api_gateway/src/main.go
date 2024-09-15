package main

import (
	"log"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("ok"))
}

func main() {
	http.HandleFunc("/", handler)
	log.Println("Starting server on port 8080...")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
