/* disable check for default browser */
user_pref("browser.shell.checkDefaultBrowser", false);

user_pref("browser.startup.page", 1);
user_pref("browser.startup.homepage", "about:home");
user_pref("browser.newtabpage.enabled", true);

/* disable pocket */
user_pref("extensions.pocket.enabled", false);

/* disable spellcheck */
user_pref("layout.spellcheckDefault", 0);

/* disable password saving */
user_pref("signon.rememberSignons", false);
user_pref("signon.generation.enabled", false);

/* disable password alerts */
user_pref("signon.management.page.breach-alerts.enabled", false);
user_pref("signon.management.page.breachAlertUrl", "");

/* disable auto-filling username and password */
user_pref("signon.autofillForms", false);

/* disable formless capture for Password Manager */
user_pref("signon.formlessCapture.enabled", false);

/* limit HTTP authentication credential dialogs */
user_pref("network.auth.subresource-http-auth-allow", 1);

/* disable Firefox Relay feature */
user_pref("signon.firefoxRelay.feature", "disabled");

/* disable Form Autofill */
user_pref("browser.formfill.enable", false);
user_pref("dom.forms.autocomplete.formautofill", false);
user_pref("extensions.formautofill.addresses.enabled", false);
user_pref("extensions.formautofill.creditCards.enabled", false);
user_pref("extensions.formautofill.heuristics.enabled", false);

/* disable location bar suggestion types */
user_pref("browser.urlbar.suggest.history", false);
user_pref("browser.urlbar.suggest.bookmark", false);
user_pref("browser.urlbar.suggest.openpage", false);
user_pref("browser.urlbar.suggest.topsites", false);
user_pref("browser.urlbar.suggest.engines", false);

/* set the default DNS setting to off */
user_pref("network.trr.mode", 5);
user_pref("network.trr.custom_uri", "https://base.dns.mullvad.net/dns-query")
user_pref("network.trr.uri", "https://base.dns.mullvad.net/dns-query");
user_pref("network.trr.mode", 5);
user_pref("network.trr.mode", 5);
user_pref("network.trr.mode", 5);
user_pref("network.trr.mode", 5);
user_pref("network.trr.custom_uri", "https://base.dns.mullvad.net/dns-query")
user_pref("network.trr.uri", "https://base.dns.mullvad.net/dns-query");
user_pref("network.trr.custom_uri", "https://base.dns.mullvad.net/dns-query")
user_pref("network.trr.uri", "https://base.dns.mullvad.net/dns-query");
user_pref("network.trr.custom_uri", "https://base.dns.mullvad.net/dns-query")
user_pref("network.trr.uri", "https://base.dns.mullvad.net/dns-query");
user_pref("network.trr.custom_uri", "https://base.dns.mullvad.net/dns-query")
user_pref("network.trr.uri", "https://base.dns.mullvad.net/dns-query");

/* save to downloads folder */
user_pref("browser.download.useDownloadDir", true);
user_pref("browser.download.useDownloadDir", true);
user_pref("browser.download.useDownloadDir", true);
user_pref("browser.download.useDownloadDir", true);

/* save files with unknown mimetypes by default */
user_pref("browser.download.always_ask_before_handling_new_types", false);

/* disable add mailto application */
user_pref("network.protocol-handler.external.mailto", false);

/* override recipe: RFP is not for me ***/
user_pref("privacy.resistFingerprinting", false); // 4501
user_pref("privacy.resistFingerprinting.letterboxing", false); // 4504 [pointless if not using RFP]
user_pref("webgl.disabled", false); // 4520 [mostly pointless if not using RFP]