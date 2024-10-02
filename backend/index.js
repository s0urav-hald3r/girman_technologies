const admin = require('firebase-admin');
const fs = require('fs');

// Initialize Firebase Admin
const serviceAccount = require('./serviceAccountKey.json');
admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();

// Load the JSON file
const users = JSON.parse(fs.readFileSync('user_list.json', 'utf8'));

// Function to upload users to Firestore
async function uploadUsers() {
    const batch = db.batch();

    users.forEach((user, index) => {
        const docRef = db.collection('users').doc(); // Automatically generate document ID
        batch.set(docRef, user);
    });

    await batch.commit();
    console.log('User data uploaded successfully!');
}

uploadUsers().catch(console.error);
