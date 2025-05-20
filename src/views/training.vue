<template>
	<div>
		<nav class="nav-container" :class="{ 'nav-scrolled': hasScrolled }">
			<div class="logo-container">
				<div class="logo-image">
					<!-- <img src="/Designer.png" alt="Pawfect" width="40" height="40"> -->
				</div>
				<span class="logo-text">PAWFECT</span>
			</div>

			<div class="nav-links-container">
				<transition name="fade">
					<div
						v-if="mobileMenuOpen || !isMobile"
						class="nav-links"
						:class="{ 'mobile-active': mobileMenuOpen }"
					>
						<a
							href="home"
							class="nav-link"
							@click="closeMenuIfMobile"
							>Home</a
						>
						<a
							href="pet-profiles"
							class="nav-link"
							@click="closeMenuIfMobile"
							>Pet Profiles</a
						>
						<div class="dropdown">
							<a
								href="#"
								class="nav-link dropdown-toggle"
								@click="toggleDropdown"
							>
								Resources
								<span
									class="dropdown-arrow"
									:class="{ 'arrow-rotated': dropdownOpen }"
									>▼</span
								>
							</a>
							<transition name="slide-fade">
								<div
									v-if="isMobile && dropdownOpen"
									class="dropdown-content mobile"
								>
									<a
										href="training"
										@click="closeMenuIfMobile"
										>Training Tips</a
									>
									<a href="#" @click="closeMenuIfMobile"
										>Health Guides</a
									>
								</div>
							</transition>
							<div
								v-if="!isMobile"
								class="dropdown-content desktop"
							>
								<a href="training ">Training Tips</a>
								<a href="#">Health Guides</a>
								<a href="#">Pet Care</a>
							</div>
						</div>
						<a
							href="donations"
							class="nav-link"
							@click="closeMenuIfMobile"
							>Donation</a
						>
						<a href="#" class="nav-link" @click="closeMenuIfMobile"
							>Contact</a
						>
					</div>
				</transition>
			</div>

			<div class="right-section">
				<div
					class="user-icon"
					role="button"
					aria-label="User profile"
					tabindex="0"
				>
					<svg
						xmlns="http://www.w3.org/2000/svg"
						viewBox="0 0 24 24"
						width="24"
						height="24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
					>
						<path
							d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"
						></path>
						<circle cx="12" cy="7" r="4"></circle>
					</svg>
				</div>

				<button
					class="mobile-menu-toggle"
					aria-label="Toggle menu"
					@click="toggleMobileMenu"
				>
					<div
						class="bar"
						:class="{ 'bar-1-active': mobileMenuOpen }"
					></div>
					<div
						class="bar"
						:class="{ 'bar-2-active': mobileMenuOpen }"
					></div>
					<div
						class="bar"
						:class="{ 'bar-3-active': mobileMenuOpen }"
					></div>
				</button>
			</div>
		</nav>

		<!-- Training Tips Content -->
		<div class="training-container">
			<div class="tab-container">
				<button
					class="tab-button"
					:class="{ active: activeTab === 'cats' }"
					@click="activeTab = 'cats'"
				>
					<span class="emoji">🐱</span> Cat Training
				</button>
				<button
					class="tab-button"
					:class="{ active: activeTab === 'dogs' }"
					@click="activeTab = 'dogs'"
				>
					<span class="emoji">🐶</span> Dog Training
				</button>
			</div>

			<!-- Cat Training Section -->
			<div v-if="activeTab === 'cats'" class="training-content">
				<div class="pet-header">
					<h1>🐱 Training Tips for Cats</h1>
				</div>

				<div class="age-section">
					<h2>🐾 Kittens (8 weeks – 1 year)</h2>

					<div class="tip-card">
						<h3>1. Litter Box Training</h3>
						<ul>
							<li>
								<strong>What to do</strong>: Place the litter
								box in a quiet area. Show your kitten the box
								after meals and naps.
							</li>
							<li>
								<strong>Tip</strong>: Use unscented, clumping
								litter. Scoop daily and fully clean weekly.
							</li>
							<li>
								<strong>Mistakes?</strong> Never punish. Gently
								place them in the box after accidents.
							</li>
						</ul>
					</div>

					<div class="tip-card">
						<h3>2. Scratching Furniture</h3>
						<ul>
							<li>
								<strong>Why they do it</strong>: Scratching is
								natural—it sharpens claws, marks territory, and
								stretches muscles.
							</li>
							<li>
								<strong>What to do</strong>: Provide scratching
								posts (both vertical and horizontal types).
							</li>
							<li>
								<strong>Training tip</strong>: Rub catnip on the
								post or use dangling toys to attract them. Place
								it near the furniture they scratch.
							</li>
							<li>
								<strong>Stop damage</strong>: Use double-sided
								tape or a pet-safe deterrent spray on furniture.
								Trim nails regularly or use soft nail caps.
							</li>
						</ul>
					</div>

					<div class="tip-card">
						<h3>3. Play Biting and Clawing</h3>
						<ul>
							<li>
								<strong>What to do</strong>: Use wand toys or
								balls—not hands—for play.
							</li>
							<li>
								<strong>Redirect</strong>: If they bite or claw
								you, stop play immediately. Resume after a
								minute of calm behavior.
							</li>
						</ul>
					</div>

					<div class="tip-card">
						<h3>4. Handling and Socialization</h3>
						<ul>
							<li>
								Gently hold and touch their paws, ears, and
								mouth daily to get them used to grooming and vet
								checks.
							</li>
							<li>
								Invite calm guests over to help socialize them
								with people.
							</li>
						</ul>
					</div>
				</div>

				<div class="age-section">
					<h2>🐾 Adult and Senior Cats</h2>

					<div class="tip-card">
						<h3>1. Reducing Stress</h3>
						<ul>
							<li>
								New homes can be overwhelming. Give them a small
								space (like a quiet room) for the first few
								days.
							</li>
							<li>
								Use calming pheromone diffusers (e.g., Feliway)
								to reduce anxiety.
							</li>
						</ul>
					</div>

					<div class="tip-card">
						<h3>2. Litter Box Issues</h3>
						<ul>
							<li>
								Make sure there's
								<strong>one box per cat plus one extra</strong>.
							</li>
							<li>Clean daily, and avoid scented litters.</li>
							<li>
								If accidents happen outside the box, consult a
								vet to rule out medical issues.
							</li>
						</ul>
					</div>

					<div class="tip-card">
						<h3>3. Scratching Habits</h3>
						<ul>
							<li>
								Cats scratch more when stressed or bored. Use
								<strong>interactive toys</strong> and
								<strong>cat trees</strong>.
							</li>
							<li>
								Offer rewards (treats, pets) when they scratch
								appropriate items.
							</li>
						</ul>
					</div>

					<div class="tip-card">
						<h3>4. Training with Treats</h3>
						<ul>
							<li>
								Yes, cats can be trained! Use
								<strong>treats and clicker training</strong> to
								teach simple commands like "come" or "high
								five."
							</li>
						</ul>
					</div>
				</div>
			</div>

			<!-- Dog Training Section -->
			<div v-if="activeTab === 'dogs'" class="training-content">
				<div class="pet-header">
					<h1>🐶 Training Tips for Dogs</h1>
				</div>

				<div class="age-section">
					<h2>🐾 Puppies (8 weeks – 1 year)</h2>

					<div class="tip-card">
						<h3>1. House Training (Potty)</h3>
						<ul>
							<li>
								<strong>Routine</strong>: Take them outside
								every 1–2 hours and after eating/playing.
							</li>
							<li>
								<strong>Praise</strong>: Reward with treats
								immediately after they go outside.
							</li>
							<li>
								<strong>Accidents?</strong> Never scold. Clean
								with an enzyme cleaner to remove odor.
							</li>
						</ul>
					</div>

					<div class="tip-card">
						<h3>2. Crate Training</h3>
						<ul>
							<li>
								Crates help with housebreaking and provide a
								safe space.
							</li>
							<li>
								Use it for naps and bedtime. Never use it as
								punishment.
							</li>
							<li>Make it cozy with a blanket and a chew toy.</li>
						</ul>
					</div>

					<div class="tip-card">
						<h3>3. Basic Commands</h3>
						<ul>
							<li>Start with: Sit, Stay, Come, Down.</li>
							<li>
								Use treats and repeat in short sessions (5–10
								mins).
							</li>
							<li>Be consistent—use the same words each time.</li>
						</ul>
					</div>

					<div class="tip-card">
						<h3>4. Leash Walking</h3>
						<ul>
							<li>
								Use a short leash and start in a quiet area.
							</li>
							<li>
								Stop walking when they pull; move only when the
								leash is loose.
							</li>
							<li>Praise when they walk beside you calmly.</li>
						</ul>
					</div>
				</div>

				<div class="age-section">
					<h2>🐾 Adult and Senior Dogs</h2>

					<div class="tip-card">
						<h3>1. Breaking Bad Habits</h3>
						<ul>
							<li>
								<strong>Jumping on people</strong>: Ignore and
								turn away. Reward only when they sit calmly.
							</li>
							<li>
								<strong>Chewing</strong>: Provide chew toys.
								Redirect when they chew on furniture or shoes.
							</li>
							<li>
								<strong>Barking</strong>: Identify the cause
								(boredom, fear, excitement) and train
								accordingly. Reward quiet behavior.
							</li>
						</ul>
					</div>

					<div class="tip-card">
						<h3>2. Obedience Refresh</h3>
						<ul>
							<li>Reinforce sit, stay, and come commands.</li>
							<li>Add new tricks to keep their brain active.</li>
						</ul>
					</div>

					<div class="tip-card">
						<h3>3. Fear or Anxiety</h3>
						<ul>
							<li>
								Newly adopted dogs may fear loud noises, stairs,
								or certain people.
							</li>
							<li>
								Build trust with gentle voice, slow movements,
								and lots of positive reinforcement.
							</li>
						</ul>
					</div>

					<div class="tip-card">
						<h3>4. Exercise Needs</h3>
						<ul>
							<li>Adult dogs need regular walks and playtime.</li>
							<li>
								Senior dogs benefit from shorter, gentler walks
								to keep joints flexible.
							</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="bonus-section">
				<h2>✨ Bonus Tips</h2>
				<div class="tip-card bonus">
					<ul>
						<li>
							<strong>Consistency is key</strong>: Everyone in the
							household should use the same rules and commands.
						</li>
						<li>
							<strong>Patience pays off</strong>: Some pets take
							weeks or even months to fully adjust to a new home.
						</li>
						<li>
							<strong>Build trust first</strong>: Especially for
							rescue animals—bonding comes before obedience.
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer Section -->
	<footer class="footer">
		<div class="footer-container">
			<div class="footer-column logo-column">
				<img src="/Designer.png" alt="Pawfect" width="40" height="40" />
				<span class="Footer-logo-text">PAWFECT</span>
				<p class="footer-description">
					Helping paws find their forever home.
				</p>
			</div>
			<div class="footer-column">
				<h4>Quick Links</h4>
				<ul>
					<li><a href="#">Home</a></li>
					<li><a href="#">Pet Profiles</a></li>
					<li><a href="#">Resources</a></li>
					<li><a href="#">Donate</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
			</div>
			<div class="footer-column">
				<h4>Contact</h4>
				<p>Email: support@pawfect.com</p>
				<p>Phone: +123 456 7890</p>
				<p>Location: Gordon College, Olongapo</p>
			</div>
		</div>
		<div class="footer-bottom">
			<p>&copy; 2025 PawfectMatch, Inc. All rights reserved.</p>
		</div>
	</footer>
</template>

<script>
export default {
	name: "PetTrainingTips",
	data() {
		return {
			mobileMenuOpen: false,
			dropdownOpen: false,
			isMobile: false,
			hasScrolled: false,
			activeTab: "cats",
		};
	},
	mounted() {
		this.checkScreenSize();
		window.addEventListener("resize", this.checkScreenSize);
		window.addEventListener("scroll", this.handleScroll);
	},
	beforeUnmount() {
		window.removeEventListener("resize", this.checkScreenSize);
		window.removeEventListener("scroll", this.handleScroll);
	},
	methods: {
		toggleMobileMenu() {
			this.mobileMenuOpen = !this.mobileMenuOpen;
			if (!this.mobileMenuOpen) {
				this.dropdownOpen = false;
			}
			document.body.style.overflow = this.mobileMenuOpen ? "hidden" : "";
		},
		toggleDropdown(event) {
			if (this.isMobile) {
				event.preventDefault();
				this.dropdownOpen = !this.dropdownOpen;
			}
		},
		closeMenuIfMobile() {
			if (this.isMobile) {
				this.mobileMenuOpen = false;
				this.dropdownOpen = false;
				document.body.style.overflow = "";
			}
		},
		checkScreenSize() {
			this.isMobile = window.innerWidth <= 768;
			if (!this.isMobile) {
				this.mobileMenuOpen = false;
				this.dropdownOpen = false;
				document.body.style.overflow = "";
			}
		},
		handleScroll() {
			this.hasScrolled = window.scrollY > 20;
		},
	},
};
</script>

<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

.nav-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #f9a826;
	padding: 0.75rem 2rem;
	color: white;
	position: sticky;
	top: 0;
	left: 0;
	right: 0;
	width: 100%;
	z-index: 1000;
	transition: all 0.3s ease;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.nav-scrolled {
	padding: 0.5rem 2rem;
	background-color: rgba(249, 168, 38, 0.95);
	backdrop-filter: blur(10px);
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

/* Logo Styles */
.logo-container {
	display: flex;
	align-items: center;
	gap: 0.5rem;
}

.logo-image {
	display: flex;
	align-items: center;
	justify-content: center;
	transition: transform 0.3s ease;
}

.logo-container:hover .logo-image {
	transform: scale(1.1) rotate(5deg);
}

.logo-text {
	font-size: 1.75rem;
	font-weight: 800;
	letter-spacing: 1.5px;
	color: white;
	text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
	transition: transform 0.3s ease;
}

.logo-container:hover .logo-text {
	transform: translateX(3px);
}

.nav-links-container {
	flex: 1;
	display: flex;
	justify-content: center;
}

/* Navigation Links List */
.nav-links {
	display: flex;
	gap: 2rem;
	align-items: center;
	list-style: none;
}

.nav-link {
	color: white;
	text-decoration: none;
	font-size: 1.1rem;
	font-weight: 600;
	position: relative;
	padding: 0.5rem 0;
	transition: all 0.2s ease;
}

.nav-link:after {
	content: "";
	position: absolute;
	width: 0;
	height: 2px;
	bottom: 0;
	left: 0;
	background-color: white;
	transition: width 0.3s ease;
}

.nav-link:hover:after {
	width: 100%;
}

/* Dropdown Styles */
.dropdown {
	position: relative;
}

.dropdown-arrow {
	font-size: 0.7rem;
	vertical-align: middle;
	margin-left: 4px;
	transition: transform 0.3s ease;
}

.arrow-rotated {
	transform: rotate(180deg);
}

.dropdown-content {
	min-width: 180px;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
	overflow: hidden;
	z-index: 1;
}

.dropdown-content.desktop {
	display: none;
	position: absolute;
	top: 100%;
	left: 50%;
	transform: translateX(-50%);
	margin-top: 0.75rem;
	background-color: white;
	opacity: 0;
	pointer-events: none;
	transition: opacity 0.3s ease, transform 0.3s ease, visibility 0.3s;
	visibility: hidden;
}

.dropdown:hover .dropdown-content.desktop {
	display: block;
	opacity: 1;
	pointer-events: auto;
	visibility: visible;
	transform: translateX(-50%) translateY(0);
}

.dropdown-content a {
	padding: 0.75rem 1rem;
	text-decoration: none;
	display: block;
	transition: all 0.2s ease;
}

.dropdown-content.desktop a {
	color: #333;
	font-weight: 500;
}

.dropdown-content.desktop a:hover {
	background-color: #f8f8f8;
	padding-left: 1.25rem;
}

.dropdown-content.mobile {
	display: none;
	background-color: rgba(255, 255, 255, 0.1);
	border-radius: 8px;
	margin-top: 0.5rem;
	padding-left: 1rem;
	box-shadow: none;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.3s ease-out, padding 0.3s ease-out;
}

.dropdown.mobile-submenu-open .dropdown-content.mobile {
	display: block;
	max-height: 300px;
	padding-top: 0.5rem;
	padding-bottom: 0.5rem;
}

.dropdown-content.mobile a {
	color: white;
	padding: 0.75rem 1.5rem; /* Full width tappable area */
	border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

.dropdown-content.mobile a:last-child {
	border-bottom: none;
}

.right-section {
	display: flex;
	align-items: center;
	gap: 1.5rem;
}

.user-icon {
	color: white;
	cursor: pointer;
	width: 36px;
	height: 36px;
	background-color: rgba(255, 255, 255, 0.2);
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	transition: all 0.3s ease;
}

.user-icon:hover {
	transform: scale(1.1);
	background-color: rgba(255, 255, 255, 0.3);
}

.mobile-menu-toggle {
	display: none;
	flex-direction: column;
	justify-content: space-between;
	width: 28px;
	height: 20px;
	background: transparent;
	border: none;
	cursor: pointer;
	padding: 0;
	z-index: 1001;
}

.bar {
	height: 3px;
	width: 100%;
	background-color: white;
	border-radius: 10px;
	transition: all 0.3s ease-in-out;
}

.mobile-menu-toggle.active .bar-1 {
	transform: translateY(8.5px) rotate(45deg);
}
.mobile-menu-toggle.active .bar-2 {
	opacity: 0;
}
.mobile-menu-toggle.active .bar-3 {
	transform: translateY(-8.5px) rotate(-45deg);
}

.fade-enter-active,
.fade-leave-active {
	transition: opacity 0.3s ease;
}
.fade-enter-from,
.fade-leave-to {
	opacity: 0;
}
.slide-fade-enter-active,
.slide-fade-leave-active {
	transition: all 0.3s ease;
}
.slide-fade-enter-from,
.slide-fade-leave-to {
	transform: translateY(-20px);
	opacity: 0;
}

.training-container {
	max-width: 1200px;
	margin: 2rem auto;
	padding: 0 1.5rem;
	animation: fadeIn 0.8s ease-in;
}
@keyframes fadeIn {
	from {
		opacity: 0;
	}
	to {
		opacity: 1;
	}
}
.tab-container {
	display: flex;
	justify-content: center;
	gap: 1rem;
	margin-bottom: 2rem;
	flex-wrap: wrap;
}
.tab-button {
	padding: 0.75rem 1.5rem;
	background-color: #f5f5f5;
	border: none;
	border-radius: 50px;
	font-size: 1.1rem;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.3s ease;
	display: flex;
	align-items: center;
	gap: 0.5rem;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
}
.tab-button.active {
	background-color: #f9a826;
	color: white;
	box-shadow: 0 4px 15px rgba(249, 168, 38, 0.4);
	transform: scale(1.05);
}
.tab-button:hover:not(.active) {
	background-color: #ececec;
	transform: translateY(-2px);
}
.emoji {
	font-size: 1.3rem;
}
.pet-header {
	text-align: center;
	margin-bottom: 2rem;
}
.pet-header h1 {
	font-size: 2.5rem;
	color: #333;
	display: inline-block;
	padding-bottom: 0.5rem;
	border-bottom: 3px solid #f9a826;
	transition: all 0.3s ease;
}
.pet-header h1:hover {
	color: #f9a826;
	letter-spacing: 1px;
}
.age-section {
	margin-bottom: 3rem;
	animation: fadeIn 0.6s ease-in;
}
.tip-card {
	background-color: white;
	border-radius: 15px;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.06);
	margin-bottom: 2rem;
	padding: 1.75rem;
	transition: transform 0.4s ease, box-shadow 0.4s ease;
	border-left: 6px solid #f9a826;
}
.tip-card:hover {
	transform: scale(1.02);
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
}
.tip-card h3 {
	color: #f9a826;
	font-size: 1.5rem;
	margin-bottom: 1.2rem;
}
.tip-card ul {
	list-style: none;
	padding-left: 0;
}
.tip-card li {
	position: relative;
	padding-left: 2rem;
	margin-bottom: 0.9rem;
	line-height: 1.7;
	font-size: 1.05rem;
	transition: color 0.3s;
}
.tip-card li::before {
	content: "✨";
	position: absolute;
	left: 0;
	top: 0;
	font-size: 1.1rem;
	transition: transform 0.3s;
}
.tip-card li:hover {
	color: #f9a826;
}
.tip-card li:hover::before {
	transform: rotate(15deg) scale(1.2);
}
.bonus-section {
	background: linear-gradient(to right, #fff8e6, #fff3cc);
	padding: 2.5rem;
	border-radius: 15px;
	margin-top: 2.5rem;
	box-shadow: 0 6px 18px rgba(0, 0, 0, 0.05);
	animation: fadeIn 1s ease-in;
}
.bonus-section h2 {
	text-align: center;
	margin-bottom: 1.5rem;
	color: #333;
	font-size: 1.9rem;
	font-weight: 700;
}
.tip-card.bonus {
	background-color: #fffaf0;
	border-left: 6px solid #f9a826;
}

/* Footer Styles */
.footer {
	background-color: #f6f6f6;
	color: #333;
	padding: 40px 20px 20px;
	font-family: Arial, sans-serif;
	margin-top: 60px;
	border-top: 1px solid #ddd;
}
.footer-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	gap: 40px;
	max-width: 1200px;
	margin: 0 auto;
}
.footer-column {
	flex: 1 1 250px;
}
.logo-column {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
}
.logo-column img {
	margin-bottom: 10px;
	max-width: 150px;
	height: auto;
}
.Footer-logo-text {
	font-size: 24px;
	font-weight: bold;
	color: #2b7a78;
	margin-bottom: 8px;
}
.footer-description {
	font-size: 14px;
	color: #666;
}
.footer-column h4 {
	font-size: 16px;
	font-weight: bold;
	margin-bottom: 12px;
	color: #17252a;
}
.footer-column ul {
	list-style: none;
	padding: 0;
	margin: 0;
}
.footer-column ul li {
	margin-bottom: 8px;
}
.footer-column ul li a {
	text-decoration: none;
	color: #333;
	transition: color 0.3s;
}
.footer-column ul li a:hover {
	color: #2b7a78;
}
.footer-bottom {
	text-align: center;
	margin-top: 30px;
	font-size: 14px;
	color: #888;
	border-top: 1px solid #ddd;
	padding-top: 20px;
}
/* -------------------- MEDIA QUERIES -------------------- */

@media (max-width: 992px) {
	.nav-container {
		padding: 0.75rem 1rem;
	}
	.nav-scrolled {
		padding: 0.5rem 1rem;
	}

	.logo-text {
		font-size: 1.6rem;
	}

	.nav-links-container {
		order: 3;
		display: none;
		flex-direction: column;
		position: absolute;
		top: 100%;
		left: 0;
		right: 0;
		background-color: rgba(249, 168, 38, 0.98);
		backdrop-filter: blur(5px);
		padding: 1rem 0;
		box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
		z-index: 999;
		max-height: calc(100vh - 55px);
		overflow-y: auto;
		align-items: stretch;
	}

	.nav-links-container.mobile-nav-active {
		display: flex;
	}

	.nav-links-container .nav-links {
		flex-direction: column;
		width: 100%;
		gap: 0;
		align-items: stretch;
	}

	.nav-links-container .nav-link {
		padding: 0.8rem 1.5rem;
		font-size: 1rem;
		border-bottom: 1px solid rgba(255, 255, 255, 0.15);
		text-align: left;
	}
	.nav-links-container .nav-link:last-child {
		border-bottom: none;
	}
	.nav-links-container .nav-link:after {
		display: none;
	}

	.nav-links-container .dropdown {
		width: 100%;
	}
	.nav-links-container .dropdown.mobile-submenu-open > .nav-link {
		border-bottom-color: transparent;
	}

	.nav-links-container .dropdown .dropdown-arrow {
		position: absolute;
		right: 1.5rem;
		top: 50%;
		transform: translateY(-50%);
	}
	.nav-links-container .dropdown .dropdown-content.desktop {
		display: none !important;
	}

	.mobile-menu-toggle {
		display: flex;
		order: 2;
	}

	.right-section {
		gap: 1rem;
	}
}
/* Smaller Devices (Phones)*/
@media (max-width: 768px) {
	.tab-container {
		flex-direction: column;
		gap: 0.75rem;
	}
	.tab-button {
		width: 100%;
		justify-content: center;
	}
	.pet-header h1 {
		font-size: 2rem;
	}
	.age-section h2 {
		font-size: 1.6rem;
	}
	.tip-card h3 {
		font-size: 1.3rem;
	}
	.tip-card {
		padding: 1.5rem;
	}
	.footer-column {
		flex-basis: calc(50% - 20px);
	}
}

@media (max-width: 600px) {
	.footer-container {
		flex-direction: column;
		align-items: center;
	}
	.footer-column {
		flex-basis: 100%;
		text-align: center;
		margin-bottom: 25px;
	}
	.footer-column:last-child {
		margin-bottom: 0;
	}
	.logo-column {
		align-items: center;
	}
}
@media (max-width: 480px) {
	.nav-container {
		padding: 0.75rem 0.75rem;
	}
	.nav-scrolled {
		padding: 0.5rem 0.75rem;
	}
	.logo-text {
		font-size: 1.4rem;
	}
	.right-section {
		gap: 0.75rem;
	}
	.user-icon {
		width: 32px;
		height: 32px;
	}

	.pet-header h1 {
		font-size: 1.8rem;
	}
	.tip-card {
		padding: 1.25rem;
	}
	.bonus-section {
		padding: 1.5rem;
	}
	.training-container {
		padding: 0 1rem;
	}
}
</style>
