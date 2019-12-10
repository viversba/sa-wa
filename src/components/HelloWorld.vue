<template>
  <div class="hello">
    <form-sa></form-sa>
  </div>
</template>

<script>
import formSa from "./Form";
export default {
  data() {
    return {
      msg: "sa-client"
    };
  },
  components: {
    "form-sa": formSa
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
