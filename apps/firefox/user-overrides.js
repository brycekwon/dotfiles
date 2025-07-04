/* automatically save to the downloads folder */
user_pref("browser.download.useDownloadDir", true);

/* disable saving passwords */
user_pref("signon.rememberSignons", false);

/* disable tab to switch search engines */
user_pref("browser.urlbar.suggest.engines", false);

/* https://make-firefox-private-again.com/ */
user_pref("dom.private-attribution.submission.enabled", false);

/* disable built-in pocket extension */
user_pref("extensions.pocket.enabled", false);

/* notification interval (in microseconds) to avoid layout thrashing */
user_pref("content.notify.interval", 100000);

/* GPU-accelerated Canvas2D */
user_pref("gfx.canvas.accelerated.cache-items", 4096);
user_pref("gfx.canvas.accelerated.cache-size", 512);
user_pref("gfx.content.skia-font-cache-size", 20);

/* compression level for cached JavaScript bytecode */
user_pref("browser.cache.jsbc_compression_level", 3);

/* media memory cache */
user_pref("media.memory_cache_max_size", 65536);

/* adjust video buffering periods when not using MSE (in seconds) */
user_pref("media.cache_readahead_limit", 7200);
user_pref("media.cache_resume_threshold", 3600);

/* image cache */
user_pref("image.mem.decode_bytes_at_a_time", 32768);

/* increase the absolute number of HTTP connections */
user_pref("network.http.max-connections", 1800);
user_pref("network.http.max-persistent-connections-per-server", 10);
user_pref("network.http.max-urgent-start-excessive-connections-per-host", 5)

/* pacing requests */
user_pref("network.http.pacing.requests.enabled", false);

/* adjust DNS expiration time */
user_pref("network.dnsCacheExpiration", 3600);

/* increase TLS token caching */
user_pref("network.ssl_tokens_cache_capacity", 10240);

/* DNS prefetching for HTMLLinkElement */
user_pref("network.dns.disablePrefetch", true);
user_pref("network.dns.disablePrefetchFromHTTPS", true);

/* link prefetching */
user_pref("network.prefetch-next", false);

/* Network Predictor (NP) */
user_pref("network.predictor.enabled", false);

/* sharpen scrolling */
user_pref("apz.overscroll.enabled", true);
user_pref("general.smoothScroll", true);
user_pref("mousewheel.min_line_scroll_amount", 10);
user_pref("general.smoothScroll.mouseWheel.durationMinMS", 80);
user_pref("general.smoothScroll.currentVelocityWeighting", "0.15");
user_pref("general.smoothScroll.stopDecelerationWeighting", "0.6");

/* remove promotions */
user_pref("browser.privatebrowsing.vpnpromourl", "");
user_pref("browser.preferences.moreFromMozilla", false);

/* disable welcome page */
user_pref("browser.aboutwelcome.enabled", false);

/* disable check default browser */
user_pref("browser.shell.checkDefaultBrowser", false);

/* enable profiles */
user_pref("browser.profiles.enabled", true);

/* add compact mode option */
user_pref("browser.compactmode.show", true);

/* minimize URL bar suggestions */
user_pref("browser.urlbar.suggest.engines", false);
user_pref("browser.urlbar.suggest.calculator", true);
user_pref("browser.urlbar.unitConversion.enabled", true);

/* disable AI nonsense */
user_pref("browser.ml.chat.enabled", false);
user_pref("browser.ml.chat.hideLocalhost", false);

/* disable prompt for managing mailto links */
user_pref("network.protocol-handler.external.mailto", false);

/* dont trim the fucking URLs dumbasses */
user_pref("browser.urlbar.trimURLs", false);
