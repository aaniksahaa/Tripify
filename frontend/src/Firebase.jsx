import { getAnalytics } from "firebase/analytics";
import { initializeApp } from "firebase/app";
import { getFirestore } from "firebase/firestore";
import { getStorage } from "firebase/storage";

const firebaseConfig = {
    apiKey: "AIzaSyCD0LPq94rbcFhyZMngH7YgZf2adFgSan0",
    authDomain: "tripify-bd49b.firebaseapp.com",
    projectId: "tripify-bd49b",
    storageBucket: "tripify-bd49b.appspot.com",
    messagingSenderId: "22333822250",
    appId: "1:22333822250:web:d191ffa31fbbd2a9ecfa53",
    measurementId: "G-2LM81T8KBQ"
};

export const app = initializeApp(firebaseConfig);
export const analytics = getAnalytics(app);

export const db = getFirestore(app);
export const storage = getStorage(app);


