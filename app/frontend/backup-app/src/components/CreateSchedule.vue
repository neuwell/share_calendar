<template>
  <div id="create-schedule" class="create-schedule">
    <h2>create schedule</h2>
    <div class="row">
      <div class="input-field col s12 m8 offset-2">
        <label class="active" for="title">タイトル</label>
        <input id="title" type="text" class="validate">
      </div>
    </div>
    <div class="row">
      <div class="input-field col s12 m8 offset-2">
        <label class="active" for="description">説明</label>
        <textarea id="description" class="materialize-textarea"></textarea>
      </div>
    </div>
    <div class="row">
      <div class="input-field col s12 m8 offset-2">
        <v-select :value="formInput.year">
          <v-option value="1">2017</v-option>
          <v-option value="2">2018</v-option>
          <v-option value="3">2020</v-option>
        </v-select>
        <label>年を選択</label>
      </div>
      <!-- <div class="col s12 m8 offset-2">
        <v-select ref="selectMonth" v-model="formInput.month">
          <v-option value="1">2017</v-option>
          <v-option value="2">2018</v-option>
          <v-option value="3">2020</v-option>
        </v-select>
        <label>年を選択</label>
      </div> -->
    </div>
  </div>
</template>

<script>
export default {
  name: 'create-chedule',
  data () {
    return {
      formInput: {
        title: '',
        description: '',
        year: null,
        month: null
      }
    }
  },
  mounted () {
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
