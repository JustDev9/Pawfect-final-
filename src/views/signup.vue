<template>
	<div class="login-bg">
		<div class="login-main">
			<div class="login-card">
				<!-- Left: Sign Up Form -->
				<div class="login-form-col">
					<div class="login-logo-row">
						<img
							src="/Designer.png"
							alt="PawFect"
							class="login-logo-img"
						/>
						<span class="login-logo-text">PAWFECT</span>
					</div>
					<h1 class="login-title">Create your Account</h1>
					<p class="login-sub">
						Sign up to get started with Pawfect!
					</p>
					<form
						class="login-main-form"
						@submit.prevent="handleSignUp"
					>
						<div class="login-input-group">
							<span class="login-input-icon">
								<svg
									width="20"
									height="20"
									fill="none"
									stroke="#e99a08"
									stroke-width="2"
									stroke-linecap="round"
									stroke-linejoin="round"
								>
									<circle cx="10" cy="10" r="8" />
									<path d="M10 13v-3" />
									<circle cx="10" cy="7" r="1" />
								</svg>
							</span>
							<input
								type="text"
								v-model="signupName"
								placeholder="Full Name"
								required
							/>
						</div>
						<div class="login-input-group">
							<span class="login-input-icon">
								<svg
									width="20"
									height="20"
									fill="none"
									stroke="#e99a08"
									stroke-width="2"
									stroke-linecap="round"
									stroke-linejoin="round"
								>
									<path d="M4 4h12v12H4z" opacity="0" />
									<path d="M4 4h12v12H4z" />
									<path d="M4 4l8 6 8-6" />
								</svg>
							</span>
							<input
								type="email"
								v-model="signupEmail"
								placeholder="Email"
								required
							/>
						</div>
						<div class="login-input-group">
							<span class="login-input-icon">
								<svg
									width="20"
									height="20"
									fill="none"
									stroke="#e99a08"
									stroke-width="2"
									stroke-linecap="round"
									stroke-linejoin="round"
								>
									<rect
										x="3"
										y="8"
										width="14"
										height="9"
										rx="2"
									/>
									<path d="M7 8V6a5 5 0 0 1 10 0v2" />
								</svg>
							</span>
							<input
								:type="showPassword ? 'text' : 'password'"
								v-model="signupPassword"
								placeholder="Password"
								required
								@input="validatePassword"
							/>
							<span
								class="login-eye"
								@click="showPassword = !showPassword"
							>
								<svg
									v-if="!showPassword"
									width="20"
									height="20"
									fill="none"
									stroke="#888"
									stroke-width="2"
									stroke-linecap="round"
									stroke-linejoin="round"
								>
									<path
										d="M1 10s4-6 9-6 9 6 9 6-4 6-9 6-9-6-9-6z"
									/>
									<circle cx="10" cy="10" r="3" />
								</svg>
								<svg
									v-else
									width="20"
									height="20"
									fill="none"
									stroke="#e99a08"
									stroke-width="2"
									stroke-linecap="round"
									stroke-linejoin="round"
								>
									<path
										d="M17.94 17.94A10.94 10.94 0 0 1 10 19C5.58 19 1.73 15.36 1.05 10.94M23 1L1 23"
									/>
									<path d="M9.53 9.53A3 3 0 0 0 13 13" />
								</svg>
							</span>
						</div>
						<div class="password-rules">
							<div :class="{ valid: passwordValid.length }">
								• At least 8 characters
							</div>
							<div :class="{ valid: passwordValid.upper }">
								• One uppercase letter
							</div>
							<div :class="{ valid: passwordValid.number }">
								• One number
							</div>
							<div :class="{ valid: passwordValid.special }">
								• One special character
							</div>
						</div>
						<div class="login-input-group">
							<span class="login-input-icon">
								<svg
									width="20"
									height="20"
									fill="none"
									stroke="#e99a08"
									stroke-width="2"
									stroke-linecap="round"
									stroke-linejoin="round"
								>
									<circle cx="10" cy="10" r="8" />
									<path d="M10 13v-3" />
									<circle cx="10" cy="7" r="1" />
								</svg>
							</span>
							<input
								:type="showPassword ? 'text' : 'password'"
								v-model="signupConfirm"
								placeholder="Confirm Password"
								required
								@input="validatePassword"
								:class="{
									'input-mismatch':
										signupConfirm &&
										signupPassword !== signupConfirm,
								}"
							/>
							<span
								v-if="
									signupConfirm &&
									signupPassword !== signupConfirm
								"
								class="mismatch-msg"
								>Passwords do not match</span
							>
						</div>
						<div class="login-options-row">
							<label class="login-remember">
								<input
									type="checkbox"
									v-model="agreedToTerms"
								/>
								<span class="checkmark"></span>
								I agree to the
								<a href="#" @click.prevent="showTerms = true"
									>Terms & Agreement</a
								>
							</label>
						</div>
						<button
							class="login-btn"
							type="submit"
							:disabled="!canSubmit || isLoading"
						>
							<span v-if="isLoading" class="spinner"></span>
							{{ isLoading ? "Creating Account..." : "Sign Up" }}
						</button>
					</form>
					<div v-if="errorMessage" class="error-message">
						{{ errorMessage }}
					</div>
					<div class="login-bottom-row">
						<span>Already have an account?</span>
						<a href="/login" class="login-link">Log in</a>
					</div>
				</div>
				<!-- Right: Illustration -->
				<div class="login-illustration-col">
					<div class="login-illustration-bg">
						<img
							src="https://cdn.dribbble.com/users/1615584/screenshots/17332813/media/2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e.png"
							alt="Dashboard Illustration"
							class="login-illustration-img"
						/>
						<div class="login-illustration-text">
							<h2>Connect with every application.</h2>
							<p>Your pawfect place for adoption</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div
			v-if="showTerms"
			class="modal-overlay"
			@click.self="showTerms = false"
		>
			<div class="modal">
				<button class="close-btn" @click="showTerms = false">
					&times;
				</button>
				<h2>Terms and Agreement</h2>
				<div class="modal-content">
					<p>
						By creating an account, you agree to our terms and
						conditions. You are responsible for your account and
						data. Please use a strong password and keep your
						credentials safe.
					</p>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
import axios from "axios";
import { api } from "@/services/api.config";
import { API_URL } from "@/services/api.config";

export default {
	name: "SignUpPage",
	data() {
		return {
			signupName: "",
			signupEmail: "",
			signupPassword: "",
			signupConfirm: "",
			agreedToTerms: false,
			showPassword: false,
			showTerms: false,
			isLoading: false,
			errorMessage: "",
			passwordValid: {
				length: false,
				upper: false,
				number: false,
				special: false,
			},
		};
	},
	computed: {
		canSubmit() {
			return (
				this.signupName &&
				this.signupEmail &&
				this.signupPassword &&
				this.signupConfirm &&
				this.signupPassword === this.signupConfirm &&
				this.passwordValid.length &&
				this.passwordValid.upper &&
				this.passwordValid.number &&
				this.passwordValid.special &&
				this.agreedToTerms &&
				!this.isLoading
			);
		},
	},
	methods: {
		validatePassword() {
			const pwd = this.signupPassword;
			this.passwordValid.length = pwd.length >= 8;
			this.passwordValid.upper = /[A-Z]/.test(pwd);
			this.passwordValid.number = /[0-9]/.test(pwd);
			this.passwordValid.special = /[!@#$%^&*(),.?":{}|<>]/.test(pwd);
		},
		async handleSignUp() {
			if (!this.canSubmit) return;

			this.isLoading = true;
			this.errorMessage = "";

			try {
				const { data } = await api.post(
					`${API_URL}/main.php?register=true`,
					{
						name: this.signupName,
						email: this.signupEmail,
						password: this.signupPassword,
					}
				);

				// Show success message
				// this.$toast.success(data.message || "Registration successful");

				console.log(data);

				// if (data.data.status.remarks === "success") {
				// 	this.$toast.success("Registration successful");
				// } else {
				// 	this.$toast.error("Registration failed");
				// }

				// Clear form
				this.signupName = "";
				this.signupEmail = "";
				this.signupPassword = "";
				this.signupConfirm = "";
				this.agreedToTerms = false;

				// Redirect to login page
				this.$router.push(data.redirect || "/login");
			} catch (error) {
				console.error("Signup error:", error);
				let message = "An error occurred during registration";
				if (error.response && error.response.data) {
					message =
						error.response.data.error ||
						error.response.data.message ||
						message;
				} else if (error.message) {
					message = error.message;
				}
				this.errorMessage = message;
				this.$toast.error(this.errorMessage);

				// If there's a redirect in the error response, use it
				if (
					error.response &&
					error.response.data &&
					error.response.data.redirect
				) {
					this.$router.push(error.response.data.redirect);
				}
			} finally {
				this.isLoading = false;
			}
		},
	},
};
</script>

<style scoped>
.login-bg {
	min-height: 100vh;
	background: #f4f6fa;
	display: flex;
	align-items: center;
	justify-content: center;
}
.login-main {
	width: 100vw;
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
}
.login-card {
	display: flex;
	background: #fff;
	border-radius: 24px;
	box-shadow: 0 8px 40px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	max-width: 950px;
	width: 100%;
	min-height: 600px;
}
.login-form-col {
	flex: 1.1;
	padding: 56px 48px 48px 48px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	background: #fff;
}
.login-logo-row {
	display: flex;
	align-items: center;
	gap: 0.7rem;
	margin-bottom: 1.5rem;
}
.login-logo-img {
	width: 38px;
	height: 38px;
}
.login-logo-text {
	font-size: 1.5rem;
	font-weight: 800;
	color: #f7871f;
	letter-spacing: 1px;
}
.login-title {
	font-size: 2.1rem;
	font-weight: 700;
	margin-bottom: 0.3rem;
	color: #222;
	letter-spacing: 1px;
}
.login-sub {
	color: #888;
	font-size: 1.05rem;
	margin-bottom: 2.2rem;
}
.login-social-row {
	display: flex;
	gap: 1rem;
	margin-bottom: 1.7rem;
}
.login-social-btn {
	flex: 1;
	display: flex;
	align-items: center;
	gap: 0.7rem;
	background: #fff;
	border: 1.5px solid #e0e0e0;
	color: #222;
	font-weight: 600;
	border-radius: 8px;
	padding: 0.7rem 0;
	cursor: pointer;
	font-size: 1rem;
	transition: background 0.2s, color 0.2s, border 0.2s;
	justify-content: center;
}
.login-social-btn img {
	width: 22px;
	height: 22px;
}
.login-social-btn.google:hover {
	border: 1.5px solid #f7871f;
	color: #f7871f;
}
.login-social-btn.facebook:hover {
	border: 1.5px solid #1877f2;
	color: #1877f2;
}
.login-divider {
	width: 100%;
	text-align: center;
	color: #aaa;
	font-size: 0.97rem;
	margin: 1.2rem 0 1.2rem 0;
	position: relative;
}
.login-divider span {
	background: #fff;
	padding: 0 1rem;
	position: relative;
	z-index: 2;
}
.login-divider:before {
	position: absolute;
	left: 0;
	right: 0;
	top: 50%;
	height: 1px;
	background: linear-gradient(
		90deg,
		#f7871f 0 10%,
		#e0e0e0 10% 90%,
		#f7871f 90% 100%
	);
	z-index: 1;
}
.login-main-form {
	width: 100%;
	display: flex;
	flex-direction: column;
	gap: 1.1rem;
}
.login-input-group {
	width: 100%;
	display: flex;
	align-items: center;
	background: #f7f8fa;
	border-radius: 8px;
	border: 1.5px solid #e0e0e0;
	margin-bottom: 0.2rem;
	position: relative;
}
.login-input-icon {
	margin-left: 1rem;
	color: #f7871f;
	display: flex;
	align-items: center;
}
.login-input-group input {
	flex: 1;
	border: none;
	background: transparent;
	padding: 0.95rem 1rem 0.95rem 0.5rem;
	font-size: 1rem;
	outline: none;
	color: #222;
}
.login-eye {
	margin-right: 1rem;
	cursor: pointer;
	display: flex;
	align-items: center;
}
.login-options-row {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 0.7rem;
	margin-top: 0.2rem;
}
.login-remember {
	display: flex;
	align-items: center;
	font-size: 0.97rem;
	color: #555;
	cursor: pointer;
	position: relative;
}
.login-remember input[type="checkbox"] {
	accent-color: #f7871f;
	margin-right: 0.5rem;
}
.login-link {
	color: #f7871f;
	text-decoration: none;
	font-size: 0.97rem;
	font-weight: 500;
	transition: color 0.2s;
}
.login-link:hover {
	color: #ff9800;
	text-decoration: underline;
}
.login-btn {
	width: 100%;
	padding: 0.95rem 0;
	background: #e99a08;
	color: #fff;
	border: none;
	border-radius: 8px;
	font-size: 1.1rem;
	font-weight: 700;
	margin-top: 0.7rem;
	cursor: pointer;
	transition: background 0.2s;
	position: relative;
}
.login-btn:hover {
	background: #f7871f;
	color: #fff;
}
.login-btn:disabled {
	background: #ccc;
	cursor: not-allowed;
}
.login-btn .spinner {
	position: absolute;
	right: 1rem;
	top: 50%;
	transform: translateY(-50%);
	width: 20px;
	height: 20px;
	border: 2px solid #fff;
	border-top-color: transparent;
	border-radius: 50%;
	animation: spin 1s linear infinite;
}
@keyframes spin {
	to {
		transform: translateY(-50%) rotate(360deg);
	}
}
.login-bottom-row {
	margin-top: 1.5rem;
	text-align: center;
	color: #888;
	font-size: 0.97rem;
}
.login-bottom-row .login-link {
	margin-left: 0.3rem;
	font-weight: 600;
}
.login-illustration-col {
	flex: 1.2;
	background: #fc9d04;
	display: flex;
	align-items: center;
	justify-content: center;
	position: relative;
}
.login-illustration-bg {
	width: 100%;
	height: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	position: relative;
}
.login-illustration-img {
	width: 320px;
	height: 220px;
	object-fit: contain;
	margin-bottom: 2.5rem;
	margin-top: 2.5rem;
}
.login-illustration-text {
	color: #fff;
	text-align: center;
	max-width: 340px;
}
.login-illustration-text h2 {
	font-size: 1.3rem;
	font-weight: 700;
	margin-bottom: 0.7rem;
}
.login-illustration-text p {
	font-size: 1.05rem;
	color: #e0e0e0;
}
@media (max-width: 1100px) {
	.login-card {
		flex-direction: column;
		min-height: 0;
		max-width: 500px;
	}
	.login-illustration-col {
		display: none;
	}
	.login-form-col {
		padding: 40px 24px 32px 24px;
	}
}
@media (max-width: 600px) {
	.login-main {
		padding: 0 0.5rem;
	}
	.login-form-col {
		padding: 24px 6px 18px 6px;
	}
	.login-title {
		font-size: 1.5rem;
	}
}
.password-rules {
	font-size: 0.97rem;
	color: #888;
	margin-bottom: 0.7rem;
	margin-left: 2.2rem;
	display: flex;
	flex-direction: column;
	gap: 2px;
}
.password-rules .valid {
	color: #e99a08;
	font-weight: 600;
}
.modal-overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100vw;
	height: 100vh;
	background: rgba(0, 0, 0, 0.4);
	display: flex;
	align-items: center;
	justify-content: center;
	z-index: 1000;
}
.modal {
	background: #fff;
	border-radius: 12px;
	max-width: 420px;
	width: 90vw;
	padding: 2rem 1.5rem 1.5rem 1.5rem;
	box-shadow: 0 8px 32px rgba(0, 0, 0, 0.18);
	position: relative;
}
.close-btn {
	position: absolute;
	top: 12px;
	right: 16px;
	background: none;
	border: none;
	font-size: 2rem;
	color: #e99a08;
	cursor: pointer;
}
.modal-content {
	margin-top: 1rem;
	color: #333;
	font-size: 1rem;
}
.input-mismatch {
	border: 1.5px solid #ff5252 !important;
	background: #fff6f6 !important;
}
.mismatch-msg {
	color: #ff5252;
	font-size: 0.95rem;
	margin-left: 2.2rem;
	margin-top: 2px;
}
.error-message {
	color: #ff5252;
	font-size: 0.9rem;
	margin-top: 0.5rem;
	text-align: center;
}
</style>
