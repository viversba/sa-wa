<template>
  <div class="hello" id="hello">
    <div class="form-container">
      <h1>{{ msg }}</h1>
      <form @submit.prevent="handleSubmit">
        <div class="info">
          <input id="name" type="text" v-model="firstname" placeholder="Name" />
          <input id="lastname" type="text" v-model="lastname" placeholder="Lastname" />
          <input id="username" type="text" v-model="username" placeholder="Username" />
          <input id="password" type="password" v-model="password" placeholder="Password" />
        </div>
        <button @click="sendREST">Crear con REST</button>
        <button @click="sendGraphQL">Crear con GraphQL</button>
      </form>
      <p>{{success}}</p>
      <p>{{userDescription}}</p>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      firstname: null,
      lastname: null,
      username: null,
      password: null,
      msg: "sa-client",
      success: null,
      userDescription: null
    };
  },
  methods: {
    handleSubmit() {},
    async sendREST() {
      URL = "http://localhost:4000/sa-auth-ms/resources/users";
      var user = {
        firstname: this.firstname,
        lastname: this.lastname,
        username: this.username,
        password: this.password
      };
      this.RESTPost(URL, user);
    },
    sendGraphQL() {
      URL = "http://localhost:5000/graphql";
      var user = {
        firstname: this.firstname,
        lastname: this.lastname,
        username: this.username,
        password: this.password
      };
      this.GraphQL(URL, user);
    },
    async RESTPost(url, data) {
      console.log(JSON.stringify(data));
      // var http = new XMLHttpRequest();
      // http.open("POST", url, true);
      // var xmlhttp = new XMLHttpRequest(); // new HttpRequest instance
      // var theUrl = url;
      // xmlhttp.open("POST", theUrl);
      // xmlhttp.setRequestHeader(
      //   "Content-Type",
      //   "application/json;charset=UTF-8"
      // );
      // xmlhttp.setRequestHeader("mode", "no-cors");
      // xmlhttp.setRequestHeader("Access-Control-Request-Headers", "*");
      // xmlhttp.send(JSON.stringify(data));

      // const response = await fetch(url, {
      //   method: "POST", // *GET, POST, PUT, DELETE, etc.
      //   mode: "no-cors", // no-cors, *cors, same-origin
      //   headers: {
      //     Accept: "application/json; charset=UTF-8",
      //     "Content-Type": "application/json; charset=UTF-8"
      //   },
      //   body: JSON.stringify(data) // body data type must match "Content-Type" header
      // });
      // var JSONresponse = await response.json(); // parses JSON response into native JavaScript objects
      // this.success = "Usuario creado satisfactoriamente desde Microservicio: ";
      // this.userDescription = JSONresponse;
    },
    async GraphQL(url, data) {
      const mutation = `mutation { createUser( user: {firstName: "${this.firstname}" lastName: "${this.lastname}" username: "${this.username}" password: "${this.password}"} { id } }`;
      const query = JSON.stringify({
        query: `mutation { createUser( user: {firstName: "${this.firstname}" lastName: "${this.lastname}" username: "${this.username}" password: "${this.password}"} { id } }`
      });
      console.log(`${mutation}`);
      const response = await fetch(url, {
        headers: { "content-type": "application/json" },
        method: "POST",
        body: `${mutation}`
      });

      const responseJson = await response.json();
      console.log(responseJson);
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1,
h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
html,
body {
  min-height: 100%;
}
h1,
h2 {
  text-transform: uppercase;
  font-weight: 400;
}
h2 {
  margin: 0 0 0 8px;
}
.hello {
  width: 100%;
  text-align: center;
}
.form-container {
  width: 40em;
  display: inline-block;
}
.main-block {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100%;
  padding: 25px;
  background: rgba(0, 0, 0, 0.5);
}
.left-part,
form {
  padding: 25px;
}
.left-part {
  text-align: center;
}
.fa-graduation-cap {
  font-size: 72px;
}
form {
  background: rgba(0.2, 0.2, 0.1, 0.5);
}
.title {
  display: flex;
  align-items: center;
  margin-bottom: 20px;
}
.info {
  display: flex;
  flex-direction: column;
}
input,
select {
  padding: 5px;
  margin-bottom: 30px;
  background: transparent;
  border: none;
  border-bottom: 1px solid #eee;
}
input::placeholder {
  color: #eee;
}
option:focus {
  border: none;
}
option {
  background: black;
  border: none;
}
.checkbox input {
  margin: 0 10px 0 0;
  vertical-align: middle;
}
.checkbox a {
  color: #26a9e0;
}
.checkbox a:hover {
  color: #85d6de;
}
.btn-item,
button {
  padding: 10px 5px;
  margin-top: 20px;
  border-radius: 5px;
  border: none;
  background: #26a9e0;
  text-decoration: none;
  font-size: 15px;
  font-weight: 400;
  color: #fff;
}
.btn-item {
  display: inline-block;
  margin: 20px 5px 0;
}
button {
  width: 100%;
}
button:hover,
.btn-item:hover {
  background: #85d6de;
}
@media (min-width: 568px) {
  html,
  body {
    height: 100%;
  }
  .main-block {
    flex-direction: row;
    height: calc(100% - 50px);
  }
  .left-part,
  form {
    flex: 1;
    height: auto;
  }
}
</style>
