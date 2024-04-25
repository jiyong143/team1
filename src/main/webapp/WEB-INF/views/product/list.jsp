<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<style>
.container {
	overflow: auto;
}

.xl\:h-24 {
	height: 6rem;
}

@media ( min-width : 1024px) .lg\:px-8 {
	padding-left
	
	
	
	
	:
	
	
	 
	
	
	2rem
	
	
	
	
	;
	padding-right
	
	
	
	
	:
	
	
	 
	
	
	2rem
	
	
	
	
	;
}

@media ( min-width : 1024px) .lg\:h-20 {
	height
	
	
	
	
	:
	
	
	 
	
	
	5rem
	
	
	
	
	;
}

.px-0 {
	padding-left: 0;
	padding-right: 0;
}

.justify-between {
	justify-content: space-between;
}

.items-center {
	align-items: center;
}

.max-w-\[1024px\] {
	max-width: 1024px;
}

.h-full {
	height: 100%;
}

.flex {
	display: flex;
}

.box-content {
	box-sizing: content-box;
}

.mx-auto {
	margin-left: auto;
	margin-right: auto;
}

.relative {
	position: relative;
}

@media ( min-width : 1280px) .xl\:h-24 {
	height
	
	
	
	
	:
	
	
	 
	
	
	6rem
	
	
	
	
	;
}

@media ( min-width : 1024px) .lg\:px-8 {
	padding-left
	
	
	
	
	:
	
	
	 
	
	
	2rem
	
	
	
	
	;
	padding-right
	
	
	
	
	:
	
	
	 
	
	
	2rem
	
	
	
	
	;
}

@media ( min-width : 1024px) .lg\:h-20 {
	height
	
	
	
	
	:
	
	
	 
	
	
	5rem
	
	
	
	
	;
}

*, :after, :before { -
	-tw-border-spacing-x: 0; -
	-tw-border-spacing-y: 0; -
	-tw-translate-x: 0; -
	-tw-translate-y: 0; -
	-tw-rotate: 0; -
	-tw-skew-x: 0; -
	-tw-skew-y: 0; -
	-tw-scale-x: 1; -
	-tw-scale-y: 1; -
	-tw-pan-x:; -
	-tw-pan-y:; -
	-tw-pinch-zoom:; -
	-tw-scroll-snap-strictness: proximity; -
	-tw-ordinal:; -
	-tw-slashed-zero:; -
	-tw-numeric-figure:; -
	-tw-numeric-spacing:; -
	-tw-numeric-fraction:; -
	-tw-ring-inset:; -
	-tw-ring-offset-width: 0px; -
	-tw-ring-offset-color: #fff; -
	-tw-ring-color: rgba(59, 130, 246, .5); -
	-tw-ring-offset-shadow: 0 0 #0000; -
	-tw-ring-shadow: 0 0 #0000; -
	-tw-shadow: 0 0 #0000; -
	-tw-shadow-colored: 0 0 #0000; -
	-tw-blur:; -
	-tw-brightness:; -
	-tw-contrast:; -
	-tw-grayscale:; -
	-tw-hue-rotate:; -
	-tw-invert:; -
	-tw-saturate:; -
	-tw-sepia:; -
	-tw-drop-shadow:; -
	-tw-backdrop-blur:; -
	-tw-backdrop-brightness:; -
	-tw-backdrop-contrast:; -
	-tw-backdrop-grayscale:; -
	-tw-backdrop-hue-rotate:; -
	-tw-backdrop-invert:; -
	-tw-backdrop-opacity:; -
	-tw-backdrop-saturate:; -
	-tw-backdrop-sepia:;
}

*, :after, :before {
	box-sizing: border-box;
	border: 0 solid #f9f9f9;
}

user agent stylesheet
div {
	display: block;
	unicode-bidi: isolate;
}

.text-gray-700 { -
	-tw-text-opacity: 1;
	color: rgb(41, 41, 41/ var( - -tw-text-opacity));
}

.bg-white { -
	-tw-bg-opacity: 1;
	background-color: rgb(255, 255, 255/ var( - -tw-bg-opacity));
}

.border-jnGray-300 { -
	-tw-border-opacity: 1;
	border-color: rgb(218, 222, 229/ var( - -tw-border-opacity));
}

body, html {
	font-family: Pretendard Variable, sans-serif; -
	-tw-text-opacity: 1;
	color: rgb(90, 90, 90/ var( - -tw-text-opacity));
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

body {
	margin: 0;
	line-height: inherit;
}

:root { -
	-header-height: 64px; -
	-sm-header-height: 80px; -
	-lg-header-height: 204px; -
	-xl-header-height: 220px;
}

:root { -
	-toastify-color-light: #fff; -
	-toastify-color-dark: #121212; -
	-toastify-color-info: #3498db; -
	-toastify-color-success: #07bc0c; -
	-toastify-color-warning: #f1c40f; -
	-toastify-color-error: #e74c3c; -
	-toastify-color-transparent: hsla(0, 0%, 100%, .7); -
	-toastify-icon-color-info: var(- -toastify-color-info); -
	-toastify-icon-color-success: var(- -toastify-color-success); -
	-toastify-icon-color-warning: var(- -toastify-color-warning); -
	-toastify-icon-color-error: var(- -toastify-color-error); -
	-toastify-toast-width: 320px; -
	-toastify-toast-background: #fff; -
	-toastify-toast-min-height: 64px; -
	-toastify-toast-max-height: 800px; -
	-toastify-font-family: sans-serif; -
	-toastify-z-index: 9999; -
	-toastify-text-color-light: #757575; -
	-toastify-text-color-dark: #fff; -
	-toastify-text-color-info: #fff; -
	-toastify-text-color-success: #fff; -
	-toastify-text-color-warning: #fff; -
	-toastify-text-color-error: #fff; -
	-toastify-spinner-color: #616161; -
	-toastify-spinner-color-empty-area: #e0e0e0; -
	-toastify-color-progress-light: linear-gradient(90deg, #4cd964, #5ac8fa, #007aff, #34aadc, #5856d6,
		#ff2d55); -
	-toastify-color-progress-dark: #bb86fc; -
	-toastify-color-progress-info: var(- -toastify-color-info); -
	-toastify-color-progress-success: var(- -toastify-color-success); -
	-toastify-color-progress-warning: var(- -toastify-color-warning); -
	-toastify-color-progress-error: var(- -toastify-color-error);
}

html {
	-webkit-tap-highlight-color: transparent;
}

html {
	line-height: 1.5;
	-webkit-text-size-adjust: 100%;
	-moz-tab-size: 4;
	-o-tab-size: 4;
	tab-size: 4;
	font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont,
		Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif,
		Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji;
	font-feature-settings: normal;
}

.before\:bg-\[\#F1F1F1\]:before {
	content: var(- -tw-content); -
	-tw-bg-opacity: 1;
	background-color: rgb(241, 241, 241/ var( - -tw-bg-opacity));
}

.before\:w-screen:before {
	content: var(- -tw-content);
	width: 100vw;
}

.before\:bottom-0:before {
	content: var(- -tw-content);
	bottom: 0;
}

.before\:absolute:before {
	content: var(- -tw-content);
	position: absolute;
}

*, :after, :before { -
	-tw-border-spacing-x: 0; -
	-tw-border-spacing-y: 0; -
	-tw-translate-x: 0; -
	-tw-translate-y: 0; -
	-tw-rotate: 0; -
	-tw-skew-x: 0; -
	-tw-skew-y: 0; -
	-tw-scale-x: 1; -
	-tw-scale-y: 1; -
	-tw-pan-x:; -
	-tw-pan-y:; -
	-tw-pinch-zoom:; -
	-tw-scroll-snap-strictness: proximity; -
	-tw-ordinal:; -
	-tw-slashed-zero:; -
	-tw-numeric-figure:; -
	-tw-numeric-spacing:; -
	-tw-numeric-fraction:; -
	-tw-ring-inset:; -
	-tw-ring-offset-width: 0px; -
	-tw-ring-offset-color: #fff; -
	-tw-ring-color: rgba(59, 130, 246, .5); -
	-tw-ring-offset-shadow: 0 0 #0000; -
	-tw-ring-shadow: 0 0 #0000; -
	-tw-shadow: 0 0 #0000; -
	-tw-shadow-colored: 0 0 #0000; -
	-tw-blur:; -
	-tw-brightness:; -
	-tw-contrast:; -
	-tw-grayscale:; -
	-tw-hue-rotate:; -
	-tw-invert:; -
	-tw-saturate:; -
	-tw-sepia:; -
	-tw-drop-shadow:; -
	-tw-backdrop-blur:; -
	-tw-backdrop-brightness:; -
	-tw-backdrop-contrast:; -
	-tw-backdrop-grayscale:; -
	-tw-backdrop-hue-rotate:; -
	-tw-backdrop-invert:; -
	-tw-backdrop-opacity:; -
	-tw-backdrop-saturate:; -
	-tw-backdrop-sepia:;
}

:after, :before { -
	-tw-content: "";
}

*, :after, :before {
	box-sizing: border-box;
	border: 0 solid #f9f9f9;
}

*, :after, :before { -
	-tw-border-spacing-x: 0; -
	-tw-border-spacing-y: 0; -
	-tw-translate-x: 0; -
	-tw-translate-y: 0; -
	-tw-rotate: 0; -
	-tw-skew-x: 0; -
	-tw-skew-y: 0; -
	-tw-scale-x: 1; -
	-tw-scale-y: 1; -
	-tw-pan-x:; -
	-tw-pan-y:; -
	-tw-pinch-zoom:; -
	-tw-scroll-snap-strictness: proximity; -
	-tw-ordinal:; -
	-tw-slashed-zero:; -
	-tw-numeric-figure:; -
	-tw-numeric-spacing:; -
	-tw-numeric-fraction:; -
	-tw-ring-inset:; -
	-tw-ring-offset-width: 0px; -
	-tw-ring-offset-color: #fff; -
	-tw-ring-color: rgba(59, 130, 246, .5); -
	-tw-ring-offset-shadow: 0 0 #0000; -
	-tw-ring-shadow: 0 0 #0000; -
	-tw-shadow: 0 0 #0000; -
	-tw-shadow-colored: 0 0 #0000; -
	-tw-blur:; -
	-tw-brightness:; -
	-tw-contrast:; -
	-tw-grayscale:; -
	-tw-hue-rotate:; -
	-tw-invert:; -
	-tw-saturate:; -
	-tw-sepia:; -
	-tw-drop-shadow:; -
	-tw-backdrop-blur:; -
	-tw-backdrop-brightness:; -
	-tw-backdrop-contrast:; -
	-tw-backdrop-grayscale:; -
	-tw-backdrop-hue-rotate:; -
	-tw-backdrop-invert:; -
	-tw-backdrop-opacity:; -
	-tw-backdrop-saturate:; -
	-tw-backdrop-sepia:;
}

:after, :before { -
	-tw-content: "";
}

*, :after, :before {
	box-sizing: border-box;
	border: 0 solid #f9f9f9;
}

::backdrop { -
	-tw-border-spacing-x: 0; -
	-tw-border-spacing-y: 0; -
	-tw-translate-x: 0; -
	-tw-translate-y: 0; -
	-tw-rotate: 0; -
	-tw-skew-x: 0; -
	-tw-skew-y: 0; -
	-tw-scale-x: 1; -
	-tw-scale-y: 1; -
	-tw-pan-x:; -
	-tw-pan-y:; -
	-tw-pinch-zoom:; -
	-tw-scroll-snap-strictness: proximity; -
	-tw-ordinal:; -
	-tw-slashed-zero:; -
	-tw-numeric-figure:; -
	-tw-numeric-spacing:; -
	-tw-numeric-fraction:; -
	-tw-ring-inset:; -
	-tw-ring-offset-width: 0px; -
	-tw-ring-offset-color: #fff; -
	-tw-ring-color: rgba(59, 130, 246, .5); -
	-tw-ring-offset-shadow: 0 0 #0000; -
	-tw-ring-shadow: 0 0 #0000; -
	-tw-shadow: 0 0 #0000; -
	-tw-shadow-colored: 0 0 #0000; -
	-tw-blur:; -
	-tw-brightness:; -
	-tw-contrast:; -
	-tw-grayscale:; -
	-tw-hue-rotate:; -
	-tw-invert:; -
	-tw-saturate:; -
	-tw-sepia:; -
	-tw-drop-shadow:; -
	-tw-backdrop-blur:; -
	-tw-backdrop-brightness:; -
	-tw-backdrop-contrast:; -
	-tw-backdrop-grayscale:; -
	-tw-backdrop-hue-rotate:; -
	-tw-backdrop-invert:; -
	-tw-backdrop-opacity:; -
	-tw-backdrop-saturate:; -
	-tw-backdrop-sepia:;
}

:not(.scrollbar-show)::-webkit-scrollbar {
	display: none;
}

.relative {
	position: relative;
}

*, :after, :before { -
	-tw-border-spacing-x: 0; -
	-tw-border-spacing-y: 0; -
	-tw-translate-x: 0; -
	-tw-translate-y: 0; -
	-tw-rotate: 0; -
	-tw-skew-x: 0; -
	-tw-skew-y: 0; -
	-tw-scale-x: 1; -
	-tw-scale-y: 1; -
	-tw-pan-x:; -
	-tw-pan-y:; -
	-tw-pinch-zoom:; -
	-tw-scroll-snap-strictness: proximity; -
	-tw-ordinal:; -
	-tw-slashed-zero:; -
	-tw-numeric-figure:; -
	-tw-numeric-spacing:; -
	-tw-numeric-fraction:; -
	-tw-ring-inset:; -
	-tw-ring-offset-width: 0px; -
	-tw-ring-offset-color: #fff; -
	-tw-ring-color: rgba(59, 130, 246, .5); -
	-tw-ring-offset-shadow: 0 0 #0000; -
	-tw-ring-shadow: 0 0 #0000; -
	-tw-shadow: 0 0 #0000; -
	-tw-shadow-colored: 0 0 #0000; -
	-tw-blur:; -
	-tw-brightness:; -
	-tw-contrast:; -
	-tw-grayscale:; -
	-tw-hue-rotate:; -
	-tw-invert:; -
	-tw-saturate:; -
	-tw-sepia:; -
	-tw-drop-shadow:; -
	-tw-backdrop-blur:; -
	-tw-backdrop-brightness:; -
	-tw-backdrop-contrast:; -
	-tw-backdrop-grayscale:; -
	-tw-backdrop-hue-rotate:; -
	-tw-backdrop-invert:; -
	-tw-backdrop-opacity:; -
	-tw-backdrop-saturate:; -
	-tw-backdrop-sepia:;
}

*, :after, :before {
	box-sizing: border-box;
	border: 0 solid #f9f9f9;
}

user agent stylesheet
div {
	display: block;
	unicode-bidi: isolate;
}

.bg-white { -
	-tw-bg-opacity: 1;
	background-color: rgb(255, 255, 255/ var( - -tw-bg-opacity));
}

body, html {
	font-family: Pretendard Variable, sans-serif; -
	-tw-text-opacity: 1;
	color: rgb(90, 90, 90/ var( - -tw-text-opacity));
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

body {
	margin: 0;
	line-height: inherit;
}

:root { -
	-header-height: 64px; -
	-sm-header-height: 80px; -
	-lg-header-height: 204px; -
	-xl-header-height: 220px;
}

:root { -
	-toastify-color-light: #fff; -
	-toastify-color-dark: #121212; -
	-toastify-color-info: #3498db; -
	-toastify-color-success: #07bc0c; -
	-toastify-color-warning: #f1c40f; -
	-toastify-color-error: #e74c3c; -
	-toastify-color-transparent: hsla(0, 0%, 100%, .7); -
	-toastify-icon-color-info: var(- -toastify-color-info); -
	-toastify-icon-color-success: var(- -toastify-color-success); -
	-toastify-icon-color-warning: var(- -toastify-color-warning); -
	-toastify-icon-color-error: var(- -toastify-color-error); -
	-toastify-toast-width: 320px; -
	-toastify-toast-background: #fff; -
	-toastify-toast-min-height: 64px; -
	-toastify-toast-max-height: 800px; -
	-toastify-font-family: sans-serif; -
	-toastify-z-index: 9999; -
	-toastify-text-color-light: #757575; -
	-toastify-text-color-dark: #fff; -
	-toastify-text-color-info: #fff; -
	-toastify-text-color-success: #fff; -
	-toastify-text-color-warning: #fff; -
	-toastify-text-color-error: #fff; -
	-toastify-spinner-color: #616161; -
	-toastify-spinner-color-empty-area: #e0e0e0; -
	-toastify-color-progress-light: linear-gradient(90deg, #4cd964, #5ac8fa, #007aff, #34aadc, #5856d6,
		#ff2d55); -
	-toastify-color-progress-dark: #bb86fc; -
	-toastify-color-progress-info: var(- -toastify-color-info); -
	-toastify-color-progress-success: var(- -toastify-color-success); -
	-toastify-color-progress-warning: var(- -toastify-color-warning); -
	-toastify-color-progress-error: var(- -toastify-color-error);
}

html {
	-webkit-tap-highlight-color: transparent;
}

html {
	line-height: 1.5;
	-webkit-text-size-adjust: 100%;
	-moz-tab-size: 4;
	-o-tab-size: 4;
	tab-size: 4;
	font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont,
		Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif,
		Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji;
	font-feature-settings: normal;
}

*, :after, :before { -
	-tw-border-spacing-x: 0; -
	-tw-border-spacing-y: 0; -
	-tw-translate-x: 0; -
	-tw-translate-y: 0; -
	-tw-rotate: 0; -
	-tw-skew-x: 0; -
	-tw-skew-y: 0; -
	-tw-scale-x: 1; -
	-tw-scale-y: 1; -
	-tw-pan-x:; -
	-tw-pan-y:; -
	-tw-pinch-zoom:; -
	-tw-scroll-snap-strictness: proximity; -
	-tw-ordinal:; -
	-tw-slashed-zero:; -
	-tw-numeric-figure:; -
	-tw-numeric-spacing:; -
	-tw-numeric-fraction:; -
	-tw-ring-inset:; -
	-tw-ring-offset-width: 0px; -
	-tw-ring-offset-color: #fff; -
	-tw-ring-color: rgba(59, 130, 246, .5); -
	-tw-ring-offset-shadow: 0 0 #0000; -
	-tw-ring-shadow: 0 0 #0000; -
	-tw-shadow: 0 0 #0000; -
	-tw-shadow-colored: 0 0 #0000; -
	-tw-blur:; -
	-tw-brightness:; -
	-tw-contrast:; -
	-tw-grayscale:; -
	-tw-hue-rotate:; -
	-tw-invert:; -
	-tw-saturate:; -
	-tw-sepia:; -
	-tw-drop-shadow:; -
	-tw-backdrop-blur:; -
	-tw-backdrop-brightness:; -
	-tw-backdrop-contrast:; -
	-tw-backdrop-grayscale:; -
	-tw-backdrop-hue-rotate:; -
	-tw-backdrop-invert:; -
	-tw-backdrop-opacity:; -
	-tw-backdrop-saturate:; -
	-tw-backdrop-sepia:;
}

:after, :before { -
	-tw-content: "";
}

*, :after, :before {
	box-sizing: border-box;
	border: 0 solid #f9f9f9;
}

*, :after, :before { -
	-tw-border-spacing-x: 0; -
	-tw-border-spacing-y: 0; -
	-tw-translate-x: 0; -
	-tw-translate-y: 0; -
	-tw-rotate: 0; -
	-tw-skew-x: 0; -
	-tw-skew-y: 0; -
	-tw-scale-x: 1; -
	-tw-scale-y: 1; -
	-tw-pan-x:; -
	-tw-pan-y:; -
	-tw-pinch-zoom:; -
	-tw-scroll-snap-strictness: proximity; -
	-tw-ordinal:; -
	-tw-slashed-zero:; -
	-tw-numeric-figure:; -
	-tw-numeric-spacing:; -
	-tw-numeric-fraction:; -
	-tw-ring-inset:; -
	-tw-ring-offset-width: 0px; -
	-tw-ring-offset-color: #fff; -
	-tw-ring-color: rgba(59, 130, 246, .5); -
	-tw-ring-offset-shadow: 0 0 #0000; -
	-tw-ring-shadow: 0 0 #0000; -
	-tw-shadow: 0 0 #0000; -
	-tw-shadow-colored: 0 0 #0000; -
	-tw-blur:; -
	-tw-brightness:; -
	-tw-contrast:; -
	-tw-grayscale:; -
	-tw-hue-rotate:; -
	-tw-invert:; -
	-tw-saturate:; -
	-tw-sepia:; -
	-tw-drop-shadow:; -
	-tw-backdrop-blur:; -
	-tw-backdrop-brightness:; -
	-tw-backdrop-contrast:; -
	-tw-backdrop-grayscale:; -
	-tw-backdrop-hue-rotate:; -
	-tw-backdrop-invert:; -
	-tw-backdrop-opacity:; -
	-tw-backdrop-saturate:; -
	-tw-backdrop-sepia:;
}

:after, :before { -
	-tw-content: "";
}

*, :after, :before {
	box-sizing: border-box;
	border: 0 solid #f9f9f9;
}

::backdrop { -
	-tw-border-spacing-x: 0; -
	-tw-border-spacing-y: 0; -
	-tw-translate-x: 0; -
	-tw-translate-y: 0; -
	-tw-rotate: 0; -
	-tw-skew-x: 0; -
	-tw-skew-y: 0; -
	-tw-scale-x: 1; -
	-tw-scale-y: 1; -
	-tw-pan-x:; -
	-tw-pan-y:; -
	-tw-pinch-zoom:; -
	-tw-scroll-snap-strictness: proximity; -
	-tw-ordinal:; -
	-tw-slashed-zero:; -
	-tw-numeric-figure:; -
	-tw-numeric-spacing:; -
	-tw-numeric-fraction:; -
	-tw-ring-inset:; -
	-tw-ring-offset-width: 0px; -
	-tw-ring-offset-color: #fff; -
	-tw-ring-color: rgba(59, 130, 246, .5); -
	-tw-ring-offset-shadow: 0 0 #0000; -
	-tw-ring-shadow: 0 0 #0000; -
	-tw-shadow: 0 0 #0000; -
	-tw-shadow-colored: 0 0 #0000; -
	-tw-blur:; -
	-tw-brightness:; -
	-tw-contrast:; -
	-tw-grayscale:; -
	-tw-hue-rotate:; -
	-tw-invert:; -
	-tw-saturate:; -
	-tw-sepia:; -
	-tw-drop-shadow:; -
	-tw-backdrop-blur:; -
	-tw-backdrop-brightness:; -
	-tw-backdrop-contrast:; -
	-tw-backdrop-grayscale:; -
	-tw-backdrop-hue-rotate:; -
	-tw-backdrop-invert:; -
	-tw-backdrop-opacity:; -
	-tw-backdrop-saturate:; -
	-tw-backdrop-sepia:;
}

:not(.scrollbar-show)::-webkit-scrollbar {
	display: none;
}

.container {
	max-width: 1024px;
	margin: auto;
	padding: 0 20px;
}

.table-container {
	margin-top: 20px;
	overflow-x: auto;
}

table {
	width: 100%;
	border-collapse: collapse;
	border: 1px solid #ccc;
	margin-top: 20px;
}

th, td {
	padding: 10px;
	border: 1px solid #ccc;
	text-align: center;
}

th {
	background-color: #f2f2f2;
}

h5 {
	text-align: center;
	margin-bottom: 20px;
}

.product-container {
	width: 20%; /* 5개의 상품을 한 줄에 배치하기 위해 20%로 설정 */
	float: left; /* 왼쪽 정렬 */
	box-sizing: border-box; /* padding과 border가 요소의 크기에 포함되도록 설정 */
	padding: 10px; /* 각 상품 컨테이너의 안쪽 여백 설정 */
}

.product-box {
	width: 100%; /* 부모 요소의 너비에 맞게 설정 */
	border: 1px solid #ccc; /* 테두리 설정 */
	border-radius: 5px; /* 모서리를 둥글게 설정 */
}

.product-image img {
	width: 100%; /* 이미지를 부모 요소의 너비에 맞게 설정 */
	height: auto; /* 가로 비율을 유지하면서 세로 크기 자동 조정 */
}

.static {
	text-align: left;
	font-size: 20px;
	font-weight: bold;
}

/* 제품 가격 정보 컨테이너 스타일 */
.product-price-container {
	background: linear-gradient(to bottom, #FFFFFF, #F5F5F5);
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
	padding: 20px;
}

/* 제품 가격 제목 스타일 */
.product-price-title {
	font-size: 20px;
	font-weight: bold;
	color: #333333;
	margin-bottom: 10px;
}

/* 제품 가격 스타일 */
.product-price {
	font-size: 24px;
	font-weight: bold;
	color: #333333;
}

/* 가격 정보 항목 간격 조정 */
.product-price-item {
	margin-bottom: 15px;
}

/* 각 span 태그 사이의 간격을 조정 */
.product-price-item span {
	margin-right: 20px; /* 우측 여백 추가 */
}

/* 각 div 태그 사이에 구분선을 추가 */
.product-price-item+.product-price-item {
	border-left: 3px solid #E5E7EB; /* 왼쪽에 1px 두께의 실선 구분선 추가 */
}

.product-list {
	margin: 0 auto; /* 가로 여백을 화면 왼쪽과 오른쪽 모두 동일하게 설정 */
	max-width: 1200px; /* 최대 너비를 지정하여 내용이 너무 퍼지지 않도록 설정 */
}

.search-input {
	width: 400px;
	padding: 10px;
	border: 2px solid #ddd;
	border-radius: 20px;
	font-size: 16px;
	outline: none;
}

.price-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.minPrice-box, .maxPrice-box {
	flex: 1;
	margin-right: 6px;
}

button {
	flex-shrink: 0; /* 버튼이 너무 커지지 않도록 설정 */
}

li {
	list-style: none;
}

.product-image img {
	transition: transform 0.5s ease; /* 이미지 확대/축소 트랜지션 */
}

.product-image img:hover {
	transform: scale(1.2); /* 이미지를 1.2배로 확대 */
}

.product-image img:not(:hover) {
	transition: transform 0.3s ease; /* 마우스를 뗐을 때 이미지 축소 트랜지션 */
}

.pagination {
	width: 100%;
}

.horizontal-list {
	list-style-type: none;
	padding: 0;
	margin: 0;
	display: flex;
}

.horizontal-list li {
	background-color: #f2f2f2;
	padding: 0px;
	margin: 0;
	border-radius: 5px;
}
</style>
</head>
<body>
	<div class="container">
		<div
			class="h-full lg:h-20 xl:h-24 px-0 lg:px-8 2xl:px-16 max-w-[1024px] min-[1600px]:max-w-[1280px] flex items-center mx-auto box-content justify-between relative before:absolute before:w-screen before:bg-[#F1F1F1] before:bottom-0">
			<aside
				class="max-[1279px]:hidden absolute w-[98px] space-y-2 z-30 flex flex-col min-h-[306px] px-2 py-2 rounded bg-white border border-gray-300 top-44 -right-20">
			</aside>
			<div class="relative hidden ms-7 me-7 xl:ms-9 lg:block flex-1">
				<div
					class="relative flex items-center justify-between w-full rounded-md bg-borderBottom">
					<label for="search" class="flex items-center justify-between">
						<span
						class="absolute top-0 left-0 flex items-center justify-center flex-shrink-0 w-12 h-full cursor-pointer md:w-14 focus:outline-none"><svg
								width="24" height="24" viewBox="0 0 24 24"
								xmlns="http://www.w3.org/2000/svg"
								class="w-[16px] h-[16px] text-heading">
								<path
									d="M10.0278 19.0556C14.3233 19.0556 17.8056 15.5733 17.8056 11.2778C17.8056 6.98223 14.3233 3.5 10.0278 3.5C5.73223 3.5 2.25 6.98223 2.25 11.2778C2.25 15.5733 5.73223 19.0556 10.0278 19.0556Z"
									stroke="currentColor" stroke-width="1.5" stroke-linecap="round"
									stroke-linejoin="round" fill="transparent"></path>
								<path d="M21 21.8999L15.5 16.8999" stroke="currentColor"
									stroke-width="1.5" stroke-linecap="round"
									stroke-linejoin="round"></path></svg> </span> <input type="search"
						id="search-header" class="search-input"
						placeholder="어떤 상품을 찾으시나요?" aria-label="search-header"
						autocomplete="off" name="search" value="${search }">
					</label>
				</div>

				<div
					class="bg-white flex flex-col h-full max-h-64vh lg:max-h-[550px] w-full z-10 absolute h-auto shadow-header hidden mt-4">
					<div
						class="os-host os-host-foreign os-theme-thin os-host-flexbox os-host-resize-disabled os-host-scrollbar-horizontal-hidden os-host-scrollbar-vertical-hidden os-host-transition">
						<div class="os-resize-observer-host observed">
							<div class="os-resize-observer" style="left: 0px; right: auto;">
							</div>
						</div>
						<div class="os-size-auto-observer observed"
							style="height: calc(100% + 1px); float: left;">
							<div class="os-resize-observer"></div>
						</div>
						<div class="os-content-glue" style="margin: 0px;"></div>
						<div class="os-padding">
							<div
								class="os-viewport os-viewport-native-scrollbars-invisible os-viewport-native-scrollbars-overlaid">
								<div class="os-content"
									style="padding: 0px; height: 100%; width: 100%;">
									<div
										class="h-full bg-white border rounded-md rounded-t-none border-gray-150">
										<div class="flex justify-center items-center h-[528px]">
										</div>
									</div>
								</div>
							</div>
						</div>

						<div
							class="os-scrollbar os-scrollbar-horizontal os-scrollbar-unusable os-scrollbar-auto-hidden">
							<div class="os-scrollbar-track os-scrollbar-track-off">
								<div class="os-scrollbar-handle"
									style="transform: translate(0px, 0px);"></div>
							</div>
						</div>

						<div
							class="os-scrollbar os-scrollbar-vertical os-scrollbar-unusable os-scrollbar-auto-hidden">
							<div class="os-scrollbar-track os-scrollbar-track-off">
								<div class="os-scrollbar-handle"
									style="transform: translate(0px, 0px);"></div>
							</div>
						</div>

						<div class="os-scrollbar-corner"></div>
					</div>
				</div>
			</div>

			<div class="hidden lg:flex relative w-[300px]">
				<ul
					class="flex w-full text-sm font-medium list-none text-jnGray-900 break-keep">
					<li class="flex items-center justify-center pr-3">
						<button class="ga4_main_top_menu flex items-center justify-center">
							<div class="relative cursor-pointer" id="채팅하기">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									fill="none" id="채팅하기" size="24">
    <path stroke="#141313" stroke-linecap="round"
										stroke-linejoin="round" stroke-width="1.5"
										d="M20.797 12.2c0 1.639-.438 3.175-1.204 4.5l.46 3.035a.9.9 0 0 1-1.23.968l-2.526-.708a9 9 0 1 1 4.5-7.796"
										clip-rule="evenodd"></path>
    <path fill="#141313" stroke="#141313" stroke-width="0.15"
										d="M8.864 12.2a1.075 1.075 0 1 0-2.15 0 1.075 1.075 0 0 0 2.15 0Zm4 0a1.075 1.075 0 1 0-2.15 0 1.075 1.075 0 0 0 2.15 0Zm4 0a1.075 1.075 0 1 0-2.15 0 1.075 1.075 0 0 0 2.15 0Z"></path></svg>
							</div>
							<p id="채팅하기" class="ml-1">채팅하기</p>
						</button>
					</li>
					<li
						class="after:contents-[&quot;&quot;] after:absolute after:w-[1px] after:h-4 after:bg-jnGray-300 after:right-0 before:contents-[&quot;&quot;] before:absolute before:w-[1px] before:h-4 before:bg-jnGray-300 before:left-0 ga4_main_top_menu relative flex items-center justify-center px-3"><a
						class="flex items-center justify-center [&amp;>p]:ml-1"
						href="/product/form?type=regist"><svg id="판매하기" width="24"
								height="24" viewBox="0 0 24 24" fill="none"
								xmlns="http://www.w3.org/2000/svg">
								<path
									d="M13.6859 20.6926H4.92323C3.88605 20.6926 3.08773 19.8241 3.20716 18.8409L4.49579 8.32142C4.5775 7.63983 5.18096 7.12109 5.89756 7.12109H15.8168C16.5334 7.12109 17.1369 7.6338 17.2186 8.32142L17.91 14.0701"
									stroke="currentColor" stroke-width="1.5"></path>
								<path
									d="M8.35938 9.35156V9.5868C8.35938 10.7751 9.47828 11.7462 10.8486 11.7462C12.219 11.7462 13.3379 10.7751 13.3379 9.5868V9.35156"
									stroke="currentColor" stroke-width="1.5" stroke-linecap="round"
									stroke-linejoin="round"></path>
								<path
									d="M7.35938 7.72983V6.25112C7.35938 4.34555 8.90414 2.80078 10.8097 2.80078V2.80078C12.7153 2.80078 14.26 4.34555 14.26 6.25112V7.72983"
									stroke="currentColor" stroke-width="1.5"></path>
								<path
									d="M17.1179 22.4245C19.3694 22.4245 21.1968 20.5969 21.1968 18.347C21.1968 16.0972 19.3694 14.2695 17.1179 14.2695C14.8665 14.2695 13.0391 16.0972 13.0391 18.347C13.0391 20.5969 14.8665 22.4245 17.1179 22.4245Z"
									stroke="currentColor" stroke-width="1.5" stroke-linecap="round"
									stroke-linejoin="round"></path>
								<path d="M17.1406 19.9298V16.7461" stroke="currentColor"
									stroke-width="1.2" stroke-linecap="round"
									stroke-linejoin="round"></path>
								<path d="M15.5312 18.3439H18.7149" stroke="currentColor"
									stroke-width="1.2" stroke-linecap="round"
									stroke-linejoin="round"></path></svg>
							<p id="판매하기">판매하기</p></a></li>
					<li class="relative flex flex-1 pl-3"><button
							class="flex items-center justify-center [&amp;>p]:ml-1">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								fill="none" size="24">
								<path stroke="#141313" stroke-linecap="round"
									stroke-linejoin="round" stroke-width="1.5"
									d="M16.775 7.716a3.619 3.619 0 1 1-7.238.005 3.619 3.619 0 0 1 7.238-.005M13.15 13.371c-4.026 0-7.298 3.184-7.4 7.145h14.8c-.102-3.961-3.374-7.145-7.4-7.145"></path></svg>
							<p>마이</p>
						</button></li>
				</ul>
			</div>
		</div>

		<table class="hidden lg:table filterTable">
			<tbody>
				<tr>
					<td style="font-size: 20px; font-weight: bold;">카테고리</td>
					<td>
						<div class="flex items-center w-full chawkbazarBreadcrumb">
							<span style="font-size: 20px; font-weight: bold;">${TName}</span>
							&gt; <span style="font-size: 20px; font-weight: bold;">
								${MName}</span>
						</div>
					</td>
				</tr>
				<tr>
					<td style="font-size: 20px; font-weight: bold;">가격</td>
					<td class="price-filter" style="text-align: left">
						<div class="price-container">
							<div class="minPrice-box">
								<input type="text" id="minPrice"
									class="minPrice-input w-[152px] border rounded border-jnGray-200 py-[10px] px-4 text-sm font-medium"
									placeholder="최소 금액" data-idx="0" name="minPrice"
									value="${min }"
									oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')">
								<div id="minMessage" style="color: red; font-size: 12px"></div>
							</div>
							<span class="mx-[6px]"><svg
									xmlns="http://www.w3.org/2000/svg" width="10" height="4"
									fill="none" class="inline">
                                  <path fill="#5A616B"
										d="M7.895.628 9.297.62q0 .651-.182 1.205-.182.545-.515.947-.326.401-.788.628-.454.22-1 .22-.636 0-1.129-.25-.484-.258-1.045-.773a3.5 3.5 0 0 0-.652-.507 1.25 1.25 0 0 0-.651-.182.94.94 0 0 0-.584.182 1.14 1.14 0 0 0-.378.5 2 2 0 0 0-.137.757H.796q0-.659.183-1.197.18-.545.507-.931.333-.395.788-.606a2.3 2.3 0 0 1 1-.213q.636 0 1.144.266.516.265 1.046.757.363.349.659.523.295.174.628.174a1 1 0 0 0 .599-.19q.257-.196.401-.537a1.95 1.95 0 0 0 .144-.765"></path>
                                  </svg></span>
							<div class="maxPrice-box">
								<input type="text" id="maxPrice"
									class="maxPrice-input w-[152px] border rounded border-jnGray-200 py-[10px] px-4 text-sm font-medium"
									placeholder="최대 금액" data-idx="1" name="maxPrice"
									value="${max }"
									oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')">
								<div id="maxMessage" style="color: red; font-size: 12px"></div>
							</div>
							<button type="submit"
								class="price-button w-full mt-3 lg:mt-0 lg:w-auto bg-black py-[10px] px-4 m-0 lg:mx-2 rounded text-sm font-medium text-white"
								style="background-color: black;">적용</button>
						</div>
					</td>
				</tr>
				<tr>
					<td style="font-size: 20px; font-weight: bold;">주소</td>
					<td class="price-filter" style="text-align: left"><input
						type="text"
						class="place-input w-[152px] border rounded border-jnGray-200 py-[10px] px-4 text-sm font-medium"
						placeholder="장소를 입력하세요" data-idx="0" name="place"
						value="${place }" autocomplete="off">
						<button
							class="w-full mt-3 lg:mt-0 lg:w-auto bg-jnBlack py-[10px] px-4 m-0 lg:mx-2 rounded text-sm font-medium text-white"
							style="background-color: black">적용</button></td>
				</tr>
				<tr>
					<td style="font-size: 20px; font-weight: bold;">옵션</td>
					<td>
						<ul class="flex undefined">
							<li class="mr-5">
								<div class="state-option">
									<div class="checkbox-group">
										<label for="saleYn" class="checkbox-label"> <span
											class="checkbox-text">예약 중 상품 포함</span>
										</label> <input id="saleYn" name="apple" type="checkbox"
											<c:if test="${pm.cri.apple == 'yes' }">checked</c:if>
											value="yes">
									</div>
									<div class="checkbox-group">
										<label for="saleZn" class="checkbox-label"> <span
											class="checkbox-text">판매완료 상품 포함</span>
										</label> <input id="saleZn" name="banana" type="checkbox"
											<c:if test="${pm.cri.banana == 'yes' }">checked</c:if>
											value="yes">
									</div>
								</div>
							</li>
						</ul>
					</td>
				</tr>
			</tbody>
		</table>
		<br> <br>


		<div class="product-price-container">
			<h4 class="product-price-title">현재 페이지의 상품 가격을 비교해봤어요</h4>
			<div
				class="flex flex-col lg:bg-jnGray-100 overflow-hidden lg:flex-row lg:rounded-lg">
				<div
					class="product-price-item relative flex flex-1 justify-between items-center py-6 px-6 lg:px-12 lg:py-6 !mt-0 mb-2 rounded-lg lg:mb-0 bg-jnGray-100 lg:bg-none before:-left-0.5 :before:block before:absolute before:w-[1px] before:h-8 before:bg-jnGray-300 before:content-none"
					aria-labelledby="product-item-price-title-1" tabindex="0">
					<span id="product-item-price-title-1"
						class="font-medium text-sm lg:text-lg text-jnGray-800">평균
						가격</span> <span tabindex="0"
						class="product-price font-bold text-lg lg:text-2xl text-jnGray-800">${avgPrice }</span>
				</div>
				<div
					class="product-price-item relative flex flex-1 justify-between items-center py-6 px-6 lg:px-12 lg:py-6 !mt-0 mb-2 rounded-lg lg:mb-0 bg-jnGray-100 lg:bg-none before:-left-0.5 :before:block before:absolute before:w-[1px] before:h-8 before:bg-jnGray-300"
					aria-labelledby="product-item-price-title-2" tabindex="0">
					<span id="product-item-price-title-2"
						class="font-medium text-sm lg:text-lg text-jnGray-800">가장
						높은 가격</span> <span tabindex="0"
						class="product-price font-bold text-lg lg:text-2xl text-jnGray-800">${maxPrice }</span>
				</div>
				<div
					class="product-price-item relative flex flex-1 justify-between items-center py-6 px-6 lg:px-12 lg:py-6 !mt-0 mb-2 rounded-lg lg:mb-0 bg-jnGray-100 lg:bg-none before:-left-0.5 :before:block before:absolute before:w-[1px] before:h-8 before:bg-jnGray-300"
					aria-labelledby="product-item-price-title-3" tabindex="0">
					<span id="product-item-price-title-3"
						class="font-medium text-sm lg:text-lg text-jnGray-800">가장
						낮은 가격</span> <span tabindex="0"
						class="product-price font-bold text-lg lg:text-2xl text-jnGray-800">${minPrice }</span>
				</div>
			</div>
		</div>

		<div class="mt-3">
			<p class="list-size"></p>
			<ul class="float-right" style="width: 50%">
				<li><button id="pr_num"
						class="float-left order-list-item <c:if test="${pm.cri.order == 'pr_num' }">bg-info</c:if>">최신순</button></li>
				<li><button id="pr_view"
						class="float-left order-list-item <c:if test="${pm.cri.order == 'pr_view' }">bg-info</c:if>">조회수순</button></li>
				<li><button id="pr_basket"
						class="float-left order-list-item <c:if test="${pm.cri.order == 'pr_basket' }">bg-info</c:if>">찜순</button></li>
				<li><button id="asc"
						class="float-left order-list-item <c:if test="${pm.cri.order == 'asc' }">bg-info</c:if>">낮은가격순</button></li>
				<li><button id="desc"
						class="float-left order-list-item <c:if test="${pm.cri.order == 'desc' }">bg-info</c:if>">높은가격순</button></li>
			</ul>
		</div>


		<h1>상품 목록</h1>
		<div class="product-list">
			<c:forEach var="pro" items="${pList}" varStatus="loop">
				<a href="<c:url value="/product/detail?pNum=${pro.pr_num}"/>">
					<div class="product-container">
						<!-- 이미지 추가 -->
						<div class="product-image">
							<c:if test="${pro.fileList.size() >=1 }">
								<img
									src="<c:url value='/download${pro.fileList.get(0).fi_name}'/>"
									alt="${pro.pr_name}">
							</c:if>
						</div>
						<div class="product-box">
							<h5 class="product-name">${pro.pr_name}</h5>
							<p class="price">
								<c:choose>
									<c:when test="${pro.pr_price == 0}">
										<span style="font-weight: bold; font-size: 18px;">무료
											나눔🧡</span>
									</c:when>
									<c:when test="${pro.pr_price < 0}">
										<span
											style="font-size: 15px; color: #808080; font-weight: bold;">가격
											제안</span>
									</c:when>
									<c:otherwise>
										<span style="font-weight: bold; font-size: 20px;">${pro.price}</span>
									</c:otherwise>
								</c:choose>
							</p>
							<p class="state">
								<c:choose>
									<c:when test="${pro.pr_ps_state eq '판매완료'}">
										<svg width="50" height="30" viewBox="0 0 40 20"
											xmlns="http://www.w3.org/2000/svg">
                                    <rect x="0" y="0" width="40"
												height="20" rx="4" fill="#708090"></rect>
                                    <text x="50%" y="50%"
												alignment-baseline="middle" text-anchor="middle"
												fill="white" font-size="10">판매완료</text>
                                </svg>
									</c:when>
									<c:when test="${pro.pr_ps_state eq '예약중'}">
										<svg width="50" height="30" viewBox="0 0 40 20"
											xmlns="http://www.w3.org/2000/svg">
                                    <rect x="0" y="0" width="40"
												height="20" rx="4" fill="#0DCC5A"></rect>
                                    <text x="50%" y="50%"
												alignment-baseline="middle" text-anchor="middle"
												fill="white" font-size="12">예약중</text>
                                </svg>
									</c:when>
								</c:choose>
							</p>
							<span class="separator"></span>
							<p class="place">${pro.pr_place}</p>
							<span class="separator"></span>
							<p class="date">${pro.time}</p>
						</div>
					</div>
				</a>
				<c:if test="${loop.index % 5 == 4}">
					<!-- 한 줄에 5개의 상품이 들어가면 줄 바꿈 -->
					<br>
				</c:if>
			</c:forEach>
		</div>


		<!-- 페이지네이션 -->

		<ul class="pagination justify-content-center">
			<c:if test="${pm.prev}">
				<li class="page-item"><c:url var="url" value="/product/list">
						<c:param name="page" value="${pm.startPage - 1}" />
						<c:param name="mNum" value="${num}" />
						<c:param name="mName" value="${MName}" />
						<c:param name="tName" value="${TName}" />
						<c:param name="search" value="${pm.cri.search}" />
						<c:param name="minPrice" value="${pm.cri.minPrice}" />
						<c:param name="maxPrice" value="${pm.cri.maxPrice}" />
						<c:param name="order" value="${pm.cri.order}" />
						<c:param name="place" value="${pm.cri.place }" />
						<c:param name="apple" value="${pm.cri.apple }" />
						<c:param name="banana" value="${pm.cri.banana }" />
					</c:url> <a class="page-link" href="${url}">이전</a></li>
			</c:if>
			<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
				<c:set var="active" value="${pm.cri.page == i ?'active':'' }" />
				<li class="page-item ${active}"><c:url var="url"
						value="/product/list">
						<c:param name="page" value="${i}" />
						<c:param name="mNum" value="${num}" />
						<c:param name="mName" value="${MName}" />
						<c:param name="tName" value="${TName}" />
						<c:param name="search" value="${pm.cri.search}" />
						<c:param name="minPrice" value="${pm.cri.minPrice}" />
						<c:param name="maxPrice" value="${pm.cri.maxPrice}" />
						<c:param name="order" value="${pm.cri.order}" />
						<c:param name="place" value="${pm.cri.place }" />
						<c:param name="apple" value="${pm.cri.apple }" />
						<c:param name="banana" value="${pm.cri.banana }" />
					</c:url> <a class="page-link" href="${url}">${i}</a></li>
			</c:forEach>
			<c:if test="${pm.next}">
				<li class="page-item"><c:url var="url" value="/product/list">
						<c:param name="page" value="${pm.endPage + 1}" />
						<c:param name="mNum" value="${num}" />
						<c:param name="mName" value="${MName}" />
						<c:param name="tName" value="${TName}" />
						<c:param name="search" value="${pm.cri.search}" />
						<c:param name="minPrice" value="${pm.cri.minPrice}" />
						<c:param name="maxPrice" value="${pm.cri.maxPrice}" />
						<c:param name="order" value="${pm.cri.order}" />
						<c:param name="place" value="${pm.cri.place }" />
						<c:param name="apple" value="${pm.cri.apple }" />
						<c:param name="banana" value="${pm.cri.banana }" />
					</c:url> <a class="page-link" href="${url}">다음</a></li>
			</c:if>
		</ul>
	</div>

	<script type="text/javascript">


<!--가격 적용 버튼 클릭시-->
const priceButton = document.querySelector('.price-button');

priceButton.addEventListener('click', function() {
	let minPrice = $(".minPrice-input").val();
	let maxPrice = $(".maxPrice-input").val(); 
	if(minPrice=="" || minPrice == null || maxPrice =="" || maxPrice == null){
		return;
	}
	let minPrice1 = minPrice.replace(/,/g, '');
	minPrice = Number(minPrice1);
	let maxPrice1 = maxPrice.replace(/,/g, '');
	maxPrice = Number(maxPrice1);
	let gap = maxPrice-minPrice;
	if(gap <0 || maxPrice >1000000000 ){
		return;
	}
	sendPrice(minPrice, maxPrice);
});


function sendPrice(minPrice, maxPrice){
	let apple = document.getElementById("saleYn").checked ? "yes" : "no";
	let banana = document.getElementById("saleZn").checked ? "yes" : "no";
	let mNum = '${num}';
	let place = $(".place-input").val();
	let tName='${TName}';
	let mName = '${MName}';
	let order;
	let search = $(".search-input").val();

	// 클래스가 "bg-info"를 가지고 있는 요소를 찾습니다.
	let activeButton = document.querySelector(".order-list-item.bg-info");

	// activeButton이 존재하는 경우에만 id를 order 변수에 할당합니다.
	if (activeButton) {
	    order = activeButton.id; 
	}	
	
    var data = {
        "apple" : apple,
        "banana" : banana,
        "mNum" : mNum,
        "search" : search,
        "place" : place,
        "minPrice" : minPrice,
        "maxPrice" : maxPrice,
        "order"  : order,
        "tName" : tName,
		"mName" : mName
    };

    // AJAX 요청
    $.ajax({
    	async : false,
        type: "get",
        url: '<c:url value="/product/list2"/>', 
        data: data, // 보낼 데이터 입력
        dataType : "json",
        success: function(data) {
            // 성공적으로 응답을 받았을 때 실행할 코드
            addMethod(data.pList);
            addPrice(data.avgPrice, data.maxPrice, data.minPrice);
            addPagination(data.pm,data.num,data.TName, data.MName, data.order, data.apple, data.banana, data.place, data.search, data.min, data.max );
        },
        error: function(xhr, status, error) {
            // 요청이 실패했을 때 실행할 코드
            console.error("Error sending data:", error);
        }
    });
}

<!--최소 금액 입력시-->
const minInput = document.querySelector('#minPrice');
minInput.addEventListener('keyup', function(e) {
  let value = e.target.value;
  // 입력 값이 없으면 빈문자열로 설정
  if (value === "" || value === null || isNaN(Number(value))) {
    value = "";
  } else {
    value = Number(value.replaceAll(',', ''));
  }
  const formatValue = value.toLocaleString('ko-KR');
  minInput.value = formatValue; 
});

<!--최대 금액 입력시-->
const maxInput = document.querySelector('#maxPrice');
maxInput.addEventListener('keyup', function(e) {
  let value = e.target.value;
  // 입력 값이 없으면 빈문자열로 설정
  if (value === "" || value === null || isNaN(Number(value))) {
    value = "";
  } else {
    value = Number(value.replaceAll(',', ''));
  }
  const formatValue = value.toLocaleString('ko-KR');
  maxInput.value = formatValue; 
});
 
<!-- 검색창 입력시 -->
$(".search-input").change(function(){
	var search = $(this).val().trim();
	sendSearch(search);
});


// 검색창에 입력할 때 실행되는 함수
function sendSearch(search) {
    let apple = document.getElementById("saleYn").checked ? "yes" : "no";
	let banana = document.getElementById("saleZn").checked ? "yes" : "no";
	let mNum = '${num}';
	let place = $(".place-input").val();
	let minPrice = $(".minPrice-input").val();
	let maxPrice = $(".maxPrice-input").val(); 
	let tName='${TName}';
	let mName = '${MName}';
	let order;

	// 클래스가 "bg-info"를 가지고 있는 요소를 찾습니다.
	let activeButton = document.querySelector(".order-list-item.bg-info");

	// activeButton이 존재하는 경우에만 id를 order 변수에 할당합니다.
	if (activeButton) {
	    order = activeButton.id;
	}
	
	if(minPrice=="" || minPrice == null){
		minPrice =-100;
	}else if(minPrice=="0"){
		minPrice=0;
	}else{
		let minPrice1 = minPrice.replace(/,/g, '');
		minPrice = Number(minPrice1);	
	}
	
	if(maxPrice=="" || maxPrice == null){
		maxPrice =1000000000;
	}else if(maxPrice=="0"){
		maxPrice=0;
	}else{
		let maxPrice1 = maxPrice.replace(/,/g, '');
		maxPrice = Number(maxPrice1);	
	}
	
    var data = {
        "apple" : apple,
        "banana" : banana,
        "mNum" : mNum,
        "search" : search,
        "place" : place,
        "minPrice" : minPrice,
        "maxPrice" : maxPrice,
        "order"  : order,
        "tName" : tName,
		"mName" : mName
    };

    // AJAX 요청
    $.ajax({
    	async : false,
        type: "get",
        url: '<c:url value="/product/list2"/>', 
        data: data, // 보낼 데이터 입력
        dataType : "json",
        success: function(data) {
            // 성공적으로 응답을 받았을 때 실행할 코드
            addMethod(data.pList);
            addPrice(data.avgPrice, data.maxPrice, data.minPrice);
            addPagination(data.pm,data.num,data.TName, data.MName, data.order, data.apple, data.banana, data.place, data.search, data.min, data.max );
        },
        error: function(xhr, status, error) {
            // 요청이 실패했을 때 실행할 코드
            console.error("Error sending data:", error);
        }
    });
} 


<!-- 주소 입력시 -->
$(".place-input").change(function(){
	var place = $(this).val().trim();
	sendPlace(place);
});

// 거래 희망 장소 입력할 때 실행되는 함수
function sendPlace(place) {
    let apple = document.getElementById("saleYn").checked ? "yes" : "no";
	let banana = document.getElementById("saleZn").checked ? "yes" : "no";
	let mNum = '${num}';
	let minPrice = $(".minPrice-input").val();
	let maxPrice = $(".maxPrice-input").val();
	let tName='${TName}';
	let mName = '${MName}';
	let search = $(".search-input").val();
	let order;

	// 클래스가 "bg-info"를 가지고 있는 요소를 찾습니다.
	let activeButton = document.querySelector(".order-list-item.bg-info");

	// activeButton이 존재하는 경우에만 id를 order 변수에 할당합니다.
	if (activeButton) {
	    order = activeButton.id;
	}
	
	if(minPrice=="" || minPrice == null){
		minPrice =-100;
	}else if(minPrice=="0"){
		minPrice=0;
	}else{
		let minPrice1 = minPrice.replace(/,/g, '');
		minPrice = Number(minPrice1);	
	}
	
	if(maxPrice=="" || maxPrice == null){
		maxPrice =1000000000;
	}else if(maxPrice=="0"){
		maxPrice=0;
	}else{
		let maxPrice1 = maxPrice.replace(/,/g, '');
		maxPrice = Number(maxPrice1);	
	}
	
    var data = {
        "apple" : apple,
        "banana" : banana,
        "mNum" : mNum,
        "search" : search,
        "place" : place,
        "minPrice" : minPrice,
        "maxPrice" : maxPrice,
        "order"  : order,
        "tName" : tName,
		"mName" : mName
    };

    // AJAX 요청
    $.ajax({
    	async : false,
        type: "get",
        url: '<c:url value="/product/list2"/>', 
        data: data, // 보낼 데이터 입력
        dataType : "json",
        success: function(data) {
            // 성공적으로 응답을 받았을 때 실행할 코드
            addMethod(data.pList);
            addPrice(data.avgPrice, data.maxPrice, data.minPrice);
            addPagination(data.pm,data.num,data.TName, data.MName, data.order, data.apple, data.banana, data.place, data.search ,data.min, data.max );
        },
        error: function(xhr, status, error) {
            // 요청이 실패했을 때 실행할 코드
            console.error("Error sending data:", error);
        }
    });
}



	$(".order-list-item").click(function(){
		$(".order-list-item").removeClass("bg-info");
	})
	
	$("#pr_num").click(function(){
		$("#pr_num").addClass("bg-info");
		clickOrder("pr_num");
		
	})
	
	$("#pr_view").click(function(){
		$("#pr_view").addClass("bg-info");
		clickOrder("pr_view");
		
	})
	
	$("#pr_basket").click(function(){
		$("#pr_basket").addClass("bg-info");
		clickOrder("pr_basket");
		
	})
	
	$("#asc").click(function(){
		$("#asc").addClass("bg-info");
		clickOrder("asc");
		
	})
	
	$("#desc").click(function(){
		$("#desc").addClass("bg-info");
		clickOrder("desc");
		
	})
	
	function clickOrder(str1) {
		let apple = document.getElementById("saleYn").checked ? "yes" : "no";
		let banana = document.getElementById("saleZn").checked ? "yes" : "no";
		let mNum = '${num}';
		let search = $(".search-input").val();
		let place = $(".place-input").val();
		let minPrice = $(".minPrice-input").val();
		let maxPrice = $(".maxPrice-input").val();
		let page = '${pm.cri.page}';
		let tName='${TName}';
		let mName = '${MName}';
				
		if(minPrice=="" || minPrice == null){
			minPrice =-100;
		}else if(minPrice=="0"){
			minPrice=0;
		}else{
			let minPrice1 = minPrice.replace(/,/g, '');
			minPrice = Number(minPrice1);	
		}
		
		if(maxPrice=="" || maxPrice == null){
			maxPrice =1000000000;
		}else if(maxPrice=="0"){
			maxPrice=0;
		}else{
			let maxPrice1 = maxPrice.replace(/,/g, '');
			maxPrice = Number(maxPrice1);	
		}
		let obj = { 
			"order" : str1,
			"apple" : apple,
			"banana" : banana,
			"mNum" : mNum,
			"search" : search,
			"place" : place,
			"minPrice" : minPrice,
			"maxPrice" : maxPrice,
			"page" : page,
			"tName" : tName,
			"mName" : mName
		};
		console.log(obj);
		$.ajax({
			async : false,
			url : '<c:url value="/product/list2"/>', 
			type : 'get',
			data : obj,
			dataType : "json", 
			success : function (data){
				addMethod(data.pList);
				addPagination(data.pm, data.num, data.TName, data.MName, data.order, data.apple, data.banana, data.place, data.search, data.min, data.max);
			}, 
			error : function(jqXHR, textStatus, errorThrown){
				console.log(jqXHR.responseText)
			}
		});
	}
	
	function addMethod(list) {
		console.log(list)
		let str='';
		for(pro of list) {
			str += 
				`
				<a href="<c:url value="/product/detail?pNum=\${pro.pr_num}"/>">
	            <div class="product-container"> 
	                <!-- 이미지 추가 -->
	                <div class="product-image">
	            `
	            if(pro.fileList.length >= 1){
	                  str += `<img src="<c:url value='/download\${pro.fileList[0].fi_name}'/>" alt="${pro.pr_name}">`
	            }
	            str += `
	                </div>
	                <div class="product-box">
	                    <h5 class="product-name">\${pro.pr_name}</h5>
	                    <p class="price">
	              	`;
	            if(pro.pr_price == 0){
	            	str += `<span style="font-weight: bold; font-size: 18px;">무료 나눔🧡</span>`
	            }else if(pro.pr_price < 0){
	            	str += `<span style="font-size: 15px; color: #808080; font-weight: bold;">가격 제안</span>`
	            }else{
	            	str += `<span style="font-weight: bold; font-size: 20px;">\${pro.price }</span>`
	            }
	            
	                str += `
	                    </p>
	                    <p class="state">
	                    `;
	                    
	            if(pro.pr_ps_state === '판매완료'){
	            	str += `<svg width="50" height="30" viewBox="0 0 40 20" xmlns="http://www.w3.org/2000/svg">
                             <rect x="0" y="0" width="40" height="20" rx="4" fill="#708090"></rect>
                             <text x="50%" y="50%" alignment-baseline="middle" text-anchor="middle" fill="white" font-size="10">판매완료</text>`
                            
                           
	            }else if(pro.pr_ps_state === '예약중'){
	            	str += `<svg width="50" height="30" viewBox="0 0 40 20" xmlns="http://www.w3.org/2000/svg">
                             <rect x="0" y="0" width="40" height="20" rx="4" fill="#0DCC5A"></rect>
                             <text x="50%" y="50%" alignment-baseline="middle" text-anchor="middle" fill="white" font-size="12">예약중</text>`                                       
	            }
	            
	               str += `
	                    </svg>
	                    </p>
	                    <span class="separator"></span>
	                    <p class="place">\${pro.pr_place}</p>
	                    <span class="separator"></span>
	                    <p class="date">\${pro.time}</p>
	                </div>
	            </div>
	        </a>
	        `
	       /*  <c:if test="${loop.index % 5 == 4}"> <!-- 한 줄에 5개의 상품이 들어가면 줄 바꿈 -->
	            <br>
	        </c:if> */
				
		}
		$(".product-list").html(str);
	}
	
	function addPagination(pm,num,TName, MName, order, apple, banana, place, search, min, max){
		let str = '';
		if(pm.prev == true){
			str += `<li class="page-item">
			<a class="page-link" href="<c:url value="/product/list3?tName=\${TName}&mName=\${MName}&page=\${pm.cri.startPage-1}&mNum=\${num}&search=\${search}&minPrice=\${min}&maxPrice=\${max}&order=\${order}&place=\${place}&apple=\${apple}&banana=\${banana}"/>">이전</a>
		</li>`;
		}
		 for(let i=pm.startPage; i<=pm.endPage; i++){
			 var active = pm.cri.page == i ? 'active' : '';
			str +=`<li class="page-item \${active}">
				<a class="page-link" href="<c:url value="/product/list3?tName=\${TName}&mName=\${MName}&page=\${i}&mNum=\${num}&search=\${search}&minPrice=\${min}&maxPrice=\${max}&order=\${order}&place=\${place}&apple=\${apple}&banana=\${banana}"/>">\${i}</a>
		     </li>`;
		 }
		 
		 if(pm.next == true){
				str += `<li class="page-item">
				<a class="page-link" href="<c:url value="/product/list3?tName=\${TName}&mName=\${MName}&page=\${pm.endPage+1}&mNum=\${num}&search=\${search}&minPrice=\${min}&maxPrice=\${max}&order=\${order}&place=\${place}&apple=\${apple}&banana=\${banana}"/>">다음</a>
			</li>`;
			}		 
		 $(".pagination").html(str);
	}
	

$(".state-option").change(function(){
	sendCheckboxData();
}); 
//체크박스가 변경될 때마다 실행되는 함수
function sendCheckboxData() {
    // 체크박스의 상태를 확인하여 데이터 객체에 저장
    let apple = document.getElementById("saleYn").checked ? "yes" : "no";
	let banana = document.getElementById("saleZn").checked ? "yes" : "no";
	let mNum = '${num}';
	let search = $(".search-input").val();
	let place = $(".place-input").val();
	let minPrice = $(".minPrice-input").val();
	let maxPrice = $(".maxPrice-input").val();
	let page = '${pm.cri.page}';
	let tName='${TName}';
	let mName = '${MName}';
	let order;

	// 클래스가 "bg-info"를 가지고 있는 요소를 찾습니다.
	let activeButton = document.querySelector(".order-list-item.bg-info");

	// activeButton이 존재하는 경우에만 id를 order 변수에 할당합니다.
	if (activeButton) {
	    order = activeButton.id;
	}
	
	if(minPrice=="" || minPrice == null){
		minPrice =-100;
	}else if(minPrice=="0"){
		minPrice=0;
	}else{
		let minPrice1 = minPrice.replace(/,/g, '');
		minPrice = Number(minPrice1);	
	}
	
	if(maxPrice=="" || maxPrice == null){
		maxPrice =1000000000;
	}else if(maxPrice=="0"){
		maxPrice=0;
	}else{
		let maxPrice1 = maxPrice.replace(/,/g, '');
		maxPrice = Number(maxPrice1);	
	}

    var data = {
        "apple" : apple,
        "banana" : banana,
        "mNum" : mNum,
        "search" : search,
        "place" : place,
        "order" : order,
        "minPrice" : minPrice,
        "maxPrice" : maxPrice,
        "order"  : order,
        "page" : page,
        "tName" : tName,
		"mName" : mName
    };

    // AJAX 요청
    $.ajax({
    	async : false,
        type: "get",
        url: '<c:url value="/product/list2"/>', 
        data: data, // 보낼 데이터 입력
        dataType : "json",
        success: function(response) {
            // 성공적으로 응답을 받았을 때 실행할 코드
            addMethod(response.pList);
            addPrice(response.avgPrice, response.maxPrice, response.minPrice);
            addPagination(response.pm,response.num,response.TName, response.MName, response.order, response.apple, response.banana, response.place, response.search, response.min, response.max);
        },
        error: function(xhr, status, error) {
            // 요청이 실패했을 때 실행할 코드
            console.error("Error sending data:", error);
        }
    });
} 

function addPrice(avgPrice, maxPrice, minPrice){
	
	let str='';
	str += `
    <h4 class="product-price-title">현재 페이지의 상품 가격을 비교해봤어요</h4>
	<div class="flex flex-col lg:bg-jnGray-100 overflow-hidden lg:flex-row lg:rounded-lg">
    <div class="product-price-item relative flex flex-1 justify-between items-center py-6 px-6 lg:px-12 lg:py-6 !mt-0 mb-2 rounded-lg lg:mb-0 bg-jnGray-100 lg:bg-none before:-left-0.5 :before:block before:absolute before:w-[1px] before:h-8 before:bg-jnGray-300 before:content-none" aria-labelledby="product-item-price-title-1" tabindex="0">
        <span id="product-item-price-title-1" class="font-medium text-sm lg:text-lg text-jnGray-800">평균 가격</span>
        <span tabindex="0" class="product-price font-bold text-lg lg:text-2xl text-jnGray-800">\${avgPrice }</span>
    </div>
    <div class="product-price-item relative flex flex-1 justify-between items-center py-6 px-6 lg:px-12 lg:py-6 !mt-0 mb-2 rounded-lg lg:mb-0 bg-jnGray-100 lg:bg-none before:-left-0.5 :before:block before:absolute before:w-[1px] before:h-8 before:bg-jnGray-300" aria-labelledby="product-item-price-title-2" tabindex="0">
        <span id="product-item-price-title-2" class="font-medium text-sm lg:text-lg text-jnGray-800">가장 높은 가격</span>
        <span tabindex="0" class="product-price font-bold text-lg lg:text-2xl text-jnGray-800">\${maxPrice }</span>
    </div>
    <div class="product-price-item relative flex flex-1 justify-between items-center py-6 px-6 lg:px-12 lg:py-6 !mt-0 mb-2 rounded-lg lg:mb-0 bg-jnGray-100 lg:bg-none before:-left-0.5 :before:block before:absolute before:w-[1px] before:h-8 before:bg-jnGray-300" aria-labelledby="product-item-price-title-3" tabindex="0">
        <span id="product-item-price-title-3" class="font-medium text-sm lg:text-lg text-jnGray-800">가장 낮은 가격</span>
        <span tabindex="0" class="product-price font-bold text-lg lg:text-2xl text-jnGray-800">\${minPrice }</span>
    </div>
  </div>`
  
	$(".product-price-container").html(str);	
}

</script>

	<script type="text/javascript">
document.getElementById("price").addEventListener("submit", function(event) {
    var minPrice = document.getElementById("minPrice");
    var maxPrice = document.getElementById("maxPrice");
    // 최소 금액을 입력하지 않은 경우
    if (!minPrice.value.trim()) {
        event.preventDefault(); // 폼 제출을 중단합니다.
        document.getElementById("minMessage").innerText = "최소 금액을 입력하세요";
    }
    // 최대 금액을 입력하지 않은 경우
    if (!maxPrice.value.trim()) {
        event.preventDefault(); // 폼 제출을 중단합니다.
        document.getElementById("maxMessage").innerText = "최대 금액을 입력하세요";
    }
    
});
</script>

</body>
</html>