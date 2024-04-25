// Create a file named useAuthenticatedUser.js
import { ref, onMounted } from 'vue';
import axios from 'axios';

export function useAuthenticatedUser() {
    const authUser = ref(null);

    const fetchUser = async () => {
        try {
            let token = localStorage.getItem('token');
            const response = await axios.get("http://localhost:8000/api/user", {
                headers: {
                    'Authorization': `Bearer ${token}`
                }
            });

            // Check if the response has the expected structure
            if (response.data) {
                authUser.value = response.data;
            } else {
                console.error('Invalid response structure:', response.data);
            }
        } catch (error) {
            console.error('Error fetching authenticated user:', error);
        }
    };

    onMounted(() => {
        fetchUser();
    });

    return { authUser, fetchUser };
}
