$(function () {
	function openDatabase(databasse_name) {
		return new Promise((resolve, reject) => {
			const request = indexedDB.open(databasse_name, 1);

			request.onerror = () => {
				reject(request.error);
			};

			request.onsuccess = () => {
				const db = request.result;
				resolve(db);
			};

			request.onupgradeneeded = (event) => {
				const db = event.target.result;
				db.createObjectStore("data", {
					keyPath: "id",
					autoIncrement: true,
				});
			};
		});
	}

	const mode_offline_alert = $(".mode-offline");
	const wrapper = $(".wrapper");
	const loader_html = `<div class="loader"><img src="./assets/images/icons/loader.svg" alt="Loader" /></div>`;
	const navmenu = $("[data-menu=navbar]");
	const uriFragment = window.location.hash;
	const ambilHashUri = uriFragment.substring(1);

	setInterval(function () {
		if (navigator.onLine) {
			mode_offline_alert.fadeOut();
		} else {
			mode_offline_alert.fadeIn();
		}
	}, 500);

	const ajax_page = (page, id = "") => {
		wrapper.html(loader_html);

		setTimeout(function()
		{
			$.ajax({
				url: "./pages/" + page + ".html" + (id != "" ? "?id=" + id : ""),
				timeout: 5000,
				success: function (output) {
					wrapper.html(output);
				},
				error: () => ajax_page("mode_offline"),
			});
		}, 250);
	};

	const load_page = (page) => {
		const pageData = {
			home: {
				icon: {
					".icon-home": "active/house_light.svg",
					".icon-workout": "primary/fire-flame-curved_light.svg",
					".icon-profile": "primary/circle-user_light.svg",
				},
				activePage: "home",
			},
			workouts: {
				icon: {
					".icon-home": "primary/house_light.svg",
					".icon-workout": "active/fire-flame-curved_light.svg",
					".icon-profile": "primary/circle-user_light.svg",
				},
				activePage: "workouts",
			},
			profile: {
				icon: {
					".icon-home": "primary/house_light.svg",
					".icon-workout": "primary/fire-flame-curved_light.svg",
					".icon-profile": "active/circle-user_light.svg",
				},
				activePage: "profile",
			},
		};

		const pageConfig = pageData[page];

		if (!pageConfig) ajax_page("mode_offline");
		else {
			const { icon, activePage } = pageConfig;

			ajax_page(page);

			Object.entries(icon).forEach(([selector, imageUrl]) => {
				$(selector).attr("src", "./assets/images/icons/" + imageUrl);
			});

			$("[data-page]").removeClass("active");
			$(`[data-page=${activePage}]`).addClass("active");
		}
	};

	navmenu.click(function () {
		const get_halaman = $(this).attr("data-page");
		load_page(get_halaman);
	});

	load_page(ambilHashUri == "" ? "home" : ambilHashUri);

	// Workout Start
	// Kalau di pasang di workout.js (looping hasilnya)
	$(document).on("click", ".start_now_workout", function (e) {
		e.preventDefault();
		const id = $(this).attr("data-id");

		ajax_page("start_workout", 0, id);
	});
});
