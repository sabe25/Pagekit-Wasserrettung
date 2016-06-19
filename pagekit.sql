-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 19. Jun 2016 um 20:31
-- Server-Version: 10.0.17-MariaDB
-- PHP-Version: 5.6.14

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
(1, 0, 2, '1', 'admin', 'thomas.sabe@gmx.at', '', '::1', '2016-04-24 16:32:19', 'ldshjavblweiuö', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_blog_post`
--

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
(3, 1, 'aufgaben', 'Aufgaben', 2, '2016-04-24 19:33:52', '2016-04-26 19:26:48', '##Terminliste\nTerminliste die im Backend bereich steuerbar ist (insert, delete, update)\n+ Extention installiert\n+ Liste wird angezeigt\n+ Probleme bei /get/{id}\n + 6 Std\n+ Probleme bei /id/{id}\n+ Hinzufügen von Terminen Möglich\n + 4 Std\n\n##Vorstand\nKurze Auflistung aller Vorstände + Kontaktdaten(Auer, Steve)\n\n##Blog\n####intern\nFür aktive Mitglieder zum posten von Aufgaben, Ereignisse, Diskusionen etc.\n\n####extern\nUm der Öffentlichkeit neuigkeiten, Events, Veranstaltungen etc. mitzuteilen\n\n\n###Dienstplan Übersicht (eventuel)\nMitglied kan einsicht nehmen auf die Dienstverteilung an den Wochenenden sowie bei Spezialveranstaltungen. er kann sich für dienste selbst eintragen\n\n###Kursanmeldungen mittels Formular\nInteressierte können sich über ein Formular bei Erste Hilfe Kurse oder Ausbildungen im Rettungwesen anmelden. Anmeldungen werden mit vollem Name, Adresse und E-Mail Adresse in der Datenbank gespeichert. Rückmeldung muss leider manuel erfolgen da kein smtp server zur verfügung steht.', '', 1, 0, '{"title":null,"markdown":true,"image":{"src":"","alt":""}}', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_hello_greetings`
--

CREATE TABLE `pk_hello_greetings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_portfolio_project`
--

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
(1, 1, 1, 'Test', 'test', 'sadfasdfasdfasdfswqrqwerqyxcvasdfqw', 'qfasdadfasdfafasdfasdfasdfasdafsadfdasfsaas', '', 'teset1', '{"teaser":{"src":"storage\\/Markus.jpg","alt":"Markus"},"main":{"src":"storage\\/home-hero.jpg","alt":"Home hero"}}', '2016-04-24 16:44:43', NULL, '[]', '{"markdown":true}');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_system_auth`
--

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
('8763cc02247a68060a174f503066aa8ef8a1941f', 1, '2016-05-03 17:53:14', 1, '{"ip":"::1","user-agent":"Mozilla\\/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko\\/20100101 Firefox\\/45.0"}');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_system_config`
--

CREATE TABLE `pk_system_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `pk_system_config`
--

INSERT INTO `pk_system_config` (`id`, `name`, `value`) VALUES
(1, 'system/dashboard', '{"55dda578e93b5":{"type":"location","column":1,"idx":0,"units":"metric","id":"55dda578e93b5","uid":2774326,"city":"Klagenfurt am Woerthersee","country":"AT","coords":{"lon":14.30528,"lat":46.624722}},"55dda581d5781":{"type":"feed","column":2,"idx":0,"count":5,"content":"1","id":"55dda581d5781","title":"Pagekit News","url":"http:\\/\\/pagekit.com\\/blog\\/feed"},"55dda6e3dd661":{"type":"user","column":0,"idx":100,"show":"registered","display":"thumbnail","total":"1","count":12,"id":"55dda6e3dd661"},"571e601737796":{"type":"hello","column":0,"idx":100,"title":"asdfad","id":"571e601737796"}}'),
(2, 'system/site', '{"menus":{"main":{"id":"main","label":"Main"},"offc":{"id":"offc","label":"offc"}},"title":"Test","frontpage":1,"view":{"logo":"storage\\/OWR-Abziehbild_gross.gif"},"description":"","maintenance":{"enabled":false,"msg":""},"icons":{"favicon":false,"appicon":false},"code":{"header":"","footer":""}}'),
(3, 'system', '{"admin":{"locale":"de_AT"},"site":{"locale":"de_AT","theme":"theme-one"},"version":"1.0.2","packages":{"blog":"1.0.0","theme-one":"1.0.0","hello":"1.0.0","bixie\\/portfolio":"1.1.3","termine":"1.0.0"},"extensions":["blog","hello","bixie\\/portfolio","termine"]}'),
(6, 'theme-one', '{"logo_contrast":"storage\\/OWR-Abziehbild_gross.gif","_menus":{"main":"main","offcanvas":"offc"},"_positions":{"hero":[1],"footer":[2],"sidebar":[3,4]},"_widgets":{"1":{"title_hide":false,"title_size":"uk-h1 uk-margin-top-remove","alignment":true,"html_class":"","panel":""},"2":{"title_hide":true,"title_size":"uk-panel-title","alignment":"true","html_class":"","panel":""},"3":{"title_hide":true,"title_size":"uk-panel-title","alignment":true,"html_class":"","panel":"uk-panel-box"},"4":{"title_hide":false,"title_size":"uk-h3 uk-margin-top-remove","alignment":"","html_class":"","panel":"uk-panel-box"}},"_nodes":{"1":{"title_hide":true,"title_large":false,"alignment":true,"html_class":"","sidebar_first":false,"hero_image":"storage\\/Markus.jpg","hero_viewport":false,"hero_contrast":true,"hero_parallax":false,"navbar_transparent":true,"top_style":"uk-block-muted","main_style":"uk-block-default","bottom_style":"uk-block-muted"},"3":{"title_hide":false,"title_large":false,"alignment":"","html_class":"","sidebar_first":false,"hero_image":"","hero_viewport":"","hero_contrast":"","hero_parallax":"","navbar_transparent":"","top_style":"uk-block-muted","main_style":"uk-block-default","bottom_style":"uk-block-muted"},"4":{"title_hide":false,"title_large":false,"alignment":"","html_class":"","sidebar_first":false,"hero_image":"","hero_viewport":"","hero_contrast":"","hero_parallax":"","navbar_transparent":"","top_style":"uk-block-muted","main_style":"uk-block-default","bottom_style":"uk-block-muted"},"5":{"title_hide":false,"title_large":false,"alignment":"","html_class":"","sidebar_first":false,"hero_image":"","hero_viewport":"","hero_contrast":"","hero_parallax":"","navbar_transparent":"","top_style":"uk-block-muted","main_style":"uk-block-default","bottom_style":"uk-block-muted"},"6":{"title_hide":false,"title_large":false,"alignment":"","html_class":"","sidebar_first":false,"hero_image":"","hero_viewport":"","hero_contrast":"","hero_parallax":"","navbar_transparent":"","top_style":"uk-block-muted","main_style":"uk-block-default","bottom_style":"uk-block-muted"},"2":{"title_hide":false,"title_large":false,"alignment":"","html_class":"","sidebar_first":false,"hero_image":"","hero_viewport":"","hero_contrast":"","hero_parallax":"","navbar_transparent":"","top_style":"uk-block-muted","main_style":"uk-block-default","bottom_style":"uk-block-muted"},"7":{"title_hide":false,"title_large":false,"alignment":"","html_class":"","sidebar_first":false,"hero_image":"","hero_viewport":"","hero_contrast":"","hero_parallax":"","navbar_transparent":"","top_style":"uk-block-muted","main_style":"uk-block-default","bottom_style":"uk-block-muted"}},"logo_offcanvas":""}'),
(37, 'hello', '{"default":"Markus,thomas"}'),
(44, 'system/finder', '{"extensions":"bmp,gif,jpeg,jpg,mp4,ogg,pdf,png,svgz,svg,swf"}'),
(45, 'system/mail', '{"driver":"mail","host":"localhost","port":25,"username":null,"password":null,"encryption":null,"auth_mode":null,"from_name":null,"from_address":null}');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_system_node`
--

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
(1, 0, 0, 1, 'Home', 'home', '/home', '@page/1', 'page', 'main', NULL, '{"defaults":{"id":1}}'),
(2, 0, 2, 1, 'Blog', 'blog', '/blog', '@blog', 'blog', 'main', NULL, '[]'),
(3, 0, 3, 1, 'Hello', 'hello', '/hello', '@hello', 'hello', '', NULL, NULL),
(4, 0, 4, 1, 'Portfolio', 'portfolio', '/portfolio', '@portfolio', 'portfolio', '', NULL, NULL),
(5, 0, 1, 1, 'Gallery', 'gallery', '/gallery', '/portfolio', 'link', 'main', NULL, '[]'),
(6, 0, 6, 1, 'test', 'test', '/test', '@page/2', 'page', 'offc', NULL, '{"defaults":{"id":2}}'),
(7, 0, 7, 1, 'Termine', 'termine', '/termine', '@termine', 'termine', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_system_page`
--

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
(2, 'test', '', '{"title":true}');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_system_role`
--

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
(2, 'Authenticated', 1, 'blog: post comments'),
(3, 'Administrator', 2, NULL),
(4, 'Head Quarter', 3, 'system: manage storage read only,blog: manage own posts,blog: manage all posts,blog: manage comments,blog: comment approval required once,portfolio: manage portfolio,system: access admin area');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_system_session`
--

CREATE TABLE `pk_system_session` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `time` datetime NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `pk_system_session`
--

INSERT INTO `pk_system_session` (`id`, `time`, `data`) VALUES
('2bb09s7oc8f56b878501polmg0', '2016-05-03 17:15:48', 'X3NmMl9hdHRyaWJ1dGVzfGE6MTp7czo1OiJfY3NyZiI7czo0MDoiYWMyYjVmM2FhZmNlZjM0MDhlNGQyZWNmY2ZhYTZjNWU3OWVkODc4ZiI7fV9zZjJfZmxhc2hlc3xhOjA6e31fcGtfbWVzc2FnZXN8YToyOntzOjc6ImRpc3BsYXkiO2E6MDp7fXM6MzoibmV3IjthOjA6e319X3NmMl9tZXRhfGE6Mzp7czoxOiJ1IjtpOjE0NjIyOTU3NDg7czoxOiJjIjtpOjE0NjIyOTM2ODU7czoxOiJsIjtzOjE6IjAiO30='),
('6api3tqn19vd2hge0osmmedb47', '2016-05-03 17:53:14', 'X3NmMl9hdHRyaWJ1dGVzfGE6MTp7czo1OiJfY3NyZiI7czo0MDoiYWMyYjVmM2FhZmNlZjM0MDhlNGQyZWNmY2ZhYTZjNWU3OWVkODc4ZiI7fV9zZjJfZmxhc2hlc3xhOjA6e31fcGtfbWVzc2FnZXN8YToyOntzOjc6ImRpc3BsYXkiO2E6MDp7fXM6MzoibmV3IjthOjA6e319X3NmMl9tZXRhfGE6Mzp7czoxOiJ1IjtpOjE0NjIyOTc5OTQ7czoxOiJjIjtpOjE0NjIyOTM2ODU7czoxOiJsIjtzOjE6IjAiO30='),
('rbmgpl92mi71irbihae98btct0', '2016-05-03 16:41:29', 'X3NmMl9hdHRyaWJ1dGVzfGE6MTp7czo1OiJfY3NyZiI7czo0MDoiYWMyYjVmM2FhZmNlZjM0MDhlNGQyZWNmY2ZhYTZjNWU3OWVkODc4ZiI7fV9zZjJfZmxhc2hlc3xhOjA6e31fcGtfbWVzc2FnZXN8YToyOntzOjc6ImRpc3BsYXkiO2E6MDp7fXM6MzoibmV3IjthOjA6e319X3NmMl9tZXRhfGE6Mzp7czoxOiJ1IjtpOjE0NjIyOTM2ODg7czoxOiJjIjtpOjE0NjIyOTM2ODU7czoxOiJsIjtzOjE6IjAiO30='),
('rh9nv61m23ouqod4g48usar030', '2016-04-26 19:26:48', 'X3NmMl9hdHRyaWJ1dGVzfGE6MTp7czo1OiJfY3NyZiI7czo0MDoiY2U3ZDhlNGY2Nzg1NzFlZDJmYmFlZTUzODRkMjA5MjZmOGVmNGZkMCI7fV9zZjJfZmxhc2hlc3xhOjA6e31fcGtfbWVzc2FnZXN8YToyOntzOjc6ImRpc3BsYXkiO2E6MDp7fXM6MzoibmV3IjthOjA6e319X3NmMl9tZXRhfGE6Mzp7czoxOiJ1IjtpOjE0NjE2OTg4MDg7czoxOiJjIjtpOjE0NjE2OTIxMzc7czoxOiJsIjtzOjE6IjAiO30=');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_system_user`
--

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
(1, 'admin', 'admin', 'thomas.sabe@gmx.at', '$2y$10$gGMFEkfX7sJTmJHI7kuDJOtv7mQE2RDop/iui8kEl1sLf2jthlg1C', '', 1, '2016-04-20 17:59:22', '2016-05-03 17:15:52', NULL, '2,3', '{"admin":{"menu":{"dashboard":0,"site":1,"blog":2,"user":3,"system: system":4,"system: marketplace":5}}}'),
(2, 'Head', 'headquarter', 'hq@gmx.at', '$2y$10$FUngU/q8YIk2v.GYVPDpd.V.A.kIHK8MoziyykXmn042/a8EIfAv.', '', 1, '2016-04-24 19:16:27', '2016-04-24 19:18:29', NULL, '2,4', '[]');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_system_widget`
--

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
(4, 'Login', 'system/login', 1, '1', NULL, '{"redirect_login":"@user\\/login","redirect_logout":"@user\\/logout"}');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_termine_list`
--

CREATE TABLE `pk_termine_list` (
  `id` int(10) UNSIGNED NOT NULL,
  `Title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `pk_termine_list`
--

INSERT INTO `pk_termine_list` (`id`, `Title`, `Description`, `Date`) VALUES
(2, 'Test2', '##LongTextTestdasjhflashjdf#asdfkjahsvdfkja\r\nasdhjlfhgalsjdhgfaljs', '0000-00-00'),
(7, 'Teset4', 'fasdfasfda sdfqawrfcqeasdffasdfasfasadfasdfsdfasdfsafasdfqwerqwerq', '0000-00-00'),
(8, '', 'ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd', '0000-00-00'),
(9, '', '', '0000-00-00'),
(10, 'asdjvbldvheb', 'kasdjvbalisbvlwkvb al<hij laiwvbdlivawhbvldbjaskdjvbalskdjvblaksnxvb lskjvlaihuvdsiusxv', '0000-00-00'),
(11, 'SDCVWSCVSDC', 'DSAVDsdfvyaysdx', '0000-00-00'),
(12, 'ladsivhalsjv', 'KJYDFVLYKDBJVLK', '0000-00-00');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `pk_blog_post`
--
ALTER TABLE `pk_blog_post`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT für Tabelle `pk_system_node`
--
ALTER TABLE `pk_system_node`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT für Tabelle `pk_system_page`
--
ALTER TABLE `pk_system_page`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `pk_system_role`
--
ALTER TABLE `pk_system_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `pk_system_user`
--
ALTER TABLE `pk_system_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `pk_system_widget`
--
ALTER TABLE `pk_system_widget`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `pk_termine_list`
--
ALTER TABLE `pk_termine_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
