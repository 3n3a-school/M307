import "../css/app.css"
import "bootstrap/dist/css/bootstrap.min.css"
import "bootstrap-icons/font/bootstrap-icons.css"

import "phoenix_html"
import "bootstrap"

import Vue from "vue";
import HelloWorld from "./components/HelloWorld.vue";

new Vue({
  el: "#app",
  render: (h) => h(HelloWorld),
});