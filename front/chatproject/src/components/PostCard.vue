<template>
  <div>
    <v-card width="500px" :class="cardStyle">
      <v-card-title>
        <v-icon large left> mdi-account </v-icon>
        <span class="text-h6 font-weight-light">{{ userName }}</span>
        <v-row justify="end">
          <v-card-subtitle>{{ updDt }}</v-card-subtitle>
          <v-menu v-if="userId === loginUserId">
            <template #activator="{ on }">
              <v-btn icon v-on="on">
                <v-icon>mdi-dots-vertical</v-icon>
              </v-btn>
            </template>
            <v-list>
              <v-list-item @click="changeShowMessageEdit">
                <v-list-item-title>編集</v-list-item-title>
              </v-list-item>
              <v-list-item @click="deleteMessage">
                <v-list-item-title>削除</v-list-item-title>
              </v-list-item>
            </v-list>
          </v-menu>
        </v-row>
      </v-card-title>
      <v-card-text v-show="!isEdit" style="white-space: pre-line">
        {{ contents }}
      </v-card-text>
      <PostTextArea
        v-show="isEdit"
        :editMessage="editMessage"
        @signupMessage="updateMessage"
        :isError="
          errorFields.includes('contents') || errorFields.includes('comment')
        "
      />
      <v-btn
        v-show="isEdit"
        text
        color="blue lighten-3"
        @click="changeShowMessageEdit"
      >
        キャンセル
      </v-btn>
      <v-card-actions>
        <slot name="cardActions" />

        <v-row justify="end" :class="likeIconStyle" width="50px">
          <v-tooltip right>
            <template #activator="{ on }">
              <v-icon @click="clickedLike" v-on="on"> mdi-hand-okay </v-icon>
            </template>
            <span v-show="likeCount == 0">クリックでいいね！</span>
            <span v-for="like in likes" :key="like.userId"
              >{{ like.userName }}<br /></span
          ></v-tooltip>
          <span v-show="likeCount !== 0">{{ likeCount }}</span>
        </v-row>
      </v-card-actions>
    </v-card>
  </div>
</template>

<script>
import PostTextArea from "./PostTextArea";
import message from "../common/message";
import userStore from "../store/user-store";
import messageStore from "../store/message-store";

export default {
  name: "PostCard",
  components: {
    PostTextArea,
  },
  props: {
    userId: { type: String, require: true, default: "" },
    userName: { type: String, require: true, default: "" },
    contents: { type: String, require: true, default: "" },
    updDt: { type: String, require: true, default: "" },
    likes: { type: Array, require: false, default: () => [] },
    cardStyle: { type: String, require: true, default: "" },
    likeIconStyle: { type: String, require: true, default: "" },
  },
  computed: {
    loginUserId() {
      return userStore.state.userId;
    },
    errorFields() {
      return messageStore.state.errorFields;
    },
  },
  data() {
    return {
      isEdit: false,
      editMessage: "",
      likeCount: 0,
      showLikeUser: false,
    };
  },
  watch: {
    likes: {
      handler() {
        this.likeCount = Object.keys(this.likes).length;
        this.showLikeUser = this.likeCount != 0;
      },
      immediate: true,
      deep: true,
    },
  },
  methods: {
    changeShowMessageEdit() {
      this.isEdit = !this.isEdit;
      this.editMessage = this.isEdit ? this.contents : "";
    },
    clickedLike() {
      this.$emit("clickedLike");
    },
    updateMessage(message) {
      this.$emit("updateMessage", message);
    },
    deleteMessage() {
      if (window.confirm(message.CONFIRM_DELETE_EXEC)) {
        this.$emit("deleteMessage", this.contents);
      }
    },
  },
};
</script>
