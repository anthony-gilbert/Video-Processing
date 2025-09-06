<template>
    <section style="margin:20px 0;padding:16px;border:1px solid #ddd;border-radius:8px;">
    <h2>Upload a Video</h2>
    <video width="320" height="240" ref="videoPlayer">
    <source
      src="https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4"
      type="video/mp4"
    />
    Your browser does not support the video tag.
  </video>
  <div>
    <button @click="play">play</button>
    <button @click="pause">pause</button>
    <button @click="stop">stop</button>
    <button @click="setSpeed(0.5)">0.5x</button>
    <button @click="setSpeed(1)">1x</button>
    <button @click="setSpeed(1.5)">1.5x</button>
    <button @click="setSpeed(2)">2x</button>
  </div>
    <input type="file" accept="video/*" @change="onFile" />
    <button :disabled="!file || uploading" @click="upload">{{ uploading ? 'Uploading…' : 'Upload' }}</button>
    <p v-if="msg">{{ msg }}</p>
    </section>
    </template>
    <script setup>
    import { ref } from 'vue'
    // import { createUploadUrl } from '../api'
    methods: {
    function play(){
      this.$refs.videoPlayer.play();
    };
    function pause() {
      this.$refs.videoPlayer.pause();
    };
    function stop() {
      const { videoPlayer } = this.$refs;
      videoPlayer.pause();
      videoPlayer.currentTime = 0;
    };
    function setSpeed(speed) {
      this.$refs.videoPlayer.playbackRate = speed;
    };
  }
    
    
    const file = ref(null)
    const msg = ref('')
    const uploading = ref(false)
    
    
    function onFile(e){ file.value = e.target.files?.[0] || null }
    
    
    async function upload(){
    if(!file.value) return
    uploading.value = true
    msg.value = ''
    try{
    // const presign = await createUploadUrl(file.value.name, file.value.type)
    // Assume simple PUT URL
    await fetch(presign.url, { method: 'PUT', body: file.value, headers: { 'Content-Type': file.value.type } })
            msg.value = 'Uploaded! Processing will begin shortly.'
        } catch(err){
            console.error(err)
            msg.value = 'Upload failed.'
        } finally{ uploading.value = false }
    }
    </script>