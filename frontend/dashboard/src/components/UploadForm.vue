<template>
    <section style="margin:20px 0;padding:16px;border:1px solid #ddd;border-radius:8px;">
    <h2>Upload a Video</h2>
    <input type="file" accept="video/*" @change="onFile" />
    <button :disabled="!file || uploading" @click="upload">{{ uploading ? 'Uploading…' : 'Upload' }}</button>
    <p v-if="msg">{{ msg }}</p>
    </section>
    </template>
    <script setup>
    import { ref } from 'vue'
    // import { createUploadUrl } from '../api'
    
    
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
    }catch(err){
    console.error(err)
    msg.value = 'Upload failed.'
    }finally{ uploading.value = false }
    }
    </script>