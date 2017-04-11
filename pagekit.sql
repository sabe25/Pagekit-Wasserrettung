-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 11. Apr 2017 um 11:17
-- Server-Version: 10.1.19-MariaDB
-- PHP-Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `pagekit`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_blog_comment`
--

DROP TABLE IF EXISTS `pk_blog_comment`;
CREATE TABLE `pk_blog_comment` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `pk_blog_comment`
--

INSERT INTO `pk_blog_comment` (`id`, `parent_id`, `post_id`, `user_id`, `author`, `email`, `url`, `ip`, `created`, `content`, `status`) VALUES
(1, 0, 2, '1', 'admin', 'thomas.sabe@gmx.at', '', '::1', '2016-04-24 16:32:19', 'ldshjavblweiuö', 1),
(2, 0, 3, '1', 'admin', 'thomas.sabe@gmx.at', '', '::1', '2017-02-21 20:04:12', 'safsdfsd', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_blog_post`
--

DROP TABLE IF EXISTS `pk_blog_post`;
CREATE TABLE `pk_blog_post` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  `date` datetime DEFAULT NULL,
  `modified` datetime NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` longtext COLLATE utf8_unicode_ci NOT NULL,
  `comment_status` tinyint(1) NOT NULL DEFAULT '0',
  `comment_count` int(11) NOT NULL DEFAULT '0',
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)',
  `roles` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `pk_blog_post`
--

INSERT INTO `pk_blog_post` (`id`, `user_id`, `slug`, `title`, `status`, `date`, `modified`, `content`, `excerpt`, `comment_status`, `comment_count`, `data`, `roles`) VALUES
(1, 1, 'hello-pagekit', 'Hello Pagekit', 2, '2016-04-20 17:59:23', '2016-04-20 17:59:23', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '', 1, 0, '{"title":null,"markdown":true}', NULL),
(2, 1, 'nnews', 'New News', 2, '2016-04-24 16:29:38', '2016-04-24 16:31:02', '**Lorem ipsum** dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.', '', 1, 1, '{"title":null,"markdown":true,"image":{"src":"storage\\/OWR-Abziehbild_gross.gif","alt":"OWR Abziehbild gross"}}', NULL),
(3, 1, 'aufgaben', 'Aufgaben', 2, '2016-04-24 19:33:52', '2017-04-11 09:08:45', '##Terminliste\nTerminliste die im Backend bereich steuerbar ist (insert, delete, update)\n+ Extention installiert\n+ Liste wird angezeigt\n+ Probleme bei /get/{id}\n + 6 Std\n+ Probleme bei /id/{id}\n+ Hinzufügen von Terminen Möglich\n + 4 Std\n+ Löschen und updaten von Terminen funktioniert\n+ Probleme mit Permissions\n+ System ins git übernommen\n + 5 Std\n\n##Vorstand\nKurze Auflistung aller Vorstände + Kontaktdaten(Auer, Steve)\n\n##Blog\n####intern\nFür aktive Mitglieder zum posten von Aufgaben, Ereignisse, Diskusionen etc.\n\n####extern\nUm der Öffentlichkeit neuigkeiten, Events, Veranstaltungen etc. mitzuteilen\n\n\n###Dienstplan Übersicht (eventuel)\nMitglied kan einsicht nehmen auf die Dienstverteilung an den Wochenenden sowie bei Spezialveranstaltungen. er kann sich für dienste selbst eintragen\n\n###Kursanmeldungen mittels Formular\nInteressierte können sich über ein Formular bei Erste Hilfe Kurse oder Ausbildungen im Rettungwesen anmelden. Anmeldungen werden mit vollem Name, Adresse und E-Mail Adresse in der Datenbank gespeichert. Rückmeldung muss leider manuel erfolgen da kein smtp server zur verfügung steht.\n\n## dynamische Listen erstellung\nMöglichkeit mehrere Listen zu erstellen mit selbsdefinierbaren Spalten\nidee: zwei tabellen\n+ Definitions Tabelle in der die definition der spalten für jede Tabelle eingetragen ist (mit nummerierung)\n+ Content Tabelle in der via csv? oder ähnliches die daten gespeichert werden; vl als json\nvl sollte eine zugriffs begrenzung auf die jeweiligen Tabellen erfolgen\n\n###Content\n+ 2h 10.04 (Das Team)\n+ 4h 11.04 (Ausbildung)', '', 1, 1, '{"title":null,"markdown":true,"image":{"src":"","alt":""}}', '2,3,4,5');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_calendar_events`
--

DROP TABLE IF EXISTS `pk_calendar_events`;
CREATE TABLE `pk_calendar_events` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `start` date NOT NULL,
  `end` date NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `className` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `editable` tinyint(1) NOT NULL,
  `startEditable` tinyint(1) NOT NULL,
  `durationEditable` tinyint(1) NOT NULL,
  `overlap` tinyint(1) NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `creatorID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `pk_calendar_events`
--

INSERT INTO `pk_calendar_events` (`id`, `title`, `description`, `start`, `end`, `url`, `className`, `editable`, `startEditable`, `durationEditable`, `overlap`, `color`, `creatorID`) VALUES
(48, 'Pötscher', 'Ich bin hier im Einsatz', '2016-07-10', '2016-07-10', '', 'fc-event-dienst', 1, 1, 1, 1, '', 1),
(49, 'Sablattnig', 'Ich bin hier im Einsatz', '2016-07-09', '2016-07-09', '', 'fc-event-dienst', 1, 1, 1, 1, '', 1),
(50, 'Bräuhaupt', 'Ich bin hier im Einsatz', '2016-07-10', '2016-07-10', '', 'fc-event-dienst', 1, 1, 1, 1, '', 1),
(51, 'Wolfi', 'Ich bin hier im Einsatz', '2016-07-17', '2016-07-17', '', 'fc-event-dienst', 1, 1, 1, 1, '', 1),
(52, 'Wolfi', 'Ich bin hier im Einsatz', '2016-07-23', '2016-07-23', '', 'fc-event-dienst', 1, 1, 1, 1, '', 1),
(53, 'Bertl', 'Ich bin hier im Einsatz', '2016-07-16', '2016-07-18', '', 'fc-event-dienst', 1, 1, 1, 1, '', 1),
(54, 'Actionstag', 'Kleiner Actionstag für Kinder von 10:00-16:00', '2016-07-23', '2016-07-23', '', 'fc-event-veranstaltung', 1, 1, 1, 1, '', 1),
(55, 'Rettungsschwimmer Ausbildung', 'Rettungsschwimmer Ausbildung mit Bräuhaupt und Auer\ntäglich 17:00', '2016-07-05', '2016-07-08', '', 'undefined', 1, 1, 1, 1, '', 1),
(56, 'Ferien Beginn Party', 'Feierlichkeiten mit Blobbing', '2016-07-11', '2016-07-11', '', 'fc-event-big', 1, 1, 1, 1, '', 1),
(57, 'undefined', 'undefined', '0000-00-00', '0000-00-00', '', 'undefined', 1, 1, 1, 1, '', 1),
(59, 'thomas sablattnig', 'Ich bin hier im Einsatz', '2016-08-13', '2016-08-13', '', 'fc-event-dienst', 1, 1, 1, 1, '', 1),
(60, 'sadafsdf', 'afsdf', '2016-08-10', '2016-08-11', '', 'fc-event-veranstaltung', 1, 1, 1, 1, '', 1),
(61, 'adminasdfasdfasd', 'Ich bin hier im Einsatz', '2016-08-14', '2016-08-14', '', 'fc-event-dienst', 1, 1, 1, 1, '', 1),
(62, 'admin', 'Ich bin hier im Einsatz', '2017-01-04', '2017-01-04', '', 'fc-event-dienst', 1, 1, 1, 1, '', 1),
(63, 'admin', 'Ich bin hier im Einsatz', '2017-02-18', '2017-02-18', '', 'fc-event-dienst', 1, 1, 1, 1, '', 1),
(64, 'admin', 'Ich bin hier im Einsatz', '2017-02-26', '2017-02-26', '', 'fc-event-dienst', 1, 1, 1, 1, '', 1),
(65, 'Hauptveranstaltung', 'asdf', '2017-03-01', '2017-03-04', '', 'fc-event-big', 1, 1, 1, 1, '', 1),
(80, 'admin', 'Ich bin hier im Einsatz', '2017-04-14', '2017-04-14', '', 'fc-event-dienst', 1, 1, 1, 1, '', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_hello_greetings`
--

DROP TABLE IF EXISTS `pk_hello_greetings`;
CREATE TABLE `pk_hello_greetings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_portfolio_project`
--

DROP TABLE IF EXISTS `pk_portfolio_project`;
CREATE TABLE `pk_portfolio_project` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` smallint(6) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` longtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `client` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` tinytext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)',
  `date` datetime NOT NULL,
  `tags` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)',
  `images` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)',
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `pk_portfolio_project`
--

INSERT INTO `pk_portfolio_project` (`id`, `status`, `priority`, `title`, `slug`, `subtitle`, `intro`, `content`, `client`, `image`, `date`, `tags`, `images`, `data`) VALUES
(1, 1, 1, 'Test', 'test', 'Lichterfest', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam', '', 'teset1', '{"teaser":{"src":"storage\\/home-hero.jpg","alt":"Markus"},"main":{"src":"storage\\/home-hero.jpg","alt":"Home hero"}}', '2016-04-24 16:44:43', NULL, '[{"show_teaser":true,"descr":"","filename":"headerImg-01-lg-1x.jpg","src":"storage\\/Portfolio\\/Test\\/headerImg-01-lg-1x.jpg","title":"HeaderImg-01-lg-1x"},{"show_teaser":true,"descr":"","filename":"stage-01-lg-1x.jpg","src":"storage\\/Portfolio\\/Test\\/stage-01-lg-1x.jpg","title":"Stage-01-lg-1x"},{"show_teaser":true,"descr":"","filename":"stage-02-lg-1x.jpg","src":"storage\\/Portfolio\\/Test\\/stage-02-lg-1x.jpg","title":"Stage-02-lg-1x"}]', '{"markdown":true}');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_system_auth`
--

DROP TABLE IF EXISTS `pk_system_auth`;
CREATE TABLE `pk_system_auth` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `access` datetime DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `pk_system_auth`
--

INSERT INTO `pk_system_auth` (`id`, `user_id`, `access`, `status`, `data`) VALUES
('28e216734bd9414e3ef7f525c65a152ac0923bd2', 1, '2017-02-21 20:51:10', 1, '{"ip":"::1","user-agent":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/56.0.2924.87 Safari\\/537.36"}'),
('542ebe2007419210c4c09c577cbbc8c7c52d9eaf', 1, '2016-06-23 12:30:30', 1, '{"ip":"::1","user-agent":"Mozilla\\/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko\\/20100101 Firefox\\/47.0"}'),
('8763cc02247a68060a174f503066aa8ef8a1941f', 1, '2016-05-03 17:53:14', 1, '{"ip":"::1","user-agent":"Mozilla\\/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko\\/20100101 Firefox\\/45.0"}'),
('95c8ba8627575e453c241be6df35904c353ec460', 3, '2017-02-21 20:01:33', 1, '{"ip":"::1","user-agent":"Mozilla\\/5.0 (Windows NT 10.0; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.98 Safari\\/537.36 Vivaldi\\/1.6.689.40"}'),
('c05b91b57229a0bae314b5e6b642a3995f652c58', 1, '2017-04-11 09:11:56', 1, '{"ip":"::1","user-agent":"Mozilla\\/5.0 (Windows NT 10.0; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/57.0.2987.138 Safari\\/537.36 Vivaldi\\/1.8.770.56"}'),
('c5d70d010d56d5c5fb7235b091699d2b3bd4248b', 1, '2016-08-11 07:39:55', 1, '{"ip":"::1","user-agent":"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/51.0.2704.103 Safari\\/537.36 Vivaldi\\/1.2.490.43"}');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_system_config`
--

DROP TABLE IF EXISTS `pk_system_config`;
CREATE TABLE `pk_system_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `pk_system_config`
--

INSERT INTO `pk_system_config` (`id`, `name`, `value`) VALUES
(1, 'system/dashboard', '{"55dda578e93b5":{"type":"location","column":1,"idx":0,"units":"metric","id":"55dda578e93b5","uid":2774326,"city":"Klagenfurt am Woerthersee","country":"AT","coords":{"lon":14.30528,"lat":46.624722}},"55dda581d5781":{"type":"feed","column":2,"idx":0,"count":5,"content":"1","id":"55dda581d5781","title":"Pagekit News","url":"http:\\/\\/pagekit.com\\/blog\\/feed"},"55dda6e3dd661":{"type":"user","column":0,"idx":100,"show":"registered","display":"thumbnail","total":"1","count":12,"id":"55dda6e3dd661"},"58acaad3431b5":{"type":"hello","column":0,"idx":100,"title":"","id":"58acaad3431b5"}}'),
(2, 'system/site', '{"menus":{"main":{"id":"main","label":"Main"},"offc":{"id":"offc","label":"offc"}},"title":"Wasserrettung Längsee","frontpage":1,"view":{"logo":"storage\\/OWR-Kreuz_200.gif"},"description":"","maintenance":{"enabled":false,"msg":"","logo":""},"icons":{"favicon":"storage\\/favicon_WR.ico","appicon":"storage\\/favicon_WR.ico"},"code":{"header":"","footer":""}}'),
(3, 'system', '{"admin":{"locale":"de_AT"},"site":{"locale":"de_AT","theme":"theme-one"},"version":"1.0.10","packages":{"blog":"1.0.1","theme-one":"1.0.0","hello":"1.0.0","bixie\\/portfolio":"1.1.3","termine":"1.0.0","calendar":"2.0.0"},"extensions":{"0":"blog","2":"bixie\\/portfolio","3":"termine","4":"blog","5":"blog","6":"calendar"}}'),
(6, 'theme-one', '{"logo_contrast":"storage\\/OWR-Kreuz_200.gif","_menus":{"main":"main","offcanvas":"offc"},"_positions":{"hero":[1],"footer":[2],"sidebar":[3,4],"navbar":[],"offcanvas":[6],"bottom":[5]},"_widgets":{"1":{"title_hide":false,"title_size":"uk-h1 uk-margin-top-remove","alignment":true,"html_class":"","panel":""},"2":{"title_hide":true,"title_size":"uk-panel-title","alignment":"true","html_class":"","panel":""},"3":{"title_hide":true,"title_size":"uk-panel-title","alignment":true,"html_class":"","panel":"uk-panel-box"},"4":{"title_hide":false,"title_size":"uk-h3 uk-margin-top-remove","alignment":"","html_class":"","panel":"uk-panel-box"},"5":{"title_hide":true,"title_size":"uk-panel-title","alignment":true,"html_class":"","panel":"uk-panel-box"},"6":{"title_hide":false,"title_size":"uk-panel-title","alignment":"","html_class":"","panel":""}},"_nodes":{"1":{"title_hide":true,"title_large":false,"alignment":true,"html_class":"","sidebar_first":false,"hero_image":"storage\\/Markus.jpg","hero_viewport":false,"hero_contrast":true,"hero_parallax":false,"navbar_transparent":true,"top_style":"uk-block-muted","main_style":"uk-block-default","bottom_style":"uk-block-muted"},"3":{"title_hide":false,"title_large":false,"alignment":"","html_class":"","sidebar_first":false,"hero_image":"","hero_viewport":"","hero_contrast":"","hero_parallax":"","navbar_transparent":"","top_style":"uk-block-muted","main_style":"uk-block-default","bottom_style":"uk-block-muted"},"4":{"title_hide":false,"title_large":false,"alignment":"","html_class":"","sidebar_first":false,"hero_image":"","hero_viewport":"","hero_contrast":"","hero_parallax":"","navbar_transparent":"","top_style":"uk-block-muted","main_style":"uk-block-default","bottom_style":"uk-block-muted"},"5":{"title_hide":false,"title_large":false,"alignment":"","html_class":"","sidebar_first":false,"hero_image":"","hero_viewport":"","hero_contrast":"","hero_parallax":"","navbar_transparent":"","top_style":"uk-block-muted","main_style":"uk-block-default","bottom_style":"uk-block-muted"},"6":{"title_hide":false,"title_large":false,"alignment":"","html_class":"","sidebar_first":false,"hero_image":"","hero_viewport":"","hero_contrast":"","hero_parallax":"","navbar_transparent":"","top_style":"uk-block-muted","main_style":"uk-block-default","bottom_style":"uk-block-muted"},"2":{"title_hide":false,"title_large":false,"alignment":"","html_class":"","sidebar_first":false,"hero_image":"","hero_viewport":"","hero_contrast":"","hero_parallax":"","navbar_transparent":"","top_style":"uk-block-muted","main_style":"uk-block-default","bottom_style":"uk-block-muted"},"7":{"title_hide":false,"title_large":false,"alignment":"","html_class":"","sidebar_first":false,"hero_image":"","hero_viewport":"","hero_contrast":"","hero_parallax":"","navbar_transparent":"","top_style":"uk-block-muted","main_style":"uk-block-default","bottom_style":"uk-block-muted"},"8":{"title_hide":false,"title_large":false,"alignment":"","html_class":"","sidebar_first":false,"hero_image":"","hero_viewport":"","hero_contrast":"","hero_parallax":"","navbar_transparent":"","top_style":"uk-block-muted","main_style":"uk-block-default","bottom_style":"uk-block-muted"},"9":{"title_hide":false,"title_large":false,"alignment":"","html_class":"","sidebar_first":false,"hero_image":"","hero_viewport":"","hero_contrast":"","hero_parallax":"","navbar_transparent":"","top_style":"uk-block-muted","main_style":"uk-block-default","bottom_style":"uk-block-muted"},"10":{"title_hide":false,"title_large":false,"alignment":"","html_class":"","sidebar_first":false,"hero_image":"","hero_viewport":"","hero_contrast":"","hero_parallax":"","navbar_transparent":"","top_style":"uk-block-muted","main_style":"uk-block-default","bottom_style":"uk-block-muted"},"11":{"title_hide":false,"title_large":false,"alignment":"","html_class":"","sidebar_first":false,"hero_image":"","hero_viewport":"","hero_contrast":"","hero_parallax":"","navbar_transparent":"","top_style":"uk-block-muted","main_style":"uk-block-default","bottom_style":"uk-block-muted"},"12":{"title_hide":false,"title_large":false,"alignment":"","html_class":"","sidebar_first":false,"hero_image":"","hero_viewport":"","hero_contrast":"","hero_parallax":"","navbar_transparent":"","top_style":"uk-block-muted","main_style":"uk-block-default","bottom_style":"uk-block-muted"},"13":{"title_hide":false,"title_large":false,"alignment":"","html_class":"","sidebar_first":false,"hero_image":"","hero_viewport":"","hero_contrast":"","hero_parallax":"","navbar_transparent":"","top_style":"uk-block-muted","main_style":"uk-block-default","bottom_style":"uk-block-muted"}},"logo_offcanvas":""}'),
(37, 'hello', '{"default":"World","allowTermine":false}'),
(44, 'system/finder', '{"extensions":"bmp,gif,jpeg,jpg,mp4,ogg,pdf,png,svgz,svg,swf"}'),
(45, 'system/mail', '{"driver":"mail","host":"localhost","port":25,"username":null,"password":null,"encryption":null,"auth_mode":null,"from_name":null,"from_address":null}'),
(64, 'bixie/portfolio', '{"portfolio_title":"Bildergalerie","portfolio_text":"<p>Unser Wasserrettungs Team hat steht tolle Ideen um den Sommer noch schöner zu gestalten.<\\/p>\\n<p>\\n    Unsrer Highlights sind hier noch einmal zusammengefasst\\n<\\/p>","portfolio_image":"","projects_per_page":20,"portfolio_image_align":"left","columns":1,"columns_small":2,"columns_medium":"","columns_large":"3","columns_xlarge":"3","columns_gutter":20,"filter_tags":true,"teaser":{"show_title":true,"show_subtitle":true,"show_intro":true,"show_image":true,"show_client":true,"show_tags":true,"show_date":true,"show_data":true,"show_readmore":true,"show_thumbs":true,"template":"panel","panel_style":"uk-panel-box","overlay":"uk-overlay uk-overlay-hover","overlay_position":"","overlay_effect":"uk-overlay-fade","overlay_image_effect":"uk-overlay-scale","content_align":"left","tags_align":"uk-flex-center","title_size":"uk-h3","title_color":"","read_more":"Read more","read_more_style":"uk-button uk-button-primary","readmore_align":"uk-text-center","thumbsize":{"width":"600","height":""},"columns":1,"columns_small":2,"columns_medium":"","columns_large":"3","columns_xlarge":"3","columns_gutter":20},"project":{"image_align":"left","metadata_position":"content-top","tags_align":"uk-flex-center","tags_position":"sidebar","show_navigation":"bottom","thumbsize":{"width":"600","height":""},"overlay_title_size":"uk-h3","overlay":"uk-overlay uk-overlay-hover","overlay_position":"","overlay_effect":"uk-overlay-fade","overlay_image_effect":"uk-overlay-scale","columns":1,"columns_small":2,"columns_medium":"","columns_large":4,"columns_xlarge":"6","columns_gutter":20},"cache_path":"\\/tmp\\/cache\\/portfolio","date_format":"F Y","markdown":true,"datafields":[]}'),
(70, 'calendar', '{"allowTermine":true}');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_system_node`
--

DROP TABLE IF EXISTS `pk_system_node`;
CREATE TABLE `pk_system_node` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  `status` smallint(6) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(1023) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `menu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)',
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `pk_system_node`
--

INSERT INTO `pk_system_node` (`id`, `parent_id`, `priority`, `status`, `title`, `slug`, `path`, `link`, `type`, `menu`, `roles`, `data`) VALUES
(1, 0, 0, 1, 'Home', 'home', '/home', '@page/1', 'page', 'main', NULL, '{"defaults":{"id":1},"meta":{"og:title":""}}'),
(2, 0, 5, 1, 'Blog', 'blog', '/blog', '@blog', 'blog', 'main', NULL, '[]'),
(3, 0, 3, 1, 'Hello', 'hello', '/hello', '@hello', 'hello', '', NULL, NULL),
(4, 0, 4, 1, 'Portfolio', 'portfolio', '/portfolio', '@portfolio', 'portfolio', '', NULL, NULL),
(5, 0, 3, 1, 'Gallery', 'gallery', '/gallery', '/portfolio', 'link', 'main', NULL, '[]'),
(6, 0, 6, 0, 'test', 'test', '/test', '@page/2', 'page', 'trash', NULL, '{"defaults":{"id":2}}'),
(7, 0, 7, 1, 'Termine', 'termine', '/termine', '@termine', 'termine', '', '5,4,3,2', '{"meta":{"og:title":""}}'),
(8, 0, 2, 1, 'Das Team', 'das-team', '/das-team', '@page/3', 'page', 'main', NULL, '{"meta":{"og:title":""},"defaults":{"id":3}}'),
(9, 0, 1, 0, 'Die 10', 'die-10', '/die-10', '@page/4', 'page', 'main', NULL, '{"meta":{"og:title":""},"defaults":{"id":4}}'),
(10, 0, 8, 1, 'calendar', 'calendar', '/calendar', '@calendar', 'calendar', '', NULL, NULL),
(11, 0, 9, 1, 'Die 10', 'die-2', '/die-2', '@page/4', 'link', 'offc', '2,3,4,5', '{"meta":{"og:title":""}}'),
(12, 0, 4, 1, 'Kontakt', 'contact', '/contact', '@page/5', 'page', 'main', NULL, '{"meta":{"og:title":""},"defaults":{"id":5}}'),
(13, 0, 10, 1, 'Ausbildung', 'ausbildung', '/ausbildung', '@page/6', 'page', 'main', NULL, '{"meta":{"og:title":""},"defaults":{"id":6}}');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_system_page`
--

DROP TABLE IF EXISTS `pk_system_page`;
CREATE TABLE `pk_system_page` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `pk_system_page`
--

INSERT INTO `pk_system_page` (`id`, `title`, `content`, `data`) VALUES
(1, 'Home', '<div class="uk-width-medium-3-4 uk-container-center">\n    \n<h3 class="uk-h1 uk-margin-large-bottom">Uniting fresh design and clean code<br class="uk-hidden-small"> to create beautiful websites.</h3>\n\n<p class="uk-width-medium-4-6 uk-container-center">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\n\n</div>', '{"title":true}'),
(2, 'test', '', '{"title":true}'),
(3, 'Das Team', '<div class="content">\n    <div class="section">\n    	<div class="image-text-module ">\n            <div class="image-container ">\n                <div class="image ">\n                    <img src="storage/Markus.jpg" alt="Home hero">\n                </div>\n            </div>\n           <div class="text-container">\n               <div class="text">\n                   <h3>Markus</h3>\n                   <p>\n                     aösdlkfasmnfalöwuieföaw aöskdjf öaoksjdf öaohwe föaosdijföaksd fölka dfo  asdöflaöls dfjö oasdifj asdkfjöa sdföo\n                   </p>\n                   <p>\n                       <b>Tel.:</b> 03969669945 <br />\n                       <b>Email.:</b> markus.bräu@gmx.at\n                   </p>\n               </div>\n            </div>\n        </div>    \n        <div class="image-text-module rev">\n            <div class="image-container ">\n                <div class="image ">\n                    <img src="storage/Markus.jpg" alt="Home hero">\n                </div>\n            </div>\n           <div class="text-container">\n               <div class="text">\n                   <h3>Markus</h3>\n                   <p>\n                     aösdlkfasmnfalöwuieföaw aöskdjf öaoksjdf öaohwe föaosdijföaksd fölka dfo  asdöflaöls dfjö oasdifj asdkfjöa sdföo\n                   </p>\n                   <p>\n                       <b>Tel.:</b> 03969669945 <br />\n                       <b>Email.:</b> markus.bräu@gmx.at\n                   </p>\n               </div>\n            </div>\n        </div> \n    </div>\n    \n</div>', '{"title":true}'),
(4, 'Die 10', '1. GESUNDHEIT:\nWenn du schwimmen gehst, musst du gesund sein!\n\n2. HINWEISSCHILDER BEACHTEN:\nAuf den Hin-weisschildern kannst du lesen, was im Schwimmbad erlaubt und was verboten ist. Daran musst du dich halten!\n\n3. DUSCHEN, ABKÜHLEN:\nGeh erst dann ins Wasser, wenn du dich geduscht und abgekühlt hast!\n\n4. KÄLTEGEFÜHL:\nBleib nicht im Wasser, wenn dir kalt ist, du kannst sonst Krämpfe bekommen! Krämpfe sind für den Schwimmer gefährlich!\n\n5. OHRENERKRANKUNGEN:\nWenn du Ohrenschmerzen oder eine Ohrenverletzung hast, darfst du nicht schwimmen, springen oder tauchen!\n\n6. ESSEN:\nWenn du viel gegessen hast, warte eine Stunde, bevor du wieder ins Wasser gehst.\n\n7. STARKE SONNE:\nSchütz dich vor der Sonne (Sonnencreme, Kappe, T-Shirt)! Wenn dir heiß ist, darfst du nicht ins kalte Wasser springen!\n\n8. ÜBERMUT:\nLass dich von anderen nicht dazu überreden, etwas zu tun, was du nicht gut kannst (weit hinausschwimmen, ins Wasser springen oder tauchen).\n\n9. SPRINGEN:\nSpring nur dort ins Wasser, wo es erlaubt ist! Du darfst dabei niemanden in Gefahr bringen! Spring ja nicht in Gewässer, die du nicht kennst, es könnten viele Gefahren lauern!\n\n10. VORSICHT IM ERLEBNISBAD:\nIm Erlebnisbad sind oft viele Menschen. Beobachte daher auch die Leute in deiner Umgebung! Ruf Hilfe herbei, wenn jemand in Gefahr ist!', '{"title":true,"markdown":true}'),
(5, 'Kontakt', '', '{"title":true}'),
(6, 'Ausbildung', '<div class="content">\n    <div class="section">\n        <div class="icon-gallery">\n            <div class="icon-container">\n                <div class="icon-item" data-id="1" data-title="Früh Schwimmer">\n                    <img src="storage/Ausbildung/frueh_gross_100.jpg" alt="Frueh gross 100" width="130px">\n                </div>\n                <div class="icon-item" data-id="2" data-title="Frei Schwimmer">\n                    <img src="storage/Ausbildung/frei_gross_100.jpg" alt="OWR Kreuz 200" width="130px">\n                </div>\n                <div class="icon-item" data-id="3" data-title="Fährten Schwimmer">\n                    <img src="storage/Ausbildung/fahrten_gross_100.jpg" alt="OWR Kreuz 200" width="130px">\n                </div>\n                <div class="icon-item" data-id="4" data-title="Allround Schwimmer">\n                    <img src="storage/Ausbildung/allround_gross_100.jpg" alt="OWR Kreuz 200" width="130px">\n                </div>\n                <div class="icon-item" data-id="5" data-title="Schwimmlehrer">\n                    <img src="storage/Ausbildung/lehrer_gross_100.jpg" alt="OWR Kreuz 200" width="130px">\n                </div>\n                <div class="icon-item" data-id="6" data-title="Rettungsschwimmlehrer">\n                    <img src="storage/Ausbildung/rs_lehrer_gross_100.jpg" alt="OWR Kreuz 200" width="130px">\n                </div>\n                <div class="icon-item" data-id="7" data-title="Schiffsführer">\n                    <img src="storage/Ausbildung/schiffsfuehrer2.jpg" alt="OWR Kreuz 200" width="130px">\n                </div>\n                <div class="icon-item" data-id="8" data-title="Juniorretter">\n                    <img src="storage/Ausbildung/juniorretter_100.jpg" alt="OWR Kreuz 200" width="130px">\n                </div>\n                <div class="icon-item" data-id="9" data-title="Helfer">\n                    <img src="storage/Ausbildung/helfer_gross_100.jpg" alt="OWR Kreuz 200" width="130px">\n                </div>\n                <div class="icon-item" data-id="10" data-title="Rettung">\n                    <img src="storage/Ausbildung/retter_gross_100.jpg" alt="OWR Kreuz 200" width="130px">\n                </div>\n                <div class="icon-item" data-id="11" data-title="Lifesaver">\n                    <img src="storage/Ausbildung/saver_100.jpg" alt="OWR Kreuz 200" width="130px">\n                </div>\n                <div class="icon-item" data-id="12" data-title="Fließ- /Wildwasser Retter">\n                    <img src="storage/Ausbildung/Fliesswasser_retter.jpg" alt="OWR Kreuz 200" width="130px">\n                </div>\n                <div class="icon-item" data-id="12"  data-ignore="true">\n                    <img src="storage/Ausbildung/ww_retter.jpg" alt="OWR Kreuz 200" width="130px">\n                </div>\n                <div class="icon-item" data-id="13" data-title="Taucher">\n                    <img src="storage/Ausbildung/Taucher_gold.jpg" alt="OWR Kreuz 200" width="130px">\n                </div>\n            </div>\n            <div class="title-container">\n            </div>\n            <div class="text-container">\n                <div class="scroll-box text">\n                    <div class="text-item" data-id="1">\n                        <p>\n                            <b>keine Altersbegrenzung</b>\n                        </p>\n                        <ul>\n                            <li>25 m Schwimmen in beliebiger Schwimmart</li>\n                            <li>Kenntnis von 5 Baderegeln</li>\n                            <li>Sprung vom Beckenrand ins Wasser</li>\n                        </ul>\n                    </div>\n                     <div class="text-item" data-id="2">\n                         <p>\n                             <b>ab vollendetem 7. Lebensjahr</b>\n                         </p>\n                         <ul>\n                             <li>15 min. Dauerschwimmen in beliebigem Stil</li>\n                             <li>Sprung aus ca. 1 m Höhe ins Wasser</li>\n                             <li>Kenntnis der 10 Baderegeln</li>\n                         </ul>\n                    </div>\n                    <div class="text-item" data-id="3">\n                         <p>\n                             <b>ab vollendetem 9. Lebensjahr</b>\n                         </p>\n                         <ul>\n                             <li>15 min. Dauerschwimmen in beliebigem Stil</li>\n                             <li>10m Streckentauchen</li>\n                             <li>Einmaliges Tieftauchen (ca. 2m) und Heraufholen eines ca. 2,5 kg schweren Gegenstandes;</li>\n                             <li>50 m Rückenschwimmen ohne Armtätigkeit</li>\n                             <li>Kopfsprung aus ca. 1 m Höhe oder beliebiger Sprung aus 3 m Höhe ins Wasser</li>\n                             <li>Kenntnis der 10 Baderegeln</li>\n                         </ul>\n\n                    </div>\n                     <div class="text-item" data-id="4">\n                         <p>\n                             <b>ab vollendetem 11. Lebensjahr</b>\n                         </p>\n                         <ul>\n                             <li>200 m in zwei Lagen (100 m Brust, 100 m Rücken)</li>\n                             <li>100 m Schwimmen in beliebigem Stil in 2:30 Minuten</li>\n                             <li>10m Streckentauchen</li>\n                             <li>Einmaliges Tieftauchen (ca. 2m) und Heraufholen eines ca. 2,5kg schweren Gegenstandes</li>\n                             <li>25m Transportieren (Ziehen) einer gleich schweren Person</li>\n                             <li>Kenntnis der Selbstrettung</li>\n                             <li>Kenntnis der 10 Baderegeln</li>\n                         </ul>\n                    </div>\n                    <div class="text-item" data-id="5">\n                         <p>\n                             <b>für Bewerberinnen und Bewerber ab dem vollendeten 18. Lebensjahr</b><br />\n                             <b>Zusätzliche Voraussetzungen</b>\n                         </p>\n                        \n                         <ul>\n                             <li>Bewerberinnen und Bewerber müssen im Besitz des Retterscheines sein;</li>\n                             <li>abgeschlossener Erste Hilfe-Kurs (mindestens acht Doppelstunden), der jedoch nicht älter als 5 Jahre sein darf;</li>\n                             <li>Bewerberinnen und Bewerber für den Schwimmlehrer müssen die persönliche und fachliche Eignung zur Erteilung der Aufgaben, die mit der vorgesehenen Verwendung verbunden sind, besitzen. Insbesondere dürfen keine einschlägigen Vorstrafen vorliegen.</li>\n                             <li>Mitarbeit im Rahmen von Schwimmkursen</li>\n                         </ul>\n                        <p>\n                            <b>Ausbildungsinhalte und Prüfungsbedingungen</b>\n                        </p>\n                        <ul>\n                            <li>Kenntnis vom Aufbau, Wesen und Wirken der Organisation;</li>\n                            <li>Kenntnis der Selbstrettung;</li>\n                            <li>Schwimmen in drei Stilarten (Brust, Kraul, Rücken);</li>\n                            <li>Praktische Arbeit mit mindestens drei Rettungsgeräten (z.B. ABC-Ausrüstung, Gurtretter, Rettungsboje, Rettungsmatratze, Wurfsack, Rettungsbrett);</li>\n                            <li>25 m Streckentauchen;</li>\n                            <li>Beherrschung des neuzeitlichen Anfängerschwimmunterrichtes in Theorie und Praxis.</li>\n                        </ul>\n                        <p>\n                            <b>Besondere Durchführungsbestimmungen</b>\n                        </p>\n                        <ul>\n                            <li>Gute Allgemeinbildung und Unterrichtsgeschick.</li>\n                            <li>Die Prüfung ist vor einer Prüfungskommission, die durch die durchführende Organisation (gemäß Punkt A.3) zusammen zu setzen ist, abzulegen.</li>\n                            <li>Die Ausbildung erfolgt im Rahmen eines Seminars im Ausmaß von mindestens 16 Stunden, wobei Teile aus äquivalenten Ausbildungen angerechnet werden können.</li>\n                            <li>Die Ausbildungs- und Prüfberechtigung (Durchführung von Schwimmkursen und Anfängerschwimmkursen, Abnahme der Prüfungen für die österreichischen Schwimmabzeichen) wird im Zuge der Ausstellung des Scheines auf die Dauer von maximal fünf Jahren erteilt.</li>\n                            <li>Die Verlängerung der Prüfberechtigung erfolgt im Rahmen von Fortbildungen durch die ausstellende Organisation jeweils wieder auf die Dauer von maximal fünf Jahren.</li>\n                        </ul>\n\n\n                    </div>\n                     <div class="text-item" data-id="6">\n                         <p>\n                             <b>für Bewerberinnen und Bewerber ab dem vollendeten 19. Lebensjahr</b><br />\n                             <b>Zusätzliche Voraussetzungen</b>\n                         </p>\n                        \n                         <ul>\n                             <li>Bewerberinnen und Bewerber müssen im Besitz des Retterscheines sein</li>\n                             <li>abgeschlossener Erste Hilfe-Kurs (mindestens acht Doppelstunden), der jedoch nicht älter als 5 Jahre sein darf, bzw. entsprechende Fortbildung im Rahmen des Kurses</li>\n                             <li>Bewerberinnen und Bewerber für den Rettungsschwimmlehrer müssen die persönliche und fachliche Eignung zur Erteilung der Aufgaben, die mit der vorgesehenen Verwendung verbunden sind, besitzen. Insbesondere dürfen keine einschlägigen Vorstrafen vorliegen.</li>\n                             <li>Bewerberinnen und Bewerber für den Rettungsschwimmlehrer müssen der Leitung der zuständigen Organisation bzw. Zentralstelle durch längere erfolgreiche Tätigkeit auf dem Gebiet der Wasserrettung bekannt sein. Aus der bisherigen Arbeit muss zu erkennen sein, dass die Bewerberin bzw. der Bewerber Theorie und Praxis des Rettens, der Wiederbelebung, der Ersten Hilfe und des Anfängerschwimmunterrichtes beherrscht und über die notwendige Organisationsfähigkeit zur Durchführung von Veranstaltungen und Rettungsschwimmkursen sowie zur Errichtung eines Wasserrettungsdienstes verfügt</li>\n                         </ul>\n                        <p>\n                            <b>Ausbildungsinhalte und Prüfungsbedingungen</b>\n                        </p>\n                        <ul>\n                            <li>Theoretische und praktische Wiederholung der Prüfungsbedingungen des Retters</li>\n                            <li>Rettungsgeräte in Theorie und Praxis</li>\n                            <li>Erste Hilfe in Theorie und Praxis mit Schwerpunkt auf Erste Hilfe-Maßnahmen bei Wasserunfällen</li>\n                            <li>Grundlagen der Methodik des Anfängerschwimmunterrichts in Theorie und Praxis</li>\n                            <li>Schwimmstile: Brust-, Kraul- und Rückenschwimmen in Theorie und Praxis</li>\n                            <li>Lehrauftritt</li>\n                            <li>Zweck und Organisation des österreichischen Wasserrettungswesens sowie der ausbildenden Organisation</li>\n                            <li>Bestimmungen für die österreichischen Schwimmabzeichen und Rettungsschwimmabzeichen</li>\n                            <li>rechtliche Bestimmungen bezüglich der Erteilung von Schwimmunterricht</li>\n                            <li>Gefahren des Wassers, Baderegeln, Gebote für den Rettungsschwimmer</li>\n                            <li>Maßnahmen zur Vermeidung von Badeunfällen</li>\n                        </ul>\n                          <p>\n                            <b>Erweiterte Ausbildungsinhalte und Prüfungsbedingungen</b>\n                        </p>\n                        <ul>\n                            <li>Theoretische und praktische Kenntnisse des ABC-Schwimmens</li>\n                            <li>Basisinformation des Gerätetauchens in Theorie und Praxis</li>\n                            <li>Meisterschaften im Schwimmen und Rettungsschwimmen</li>\n                            <li>Gefahren des Fließgewässers und Wildwassers</li>\n                            <li>Vorträge zu sportlichen Inhalten</li>\n                            <li>Einsatz und Überwachungsdienst</li>\n                        </ul>\n                        <p>\n                            <b>Besondere Durchführungsbestimmungen</b>\n                        </p>\n                        <ul>\n                            <li>Die Ausbildung erfolgt im Rahmen eines Kurses im Ausmaß von mindestens 40 Stunden. Im Rahmen eines solchen Kurses ist die Lehrbefähigung in Theorie und Praxis des Rettungsschwimmens nachzuweisen</li>\n                            <li>Die Ausbildungs- und Prüfungsbedingungen unter Punkt B sind jedenfalls zu unterrichten beziehungsweise zu prüfen. Zusätzlich muss mindestens ein Thema aus den Erweiterungsbereichen gemäß Punkt C gewählt werden\nDie Prüfung ist vor einer Prüfungskommission, die durch die durchführende Organisation (gemäß Punkt A.3) zusammen zu setzen ist, abzulegen.</li>\n                            <li>Die Ausbildungs- und Prüfberechtigung (Durchführung von Schwimmkursen, Anfänger- und Rettungsschwimmkursen, Abnahme der Prüfungen für die österreichischen Schwimmer- und Rettungschwimmerabzeichen) wird im Zuge der Ausstellung des Lehrscheines auf die Dauer von maximal fünf Jahren erteilt</li>\n                            <li>Die Verlängerung Ausbildungs- und Prüfungsberechtigung erfolgt im Rahmen von Fortbildungskursen für Lehrscheininhaber durch die ausstellende Organisation jeweils wieder auf die Dauer von maximal fünf Jahren</li>\n                         </ul>\n\n                    </div>\n                     <div class="text-item" data-id="7">\n                         <p>Da die Bedingungen zum Erwerb des Schifferpatents vom Gesetzgeber aus regional unterschiedlich sind, können nur die Landesnautiker des jeweiligen ÖWR-Landesverbandes detaillierte Auskünfte darüber geben.</p>\n                    </div>\n                    <div class="text-item" data-id="8">\n                         <p><b>keine Altersbegrenzung</b><br/>\n                             <ul>\n                                 <li><b>100 m Schwimmen ohne Unterbrechung</b>, davon:\n                                     <ol>\n                                     <li>25 m Kraulschwimmen</li>\n                                     <li>25 m Rückenkraulschwimmen</li>\n                                     <li>25 m Brustschwimmen</li>\n                                     <li>25 m Rückenschwimmen ohne Armtätigkeit(mit Schwunggrätsche)</li>\n                                     </ol>\n                                 </li>\n                                 <li><b>25 m Retten</b> eines Partners mit Achsel- oder Kopfgriff</li>\n                                 <li><b>Selbstrettungsübung:</b><br /> kombinierte Übung in leichter Freizeitbekleidung, die ohne Pause in der angegebenen Reihenfolge zu absolvieren ist:\n                                 <ol>\n                                     <li>Fußwärts in Wasser springen, danach Schwebelage einnehmen</li>\n                                     <li>4 Minuten Schweben an der Wasseroberfläche in Rückenlage mit leichten Paddelbewegungen</li>\n                                     <li>6 Minuten schwimmen, dabei mindestens viermal dieSchwimmlage wechseln (Bauch-, Rücken-, Seitenlage)</li>\n                                     <li>Danach die Kleidungsstücke (T-Shirt, Hemd, lange Hose) im tiefen Wasser ausziehen</li>\n                                     </ol>\n                                 </li>\n                                 <li><b>Fremdrettungsübung:</b><br /> Kombinierte Übung, die ohne Pause in der angegebenen Reihenfolge zu absolvieren ist:\n                                 <ol>\n                                     <li>15 m zu einem Partner in Bauchlage anschwimmen, nach halber Strecke auf ca. 2 m Tiefe abtauchen und zwei kleine Tauchringe heraufholen; diese anschließend fallen lassen und das Anschwimmen fortsetzen </li>\n                                     <li>Rückweg: 15 m Retten des Partners mitAchsel- oder Kopfgriff</li>\n                                     </ol>\n                                 </li>\n                                 <li><b>Fremdrettungsübung mit einem planmäßigen Rettungsgerät:</b><br/>\n                                 kombinierte Übung, die ohne Pause in der angegebenen Reihenfolge zu absolvieren ist:\n                                 <ol>\n                                     <li>Rettungssprung ins Wasser mit einem Rettungsgerät</li>\n                                     <li>15 m zu einem Partner anschwimmen</li>\n                                     <li>Dem Partner das Rettungsgerät hinreichen</li>\n                                     <li>Rückweg: Durch Zug am Rettungsgerät den Partner zum Ufer zurückziehen</li>\n                                     </ol>\n                                 </li>\n                                 <li><b>Theoretische Prüfung:</b>\n                                 <ol>\n                                     <li>Maßnahmen der Selbstrettung</li>\n                                     <li>Grundverhalten für die Fremdrettung</li>\n                                     <li>Elementare Erste-Hilfe</li>\n                                     </ol>\n                                 </li>\n                        </ul>\n                    </div>\n                    <div class="text-item" data-id="9">\n                         <p><b>ab vollendetem 13. Lebensjahr</b></p>\n                        <ul>\n                            <li>15 min Dauerschwimmen, davon 5 min in Rückenlage ohne Armtätigkeit</li>\n                            <li>100 m Schwimmen in Überkleidern</li>\n                            <li>15 m Streckentauchen</li>\n                            <li>Zweimaliges Tieftauchen (ca. 2-3m) jeweils mit Heraufholen eines ca. 2,5 kg schweren Gegenstandes innerhalb von 5 Minuten</li>\n                            <li>Heraufholen von 3 Tellern oder 3 Ringen bei einem Tauchversuch (Fläche ca. 10m2, bei einer Wassertiefe von ca. 2 bis 3 m)</li>\n                            <li>Paketsprung aus 2-3 m Höhe</li>\n                            <li>je 25 m Retten einer etwa gleich schweren Person mit Kopf-, Achsel- und Fesselgriff</li>\n                            <li>50m Transportieren (Ziehen) einer gleich schweren Person</li>\n                            <li>praktische Ausübung der Befreiungsgriffe: Halsumklammerung von vorne und hinten, Würgegriff von vorne und hinten, jeweils an Land und im Wasser</li>\n                            <li>praktische Ausübung der Bergegriffe: Bergen über den Beckenrand und Rautekgriff</li>\n                            <li>Kenntnis der Rettungsgeräte</li>\n                            <li>Kenntnis der Selbstrettung</li>\n                            <li>Kurze Prüfung über Erste Hilfe-Leistung bei Wasserunfällen und paktische Ausführung der Wiederbelebung</li>\n                            <li>Kenntnis über Zweck und Organisation des Österreichischen Wasserrettungswesen</li>\n                            \n                        </ul>\n                    </div>\n                    <div class="text-item" data-id="10">\n                         <p><b>ab vollendetem 16. Lebensjahr<br />\n							und Besitz des Helferscheins</b></p>\n                        <ul>\n                            <li>30 min Dauerschwimmen, davon 10 min in Rückenlage ohne Armtätigkeit</li>\n                            <li>300 m Schwimmen in Überkleidern</li>\n                            <li>25 m Streckentauchen</li>\n                            <li>Dreimaliges Teiftauchen (ca. 3 bis 4m) jeweils mit Heraufholen eines ca. 5kg schweren Gegenstandes innerhalb von 6 Minuten</li>\n                            <li>Heraufholen von 6 Tellern oder Ringen bei einem Tauchversuch (Fläche ca. 20m2 bei einer Wassertiefe von ca. 2m)</li>\n                            <li>Paket- und Kopfsprung aus 3 m Höhe</li>\n                            <li>je 50 m Retten einer etwa gleich schweren Person, beide bekleidet, mit Kopf-, Achsel-, Fessel- und Seemannsgriff</li>\n                            <li>50m Transportieren (Ziehen) einer gleich schweren Person</li>\n                            <li>praktische Ausübung der Befreiungsgriffe: Halsumklammerung von vorne und hinten, Würgegriff von vorne und hinten, Brustumklammerung von hinten ohne Einschluss der Arme jeweils an Land und im Wasser</li>\n                            <li>praktische Anwendung von mindestens 3 Bergegriffen (z.b.Bergen über die Leiter, Rautekgriff, Bergen über den Beckenrand, Schultertragegriff, Bergen in ein Boot)</li>\n                            <li>kurze Prüfung über Erste Hilfe-Leistung bei Wasserunfällen und praktische Ausführung der Wiederbelebung</li>\n                            <li>Kenntnis der Selbstrettung</li>\n                            <li>Besondere Rettungshilfen bei Bade-, Boots-, Auto- und Eisunfällen</li>\n                            <li>Anwendung von mindestens zwei Rettungsgeräten</li>\n                            <li>Kombinierte Rettungsübung</li>\n                        </ul>\n                    </div>\n                     <div class="text-item" data-id="11">\n                         <p><b>ab vollendetem 17. Lebensjahr<br />\n							und Besitz des Retterscheins</b></p>\n                         <p>\n                             <b>Schwimmen</b>\n                         </p>\n 							<ul>\n                                 <li>100 m Schwimmen (Brust oder Kraul) in 1:40 Minuten</li>\n                                 <li>300 m Schwimmen mit Flossen in 4:30 Minuten;</li>\n                                 <li>300 m Schwimmen in beliebigem Stil (ohne Flossen) in 9:00 min</li>\n                         </ul>\n                         <p>\n                             <b>Rettungstechnik</b><br />\n                             Ausführung von Rettungstechniken in folgender Abfolge:\n                         </p>\n                          <ol>\n                                 <li>75 m Anschwimmen eines „Opfers“;</li>\n                                 <li>Ausführung von drei Befreiungsgriffen;</li>\n                                 <li>je 25 m Retten mittels Kopf-, Achsel- und Fesselgriff.</li>\n                         </ol>\n                         <p>\n                             <b>Kombinierte Rettungsübung</b><br />\n                             Ausführung der kombinierten Rettungsübung innerhalb von 2 Minuten, der Retter trägt dabei Shorts und T-Shirt:\n                         </p>\n                          <ol>\n                                 <li>Rettungssprung (Schrittsprung) ins Wasser;</li>\n                                 <li>25 m Anschwimmen (Freestyle);</li>\n                                 <li>Abtauchen und Heraufholen eines „Opfers“ (Rettungspuppe oder Partner) aus mindestens 1,5 m Tiefe;</li>\n                              <li>25 m Retten des „Opfers“.</li>\n                              <li>Notfallcheck und Reanimation (mindestens 3 Minuten) unmittelbar nach der Rettungsübung!</li>\n                         </ol>\n						<p>\n                             <b>Streckentauchen</b>\n                         </p>\n                          <ul>\n                                 <li>25 m Streckentauchen.</li>\n                                 \n                         </ul>\n                         <p>Anwendung und Erklärung von mindestens zwei Rettungsgeräten (z.B. Rettungsbrett, Wurfsack, Rettungsmatratze, Gurtretter, Rettungsboje oder anderen von der ARGE-ÖWRW anerkannten Rettungsgeräten):</p>\n                             <ul>\n                                 <li>Erklärung der Geräte praktische Anwendung der Geräte.</li>\n                                 \n                         </ul>\n                         <p>\n                             <b>Durchführung der folgenden Basismaßnahmen</b>\n                         </p>\n                          <ul>\n                                 <li>Gefahren erkennen;</li>\n                                 <li>Gefahrenstelle absichern, retten, bergen</li>\n                                 <li>Notfallcheck</li>\n                              <li>stabile Seitenlage</li>\n                              <li>Umdrehen einer Person aus der Bauchlage in die Rückenlage</li>\n                              <li>Notruf</li>\n                         </ul>\n                         <p>\n                             <b>Durchführung der Herz-Lungen-Wiederbelebung</b>\n                         </p>\n                          <ul>\n                                 <li>Herz-Lungen-Wiederbelebung (Erwachsene)</li>\n                                 <li>Herz-Lungen-Wiederbelebung (Kinder)</li>\n                                 <li>Herz-Lungen-Wiederbelebung (Säuglinge)</li>\n                         </ul>\n<p>\n                             <b>Erste Hilfe-Maßnahmen:</b>\n                         </p>\n                          <ul>\n                                 <li>Erste Hilfe-Maßnahmen (z.B. bei Schock, Blutungen, Verletzungen der Halswirbelsäule, Brüchen, Unterkühlung).</li>\n                         </ul>\n                         <p>\n                            <b>Besondere Durchführungsbestimmungen:</b><br />\n                         Bei der Ausführung der Rettungstechnik (Punkt B) und der kombinierten Rettungsübung (Punkt C) muss der Retter beim Anschwimmen des „Opfers“ den Kopf so weit über Wasser halten, dass ein laufender Blickkontakt zum „Opfer“ gewährleistet ist.<br />Im Zuge der kombinierten Rettungsübung (Punkt C) ist eine Erwachsenen-Reanimation durchzuführen. Bei der Anwendung von Rettungsgriffen ist jeweils eine ca. gleich schwerere Person zu retten.<br />Im Rahmen der Rettungstechnik (Punkt B) sind insgesamt 75 m zu retten, wobei alle 25 m ein Griffwechsel zu erfolgen hat. Die Befreiungsgriffe sind vom Lehrer selbst zu prüfen.\n                </p>\n                    </div>\n                    <div class="text-item" data-id="12">\n                         <p>\n                             <b>Vorbereitungslehrgänge:</b> <br />\n                             Ausrüstung kennenlernen und deren Handhabung, Wurfsack, Sicherung, gefahrloses Schwimmen im einfachen Fließgewässer\n                        </p>\n                        <p>\n                            <b>Grundausbildungslehrgänge:</b>\n                        </p>\n                        <ul>\n                            <li><b>Fließwasserretter (FW-R)</b><br />\n                            Gewässerkunde, Materialkunde, Grundtechniken des Bewegens am und im Fließgewässer, Knotenkunde und Panikverschluss, Zeichen und Signale, Sicherungs-, Rettungs- und Bergetechniken sowie Erster Hilfe\n                            </li>\n                            <li><b>Wildwasserretter (WW-R)</b> <br />\n                            erweiterte Gewässerkunde (auch Hochwasser), erweiterte Materialkunde, Einsatzorganisation und taktische Führung, erweiterte Sicherungs-, Rettungs- und Bergetechniken sowie Erster Hilfe, Zusatztechniken wie Rafting und Canyoning\n                            </li>\n                        </ul>\n                        <p>\n                            <b>Allfällige Fortbildungs- und Spezialisierungslehrgänge</b><br />\n                            Jährlich werden in Fortbildungsveranstaltungen grundlegende Techniken wiederholt aber auch Vertiefungen und Spezialisierungen angeboten.\n                        </p>\n                        <ul>\n                            <li>Abseilen in extremen Gelände</li>\n                            <li>Raftschulungen</li>\n                            <li>Seiltechniken</li>\n                            <li>usw.</li>\n                        </ul>\n                        <p>\n                            Durch ständiges Training und vor allem durch gemeinsame Übungen mit anderen Landesverbänden und Blaulichtorganisationen sind wir bestrebt den Ausbildungsstand unserer Wildwasser-Retter hoch zu halten.\n                        </p>\n                    </div>\n                </div>\n            </div>\n        </div>\n    </div>\n</div>', '{"title":true}');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_system_role`
--

DROP TABLE IF EXISTS `pk_system_role`;
CREATE TABLE `pk_system_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `permissions` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `pk_system_role`
--

INSERT INTO `pk_system_role` (`id`, `name`, `priority`, `permissions`) VALUES
(1, 'Anonymous', 0, NULL),
(2, 'Authenticated', 1, 'blog: post comments,calendar: api access'),
(3, 'Administrator', 2, NULL),
(4, 'Head Quarter', 3, 'system: manage storage read only,blog: manage own posts,blog: manage all posts,blog: manage comments,blog: comment approval required once,portfolio: manage portfolio,system: access admin area,termine: editor,calendar: foreign event edit,calendar: new event'),
(5, 'Member', 4, 'blog: manage own posts,system: access admin area');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_system_session`
--

DROP TABLE IF EXISTS `pk_system_session`;
CREATE TABLE `pk_system_session` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `time` datetime NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `pk_system_session`
--

INSERT INTO `pk_system_session` (`id`, `time`, `data`) VALUES
('0ah4hobe2ffs6lumsmlelvvn21', '2017-04-10 12:25:54', 'X3NmMl9hdHRyaWJ1dGVzfGE6Mjp7czo1OiJfY3NyZiI7czo0MDoiNTI0YzM4ZTZiMjgwMGM3OWE4ZWI0NjFjN2RkODVlYWNkM2YwYzIzNyI7czoxMzoic3lzdGVtLnVwZGF0ZSI7czo0NDoiQzpceGFtcHBcaHRkb2NzXHBhZ2VraXRcdG1wXHRlbXBcdXBkMjQ2RC50bXAiO31fc2YyX2ZsYXNoZXN8YTowOnt9X3BrX21lc3NhZ2VzfGE6Mjp7czo3OiJkaXNwbGF5IjthOjA6e31zOjM6Im5ldyI7YTowOnt9fV9zZjJfbWV0YXxhOjM6e3M6MToidSI7aToxNDkxODI3MTU0O3M6MToiYyI7aToxNDg0OTAxODY2O3M6MToibCI7czoxOiIwIjt9'),
('0eh0d1t3jlpqmk4r1fa0prjo64', '2017-02-21 20:01:34', 'X3NmMl9hdHRyaWJ1dGVzfGE6MTp7czo1OiJfY3NyZiI7czo0MDoiMmRjZDRhZDVmYmZhZjBlNDcyNDRjOTlhYTdhZjNiNDVhOTU1NjI3MCI7fV9zZjJfZmxhc2hlc3xhOjA6e31fcGtfbWVzc2FnZXN8YToyOntzOjc6ImRpc3BsYXkiO2E6MDp7fXM6MzoibmV3IjthOjA6e319X3NmMl9tZXRhfGE6Mzp7czoxOiJ1IjtpOjE0ODc3MDcyOTM7czoxOiJjIjtpOjE0ODc3MDcyNzE7czoxOiJsIjtzOjE6IjAiO30='),
('3gqcskdk6s7q5ffv0o9h5v7do4', '2016-08-11 07:03:25', 'X3NmMl9hdHRyaWJ1dGVzfGE6MTp7czo1OiJfY3NyZiI7czo0MDoiNjRlOTVhNDgzOGJlY2NkNTEwNjY2YjU2NTgyNWJlMTJlMTYwNDZkNiI7fV9zZjJfZmxhc2hlc3xhOjA6e31fcGtfbWVzc2FnZXN8YToyOntzOjc6ImRpc3BsYXkiO2E6MDp7fXM6MzoibmV3IjthOjA6e319X3NmMl9tZXRhfGE6Mzp7czoxOiJ1IjtpOjE0NzA4OTkwMDQ7czoxOiJjIjtpOjE0NjY0MDkxMDc7czoxOiJsIjtzOjE6IjAiO30='),
('4gl4a8jsb51772gku70tt3a376', '2016-08-11 08:22:48', 'X3NmMl9hdHRyaWJ1dGVzfGE6MTp7czo1OiJfY3NyZiI7czo0MDoiNjRlOTVhNDgzOGJlY2NkNTEwNjY2YjU2NTgyNWJlMTJlMTYwNDZkNiI7fV9zZjJfZmxhc2hlc3xhOjA6e31fcGtfbWVzc2FnZXN8YToyOntzOjc6ImRpc3BsYXkiO2E6MDp7fXM6MzoibmV3IjthOjA6e319X3NmMl9tZXRhfGE6Mzp7czoxOiJ1IjtpOjE0NzA5MDM3NjY7czoxOiJjIjtpOjE0NjY0MDkxMDc7czoxOiJsIjtzOjE6IjAiO30='),
('6nvohj5neb1794enntsfrjtck7', '2017-04-10 13:23:06', 'X3NmMl9hdHRyaWJ1dGVzfGE6Mjp7czo1OiJfY3NyZiI7czo0MDoiNTI0YzM4ZTZiMjgwMGM3OWE4ZWI0NjFjN2RkODVlYWNkM2YwYzIzNyI7czoxMzoic3lzdGVtLnVwZGF0ZSI7czo0NDoiQzpceGFtcHBcaHRkb2NzXHBhZ2VraXRcdG1wXHRlbXBcdXBkMjQ2RC50bXAiO31fc2YyX2ZsYXNoZXN8YTowOnt9X3BrX21lc3NhZ2VzfGE6Mjp7czo3OiJkaXNwbGF5IjthOjA6e31zOjM6Im5ldyI7YTowOnt9fV9zZjJfbWV0YXxhOjM6e3M6MToidSI7aToxNDkxODMwNTg2O3M6MToiYyI7aToxNDg0OTAxODY2O3M6MToibCI7czoxOiIwIjt9'),
('76408ickfs8ohjqnur3f3ve5o5', '2017-04-11 06:49:59', 'X3NmMl9hdHRyaWJ1dGVzfGE6MTp7czo1OiJfY3NyZiI7czo0MDoiOTk3Njg1ZWNiZGY4NGRiMWIzOTRkNTA5YTE5NTNhMjRhZjI0Njk2ZCI7fV9zZjJfZmxhc2hlc3xhOjA6e31fcGtfbWVzc2FnZXN8YToyOntzOjc6ImRpc3BsYXkiO2E6MDp7fXM6MzoibmV3IjthOjA6e319X3NmMl9tZXRhfGE6Mzp7czoxOiJ1IjtpOjE0OTE4OTMzOTk7czoxOiJjIjtpOjE0OTE4ODU3MjU7czoxOiJsIjtzOjE6IjAiO30='),
('7ki91ueb093nbbie20agf8li85', '2017-04-11 04:42:10', 'X3NmMl9hdHRyaWJ1dGVzfGE6MTp7czo1OiJfY3NyZiI7czo0MDoiOTk3Njg1ZWNiZGY4NGRiMWIzOTRkNTA5YTE5NTNhMjRhZjI0Njk2ZCI7fV9zZjJfZmxhc2hlc3xhOjA6e31fcGtfbWVzc2FnZXN8YToyOntzOjc6ImRpc3BsYXkiO2E6MDp7fXM6MzoibmV3IjthOjA6e319X3NmMl9tZXRhfGE6Mzp7czoxOiJ1IjtpOjE0OTE4ODU3MzA7czoxOiJjIjtpOjE0OTE4ODU3MjU7czoxOiJsIjtzOjE6IjAiO30='),
('87755r9dukp379nch3k1fqbqp3', '2017-04-11 08:19:35', 'X3NmMl9hdHRyaWJ1dGVzfGE6MTp7czo1OiJfY3NyZiI7czo0MDoiM2ZhNjlhYzRlMDRlMzY3OGFkNTg0MzY1ZWZhYzU4ZGY3NTM2MTA1MiI7fV9zZjJfZmxhc2hlc3xhOjA6e31fcGtfbWVzc2FnZXN8YToyOntzOjc6ImRpc3BsYXkiO2E6MDp7fXM6MzoibmV3IjthOjA6e319X3NmMl9tZXRhfGE6Mzp7czoxOiJ1IjtpOjE0OTE4OTg3NzQ7czoxOiJjIjtpOjE0OTE4OTg3MjE7czoxOiJsIjtzOjE6IjAiO30='),
('90m5lhga5ibuj835hrkq6govk4', '2017-04-11 09:11:58', 'X3NmMl9hdHRyaWJ1dGVzfGE6MTp7czo1OiJfY3NyZiI7czo0MDoiOTk3Njg1ZWNiZGY4NGRiMWIzOTRkNTA5YTE5NTNhMjRhZjI0Njk2ZCI7fV9zZjJfZmxhc2hlc3xhOjA6e31fcGtfbWVzc2FnZXN8YToyOntzOjc6ImRpc3BsYXkiO2E6MDp7fXM6MzoibmV3IjthOjA6e319X3NmMl9tZXRhfGE6Mzp7czoxOiJ1IjtpOjE0OTE5MDE5MTY7czoxOiJjIjtpOjE0OTE4ODU3MjU7czoxOiJsIjtzOjE6IjAiO30='),
('dchhmhh7cje63f89hseb17qc00', '2017-02-21 20:01:28', 'X3NmMl9hdHRyaWJ1dGVzfGE6Mjp7czo1OiJfY3NyZiI7czo0MDoiMmRjZDRhZDVmYmZhZjBlNDcyNDRjOTlhYTdhZjNiNDVhOTU1NjI3MCI7czoxOToiX2F1dGgubGFzdF91c2VybmFtZSI7czo2OiJtZW1iZXIiO31fc2YyX2ZsYXNoZXN8YTowOnt9X3BrX21lc3NhZ2VzfGE6Mjp7czo3OiJkaXNwbGF5IjthOjA6e31zOjM6Im5ldyI7YTowOnt9fV9zZjJfbWV0YXxhOjM6e3M6MToidSI7aToxNDg3NzA3Mjg3O3M6MToiYyI7aToxNDg3NzA3MjcxO3M6MToibCI7czoxOiIwIjt9'),
('dncudnl72sgvbofdb75emj0pl6', '2016-06-29 05:08:16', 'X3NmMl9hdHRyaWJ1dGVzfGE6MTp7czo1OiJfY3NyZiI7czo0MDoiNjRlOTVhNDgzOGJlY2NkNTEwNjY2YjU2NTgyNWJlMTJlMTYwNDZkNiI7fV9zZjJfZmxhc2hlc3xhOjA6e31fcGtfbWVzc2FnZXN8YToyOntzOjc6ImRpc3BsYXkiO2E6MDp7fXM6MzoibmV3IjthOjA6e319X3NmMl9tZXRhfGE6Mzp7czoxOiJ1IjtpOjE0NjcxNzY4OTQ7czoxOiJjIjtpOjE0NjY0MDkxMDc7czoxOiJsIjtzOjE6IjAiO30='),
('h6d54vrt7h28gt28tpa2nirov3', '2016-06-29 06:02:54', 'X3NmMl9hdHRyaWJ1dGVzfGE6MTp7czo1OiJfY3NyZiI7czo0MDoiNjRlOTVhNDgzOGJlY2NkNTEwNjY2YjU2NTgyNWJlMTJlMTYwNDZkNiI7fV9zZjJfZmxhc2hlc3xhOjA6e31fcGtfbWVzc2FnZXN8YToyOntzOjc6ImRpc3BsYXkiO2E6MDp7fXM6MzoibmV3IjthOjA6e319X3NmMl9tZXRhfGE6Mzp7czoxOiJ1IjtpOjE0NjcxODAxNzQ7czoxOiJjIjtpOjE0NjY0MDkxMDc7czoxOiJsIjtzOjE6IjAiO30='),
('igbqia9rda87ph433unp3sv277', '2017-02-21 20:51:10', 'X3NmMl9hdHRyaWJ1dGVzfGE6MTp7czo1OiJfY3NyZiI7czo0MDoiNTgzYjg3MTkwNmU3NjIwZjc4ZTQxODRmYjMyOGM0OWU5MjZlYTk2YSI7fV9zZjJfZmxhc2hlc3xhOjA6e31fcGtfbWVzc2FnZXN8YToyOntzOjc6ImRpc3BsYXkiO2E6MDp7fXM6MzoibmV3IjthOjA6e319X3NmMl9tZXRhfGE6Mzp7czoxOiJ1IjtpOjE0ODc3MTAyNzA7czoxOiJjIjtpOjE0ODc3MTAyMjg7czoxOiJsIjtzOjE6IjAiO30='),
('l66rt0im8dutucp3ulamofkbl7', '2017-04-11 08:43:43', 'X3NmMl9hdHRyaWJ1dGVzfGE6MTp7czo1OiJfY3NyZiI7czo0MDoiOTk3Njg1ZWNiZGY4NGRiMWIzOTRkNTA5YTE5NTNhMjRhZjI0Njk2ZCI7fV9zZjJfZmxhc2hlc3xhOjA6e31fcGtfbWVzc2FnZXN8YToyOntzOjc6ImRpc3BsYXkiO2E6MDp7fXM6MzoibmV3IjthOjA6e319X3NmMl9tZXRhfGE6Mzp7czoxOiJ1IjtpOjE0OTE5MDAyMjM7czoxOiJjIjtpOjE0OTE4ODU3MjU7czoxOiJsIjtzOjE6IjAiO30='),
('n3q919k3qbvuoftgh3ilt8i9f0', '2016-06-29 13:06:48', 'X3NmMl9hdHRyaWJ1dGVzfGE6MTp7czo1OiJfY3NyZiI7czo0MDoiNjRlOTVhNDgzOGJlY2NkNTEwNjY2YjU2NTgyNWJlMTJlMTYwNDZkNiI7fV9zZjJfZmxhc2hlc3xhOjA6e31fcGtfbWVzc2FnZXN8YToyOntzOjc6ImRpc3BsYXkiO2E6MDp7fXM6MzoibmV3IjthOjA6e319X3NmMl9tZXRhfGE6Mzp7czoxOiJ1IjtpOjE0NjcyMDU2MDg7czoxOiJjIjtpOjE0NjY0MDkxMDc7czoxOiJsIjtzOjE6IjAiO30='),
('n6mckqlqlj21jcmh8jgbkut7a1', '2016-06-28 13:31:41', 'X3NmMl9hdHRyaWJ1dGVzfGE6MTp7czo1OiJfY3NyZiI7czo0MDoiNjRlOTVhNDgzOGJlY2NkNTEwNjY2YjU2NTgyNWJlMTJlMTYwNDZkNiI7fV9zZjJfZmxhc2hlc3xhOjA6e31fcGtfbWVzc2FnZXN8YToyOntzOjc6ImRpc3BsYXkiO2E6MDp7fXM6MzoibmV3IjthOjA6e319X3NmMl9tZXRhfGE6Mzp7czoxOiJ1IjtpOjE0NjcxMjA3MDE7czoxOiJjIjtpOjE0NjY0MDkxMDc7czoxOiJsIjtzOjE6IjAiO30='),
('pv8io3ura86shjh33qa77q83s7', '2017-04-11 05:07:24', 'X3NmMl9hdHRyaWJ1dGVzfGE6MTp7czo1OiJfY3NyZiI7czo0MDoiOTk3Njg1ZWNiZGY4NGRiMWIzOTRkNTA5YTE5NTNhMjRhZjI0Njk2ZCI7fV9zZjJfZmxhc2hlc3xhOjA6e31fcGtfbWVzc2FnZXN8YToyOntzOjc6ImRpc3BsYXkiO2E6MDp7fXM6MzoibmV3IjthOjA6e319X3NmMl9tZXRhfGE6Mzp7czoxOiJ1IjtpOjE0OTE4ODcyNDQ7czoxOiJjIjtpOjE0OTE4ODU3MjU7czoxOiJsIjtzOjE6IjAiO30='),
('q93vsbal0iqoumv8cgirdnja71', '2017-01-20 08:44:29', 'X3NmMl9hdHRyaWJ1dGVzfGE6MTp7czo1OiJfY3NyZiI7czo0MDoiNTI0YzM4ZTZiMjgwMGM3OWE4ZWI0NjFjN2RkODVlYWNkM2YwYzIzNyI7fV9zZjJfZmxhc2hlc3xhOjA6e31fcGtfbWVzc2FnZXN8YToyOntzOjc6ImRpc3BsYXkiO2E6MDp7fXM6MzoibmV3IjthOjA6e319X3NmMl9tZXRhfGE6Mzp7czoxOiJ1IjtpOjE0ODQ5MDE4Njg7czoxOiJjIjtpOjE0ODQ5MDE4NjY7czoxOiJsIjtzOjE6IjAiO30='),
('s7evqn7cfogb0s3hi8tej0bp74', '2017-04-10 13:59:10', 'X3NmMl9hdHRyaWJ1dGVzfGE6Mjp7czo1OiJfY3NyZiI7czo0MDoiNTI0YzM4ZTZiMjgwMGM3OWE4ZWI0NjFjN2RkODVlYWNkM2YwYzIzNyI7czoxMzoic3lzdGVtLnVwZGF0ZSI7czo0NDoiQzpceGFtcHBcaHRkb2NzXHBhZ2VraXRcdG1wXHRlbXBcdXBkMjQ2RC50bXAiO31fc2YyX2ZsYXNoZXN8YTowOnt9X3BrX21lc3NhZ2VzfGE6Mjp7czo3OiJkaXNwbGF5IjthOjA6e31zOjM6Im5ldyI7YTowOnt9fV9zZjJfbWV0YXxhOjM6e3M6MToidSI7aToxNDkxODMyNzQ5O3M6MToiYyI7aToxNDg0OTAxODY2O3M6MToibCI7czoxOiIwIjt9'),
('ta0k4vdio8bjq8ctaghm698gb4', '2017-01-20 09:30:44', 'X3NmMl9hdHRyaWJ1dGVzfGE6Mjp7czo1OiJfY3NyZiI7czo0MDoiNTI0YzM4ZTZiMjgwMGM3OWE4ZWI0NjFjN2RkODVlYWNkM2YwYzIzNyI7czoxMzoic3lzdGVtLnVwZGF0ZSI7czo0NDoiQzpceGFtcHBcaHRkb2NzXHBhZ2VraXRcdG1wXHRlbXBcdXBkQzgwNS50bXAiO31fc2YyX2ZsYXNoZXN8YTowOnt9X3BrX21lc3NhZ2VzfGE6Mjp7czo3OiJkaXNwbGF5IjthOjA6e31zOjM6Im5ldyI7YTowOnt9fV9zZjJfbWV0YXxhOjM6e3M6MToidSI7aToxNDg0OTA0NjQzO3M6MToiYyI7aToxNDg0OTAxODY2O3M6MToibCI7czoxOiIwIjt9');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_system_user`
--

DROP TABLE IF EXISTS `pk_system_user`;
CREATE TABLE `pk_system_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` smallint(6) NOT NULL DEFAULT '0',
  `registered` datetime NOT NULL,
  `login` datetime DEFAULT NULL,
  `activation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)',
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `pk_system_user`
--

INSERT INTO `pk_system_user` (`id`, `name`, `username`, `email`, `password`, `url`, `status`, `registered`, `login`, `activation`, `roles`, `data`) VALUES
(1, 'admin', 'admin', 'thomas.sabe@gmx.at', '$2y$10$gGMFEkfX7sJTmJHI7kuDJOtv7mQE2RDop/iui8kEl1sLf2jthlg1C', '', 1, '2016-04-20 17:59:22', '2017-04-11 08:43:45', '8NWtEiAApZg3BZo3xY1/nwHGf2q.apYs', '2,3', '{"admin":{"menu":{"dashboard":0,"calendar":1,"portfolio":2,"termine":3,"site":4,"blog":5,"user":6,"system: system":7,"system: marketplace":8}}}'),
(2, 'Head', 'headquarter', 'hq@gmx.at', '$2y$10$FT91iL9FeZFgE7/4c7qXmu9xD/fcVuC8R/v6q3s7JITvotb1YfeJm', '', 1, '2016-04-24 19:16:27', '2016-06-27 10:49:15', NULL, '2,4', '[]'),
(3, 'Member', 'member', 'member@gmx.at', '$2y$10$VasJ4XfcPTQFJ8QkqCfiEumu84IUZ9myfGqyxxzgM.P59XVQFcJ6S', '', 1, '2016-06-20 11:59:14', '2017-02-21 20:01:30', NULL, '2,5', '[]');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_system_widget`
--

DROP TABLE IF EXISTS `pk_system_widget`;
CREATE TABLE `pk_system_widget` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  `nodes` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)',
  `roles` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)',
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `pk_system_widget`
--

INSERT INTO `pk_system_widget` (`id`, `title`, `type`, `status`, `nodes`, `roles`, `data`) VALUES
(1, 'Wasserrettung Längsee', 'system/text', 1, '1', NULL, '{"content":"<h1 class=\\"uk-heading-large uk-margin-large-bottom\\" style=\\"background-image: radial-gradient(rgba(0,0,0,0.5) 100%,#fff 0%);\\">\\"Jeder Nicht-Schwimmer ein Schwimmer<br class=\\"uk-hidden-small\\">Jeder Schwimmer ein Retter!\\"<\\/h1>"}'),
(2, 'Powered by Pagekit', 'system/text', 1, NULL, NULL, '{"content":"<ul class=\\"uk-grid uk-grid-medium uk-flex uk-flex-center\\">\\n    <li><a href=\\"https:\\/\\/github.com\\/pagekit\\" class=\\"uk-icon-hover uk-icon-small uk-icon-github\\"><\\/a><\\/li>\\n    <li><a href=\\"https:\\/\\/twitter.com\\/pagekit\\" class=\\"uk-icon-hover uk-icon-small uk-icon-twitter\\"><\\/a><\\/li>\\n    <li><a href=\\"https:\\/\\/gitter.im\\/pagekit\\/pagekit\\" class=\\"uk-icon-hover uk-icon-small uk-icon-comment-o\\"><\\/a><\\/li>\\n    <li><a href=\\"https:\\/\\/plus.google.com\\/communities\\/104125443335488004107\\" class=\\"uk-icon-hover uk-icon-small uk-icon-google-plus\\"><\\/a><\\/li>\\n<\\/ul>\\n\\n<p>Powered by <a href=\\"https:\\/\\/pagekit.com\\">Pagekit<\\/a><\\/p>"}'),
(3, 'Sidebar', 'system/text', 1, '1', NULL, '{"content":"<div class=\\"uk-panel\\">\\n    <h3 class=\\"uk-panel-title\\">\\n        Sidebar\\n    <\\/h3>\\n    <p>\\n        Lorem ipsum dolor sit amet!\\n    <\\/p>\\n<\\/div>"}'),
(4, 'Login', 'system/login', 1, '1', NULL, '{"redirect_login":"@user\\/login","redirect_logout":"@user\\/logout"}'),
(5, 'Nächstes Event', 'termine/table', 1, '1', NULL, '[]');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_termine_list`
--

DROP TABLE IF EXISTS `pk_termine_list`;
CREATE TABLE `pk_termine_list` (
  `id` int(10) UNSIGNED NOT NULL,
  `Title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Date` date NOT NULL,
  `intern` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `pk_termine_list`
--

INSERT INTO `pk_termine_list` (`id`, `Title`, `Description`, `Date`, `intern`) VALUES
(31, 'Rettungs-Schwimmer Prüfung', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata', '2017-03-08', 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `pk_blog_comment`
--
ALTER TABLE `pk_blog_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pk_BLOG_COMMENT_AUTHOR` (`author`),
  ADD KEY `pk_BLOG_COMMENT_CREATED` (`created`),
  ADD KEY `pk_BLOG_COMMENT_STATUS` (`status`),
  ADD KEY `pk_BLOG_COMMENT_POST_ID` (`post_id`),
  ADD KEY `pk_BLOG_COMMENT_POST_ID_STATUS` (`post_id`,`status`);

--
-- Indizes für die Tabelle `pk_blog_post`
--
ALTER TABLE `pk_blog_post`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pk_BLOG_POST_SLUG` (`slug`),
  ADD KEY `pk_BLOG_POST_TITLE` (`title`),
  ADD KEY `pk_BLOG_POST_USER_ID` (`user_id`),
  ADD KEY `pk_BLOG_POST_DATE` (`date`);

--
-- Indizes für die Tabelle `pk_calendar_events`
--
ALTER TABLE `pk_calendar_events`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `pk_hello_greetings`
--
ALTER TABLE `pk_hello_greetings`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `pk_portfolio_project`
--
ALTER TABLE `pk_portfolio_project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PORTFOLIO_PROJECT_STATUS` (`status`);

--
-- Indizes für die Tabelle `pk_system_auth`
--
ALTER TABLE `pk_system_auth`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `pk_system_config`
--
ALTER TABLE `pk_system_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pk_SYSTEM_CONFIG_NAME` (`name`);

--
-- Indizes für die Tabelle `pk_system_node`
--
ALTER TABLE `pk_system_node`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `pk_system_page`
--
ALTER TABLE `pk_system_page`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `pk_system_role`
--
ALTER TABLE `pk_system_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pk_SYSTEM_ROLE_NAME` (`name`),
  ADD KEY `pk_SYSTEM_ROLE_NAME_PRIORITY` (`name`,`priority`);

--
-- Indizes für die Tabelle `pk_system_session`
--
ALTER TABLE `pk_system_session`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `pk_system_user`
--
ALTER TABLE `pk_system_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pk_SYSTEM_USER_USERNAME` (`username`),
  ADD UNIQUE KEY `pk_SYSTEM_USER_EMAIL` (`email`);

--
-- Indizes für die Tabelle `pk_system_widget`
--
ALTER TABLE `pk_system_widget`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `pk_termine_list`
--
ALTER TABLE `pk_termine_list`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `pk_blog_comment`
--
ALTER TABLE `pk_blog_comment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `pk_blog_post`
--
ALTER TABLE `pk_blog_post`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT für Tabelle `pk_calendar_events`
--
ALTER TABLE `pk_calendar_events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT für Tabelle `pk_hello_greetings`
--
ALTER TABLE `pk_hello_greetings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `pk_portfolio_project`
--
ALTER TABLE `pk_portfolio_project`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `pk_system_config`
--
ALTER TABLE `pk_system_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;
--
-- AUTO_INCREMENT für Tabelle `pk_system_node`
--
ALTER TABLE `pk_system_node`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT für Tabelle `pk_system_page`
--
ALTER TABLE `pk_system_page`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT für Tabelle `pk_system_role`
--
ALTER TABLE `pk_system_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT für Tabelle `pk_system_user`
--
ALTER TABLE `pk_system_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT für Tabelle `pk_system_widget`
--
ALTER TABLE `pk_system_widget`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT für Tabelle `pk_termine_list`
--
ALTER TABLE `pk_termine_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
