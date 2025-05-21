import axios from "axios";
const API_URL = "http://localhost:3000/backend";

const api = axios.create({
	baseURL: API_URL,
	withCredentials: true,
	headers: {
		"Content-Type": "application/json",
	},
});

api.interceptors.response.use(
	(response) => response,
	async (error) => {
		const originalRequest = error.config;

		if (error.response?.status === 401 && !originalRequest._retry) {
			originalRequest._retry = true;

			// Refresh token logic can be added heret
		}
		return Promise.reject(error);
	}
);

export { api, API_URL };
