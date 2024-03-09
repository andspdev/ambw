const CACHE_STATIC = "static";

self.addEventListener("install", function (event) {
	event.waitUntil(
		caches.open(CACHE_STATIC).then(function (cache) {
			cache.addAll([
				"./",
				"./index.html",
				"./sw.js",
				"./manifest.json",

				"./pages/mode_offline.html",
				"./pages/workouts_empty.html",

				"./assets/js/jquery-3.7.1.min.js",
				"./assets/js/bootstrap.bundle.min.js",

				"./assets/css/bootstrap.min.css",
				"./assets/css/styles.css",
				"./assets/images/favicon/favicon.ico",

				"./assets/images/user-icon.png",

				"./assets/images/icons/going-offline_illustration.svg",
				"./assets/images/icons/fitness-stats_illustration.svg",

				"./assets/images/icons/active/house_light.svg",
				"./assets/images/icons/primary/house_light.svg",

				"./assets/images/icons/active/fire-flame-curved_light.svg",
				"./assets/images/icons/primary/fire-flame-curved_light.svg",

				"./assets/images/icons/active/circle-user_light.svg",
				"./assets/images/icons/primary/circle-user_light.svg",

				"./assets/images/icons/active/gear_light.svg",
				"./assets/images/icons/primary/gear_light.svg",

				"./assets/images/favicon/android-icon-36x36.png",
				"./assets/images/favicon/android-icon-48x48.png",
				"./assets/images/favicon/android-icon-72x72.png",
				"./assets/images/favicon/android-icon-96x96.png",
				"./assets/images/favicon/android-icon-144x144.png",
				"./assets/images/favicon/android-icon-192x192.png",

				"./assets/images/icons/loader.svg"
			]);
		})
	);
});

self.addEventListener("activate", function (event) {
	// console.log("[Service Worker] Activating Service Worker ....", event);
	return self.clients.claim();
});

self.addEventListener("fetch", function (event) {
	event.respondWith(
		caches.match(event.request)
		.then(function (response) {
			if (response) {
				return response;
			} else {
				const url = new URL(event.request.url);

				if (url.pathname.endsWith(".php")) {
                    return fetch(event.request);
                } else {
					return fetch(event.request)
						.then(function (res) {
							return caches.open(CACHE_STATIC).then(function (cache) {
								cache.put(event.request.url, res.clone());
								return res;
							});
						})
						.catch(function () {
							return caches.open(CACHE_STATIC).then(function (cache) {
								return cache.match("./pages/mode_offline.html");
							});
						});
					}
			}
		})
	);
});
