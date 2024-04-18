<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<style>
.xl\:h-24 {
    height: 6rem;
}
@media (min-width: 1024px)
.lg\:px-8 {
    padding-left: 2rem;
    padding-right: 2rem;
}
@media (min-width: 1024px)
.lg\:h-20 {
    height: 5rem;
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
@media (min-width: 1280px)
.xl\:h-24 {
    height: 6rem;
}
@media (min-width: 1024px)
.lg\:px-8 {
    padding-left: 2rem;
    padding-right: 2rem;
}
@media (min-width: 1024px)
.lg\:h-20 {
    height: 5rem;
}
*, :after, :before {
    --tw-border-spacing-x: 0;
    --tw-border-spacing-y: 0;
    --tw-translate-x: 0;
    --tw-translate-y: 0;
    --tw-rotate: 0;
    --tw-skew-x: 0;
    --tw-skew-y: 0;
    --tw-scale-x: 1;
    --tw-scale-y: 1;
    --tw-pan-x: ;
    --tw-pan-y: ;
    --tw-pinch-zoom: ;
    --tw-scroll-snap-strictness: proximity;
    --tw-ordinal: ;
    --tw-slashed-zero: ;
    --tw-numeric-figure: ;
    --tw-numeric-spacing: ;
    --tw-numeric-fraction: ;
    --tw-ring-inset: ;
    --tw-ring-offset-width: 0px;
    --tw-ring-offset-color: #fff;
    --tw-ring-color: rgba(59, 130, 246, .5);
    --tw-ring-offset-shadow: 0 0 #0000;
    --tw-ring-shadow: 0 0 #0000;
    --tw-shadow: 0 0 #0000;
    --tw-shadow-colored: 0 0 #0000;
    --tw-blur: ;
    --tw-brightness: ;
    --tw-contrast: ;
    --tw-grayscale: ;
    --tw-hue-rotate: ;
    --tw-invert: ;
    --tw-saturate: ;
    --tw-sepia: ;
    --tw-drop-shadow: ;
    --tw-backdrop-blur: ;
    --tw-backdrop-brightness: ;
    --tw-backdrop-contrast: ;
    --tw-backdrop-grayscale: ;
    --tw-backdrop-hue-rotate: ;
    --tw-backdrop-invert: ;
    --tw-backdrop-opacity: ;
    --tw-backdrop-saturate: ;
    --tw-backdrop-sepia: ;
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
.text-gray-700 {
    --tw-text-opacity: 1;
    color: rgb(41 41 41 / var(--tw-text-opacity));
}
.bg-white {
    --tw-bg-opacity: 1;
    background-color: rgb(255 255 255 / var(--tw-bg-opacity));
}
.border-jnGray-300 {
    --tw-border-opacity: 1;
    border-color: rgb(218 222 229 / var(--tw-border-opacity));
}
body, html {
    font-family: Pretendard Variable, sans-serif;
    --tw-text-opacity: 1;
    color: rgb(90 90 90 / var(--tw-text-opacity));
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}
body {
    margin: 0;
    line-height: inherit;
}
:root {
    --header-height: 64px;
    --sm-header-height: 80px;
    --lg-header-height: 204px;
    --xl-header-height: 220px;
}
:root {
    --toastify-color-light: #fff;
    --toastify-color-dark: #121212;
    --toastify-color-info: #3498db;
    --toastify-color-success: #07bc0c;
    --toastify-color-warning: #f1c40f;
    --toastify-color-error: #e74c3c;
    --toastify-color-transparent: hsla(0, 0%, 100%, .7);
    --toastify-icon-color-info: var(--toastify-color-info);
    --toastify-icon-color-success: var(--toastify-color-success);
    --toastify-icon-color-warning: var(--toastify-color-warning);
    --toastify-icon-color-error: var(--toastify-color-error);
    --toastify-toast-width: 320px;
    --toastify-toast-background: #fff;
    --toastify-toast-min-height: 64px;
    --toastify-toast-max-height: 800px;
    --toastify-font-family: sans-serif;
    --toastify-z-index: 9999;
    --toastify-text-color-light: #757575;
    --toastify-text-color-dark: #fff;
    --toastify-text-color-info: #fff;
    --toastify-text-color-success: #fff;
    --toastify-text-color-warning: #fff;
    --toastify-text-color-error: #fff;
    --toastify-spinner-color: #616161;
    --toastify-spinner-color-empty-area: #e0e0e0;
    --toastify-color-progress-light: linear-gradient(90deg, #4cd964, #5ac8fa, #007aff, #34aadc, #5856d6, #ff2d55);
    --toastify-color-progress-dark: #bb86fc;
    --toastify-color-progress-info: var(--toastify-color-info);
    --toastify-color-progress-success: var(--toastify-color-success);
    --toastify-color-progress-warning: var(--toastify-color-warning);
    --toastify-color-progress-error: var(--toastify-color-error);
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
    font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji;
    font-feature-settings: normal;
}
.before\:bg-\[\#F1F1F1\]:before {
    content: var(--tw-content);
    --tw-bg-opacity: 1;
    background-color: rgb(241 241 241 / var(--tw-bg-opacity));
}
.before\:w-screen:before {
    content: var(--tw-content);
    width: 100vw;
}
.before\:bottom-0:before {
    content: var(--tw-content);
    bottom: 0;
}
.before\:absolute:before {
    content: var(--tw-content);
    position: absolute;
}
*, :after, :before {
    --tw-border-spacing-x: 0;
    --tw-border-spacing-y: 0;
    --tw-translate-x: 0;
    --tw-translate-y: 0;
    --tw-rotate: 0;
    --tw-skew-x: 0;
    --tw-skew-y: 0;
    --tw-scale-x: 1;
    --tw-scale-y: 1;
    --tw-pan-x: ;
    --tw-pan-y: ;
    --tw-pinch-zoom: ;
    --tw-scroll-snap-strictness: proximity;
    --tw-ordinal: ;
    --tw-slashed-zero: ;
    --tw-numeric-figure: ;
    --tw-numeric-spacing: ;
    --tw-numeric-fraction: ;
    --tw-ring-inset: ;
    --tw-ring-offset-width: 0px;
    --tw-ring-offset-color: #fff;
    --tw-ring-color: rgba(59, 130, 246, .5);
    --tw-ring-offset-shadow: 0 0 #0000;
    --tw-ring-shadow: 0 0 #0000;
    --tw-shadow: 0 0 #0000;
    --tw-shadow-colored: 0 0 #0000;
    --tw-blur: ;
    --tw-brightness: ;
    --tw-contrast: ;
    --tw-grayscale: ;
    --tw-hue-rotate: ;
    --tw-invert: ;
    --tw-saturate: ;
    --tw-sepia: ;
    --tw-drop-shadow: ;
    --tw-backdrop-blur: ;
    --tw-backdrop-brightness: ;
    --tw-backdrop-contrast: ;
    --tw-backdrop-grayscale: ;
    --tw-backdrop-hue-rotate: ;
    --tw-backdrop-invert: ;
    --tw-backdrop-opacity: ;
    --tw-backdrop-saturate: ;
    --tw-backdrop-sepia: ;
}
:after, :before {
    --tw-content: "";
}
*, :after, :before {
    box-sizing: border-box;
    border: 0 solid #f9f9f9;
}
*, :after, :before {
    --tw-border-spacing-x: 0;
    --tw-border-spacing-y: 0;
    --tw-translate-x: 0;
    --tw-translate-y: 0;
    --tw-rotate: 0;
    --tw-skew-x: 0;
    --tw-skew-y: 0;
    --tw-scale-x: 1;
    --tw-scale-y: 1;
    --tw-pan-x: ;
    --tw-pan-y: ;
    --tw-pinch-zoom: ;
    --tw-scroll-snap-strictness: proximity;
    --tw-ordinal: ;
    --tw-slashed-zero: ;
    --tw-numeric-figure: ;
    --tw-numeric-spacing: ;
    --tw-numeric-fraction: ;
    --tw-ring-inset: ;
    --tw-ring-offset-width: 0px;
    --tw-ring-offset-color: #fff;
    --tw-ring-color: rgba(59, 130, 246, .5);
    --tw-ring-offset-shadow: 0 0 #0000;
    --tw-ring-shadow: 0 0 #0000;
    --tw-shadow: 0 0 #0000;
    --tw-shadow-colored: 0 0 #0000;
    --tw-blur: ;
    --tw-brightness: ;
    --tw-contrast: ;
    --tw-grayscale: ;
    --tw-hue-rotate: ;
    --tw-invert: ;
    --tw-saturate: ;
    --tw-sepia: ;
    --tw-drop-shadow: ;
    --tw-backdrop-blur: ;
    --tw-backdrop-brightness: ;
    --tw-backdrop-contrast: ;
    --tw-backdrop-grayscale: ;
    --tw-backdrop-hue-rotate: ;
    --tw-backdrop-invert: ;
    --tw-backdrop-opacity: ;
    --tw-backdrop-saturate: ;
    --tw-backdrop-sepia: ;
}
:after, :before {
    --tw-content: "";
}
*, :after, :before {
    box-sizing: border-box;
    border: 0 solid #f9f9f9;
}
::backdrop {
    --tw-border-spacing-x: 0;
    --tw-border-spacing-y: 0;
    --tw-translate-x: 0;
    --tw-translate-y: 0;
    --tw-rotate: 0;
    --tw-skew-x: 0;
    --tw-skew-y: 0;
    --tw-scale-x: 1;
    --tw-scale-y: 1;
    --tw-pan-x: ;
    --tw-pan-y: ;
    --tw-pinch-zoom: ;
    --tw-scroll-snap-strictness: proximity;
    --tw-ordinal: ;
    --tw-slashed-zero: ;
    --tw-numeric-figure: ;
    --tw-numeric-spacing: ;
    --tw-numeric-fraction: ;
    --tw-ring-inset: ;
    --tw-ring-offset-width: 0px;
    --tw-ring-offset-color: #fff;
    --tw-ring-color: rgba(59, 130, 246, .5);
    --tw-ring-offset-shadow: 0 0 #0000;
    --tw-ring-shadow: 0 0 #0000;
    --tw-shadow: 0 0 #0000;
    --tw-shadow-colored: 0 0 #0000;
    --tw-blur: ;
    --tw-brightness: ;
    --tw-contrast: ;
    --tw-grayscale: ;
    --tw-hue-rotate: ;
    --tw-invert: ;
    --tw-saturate: ;
    --tw-sepia: ;
    --tw-drop-shadow: ;
    --tw-backdrop-blur: ;
    --tw-backdrop-brightness: ;
    --tw-backdrop-contrast: ;
    --tw-backdrop-grayscale: ;
    --tw-backdrop-hue-rotate: ;
    --tw-backdrop-invert: ;
    --tw-backdrop-opacity: ;
    --tw-backdrop-saturate: ;
    --tw-backdrop-sepia: ;
}

:not(.scrollbar-show)::-webkit-scrollbar {
    display: none;
}
.relative {
    position: relative;
}
*, :after, :before {
    --tw-border-spacing-x: 0;
    --tw-border-spacing-y: 0;
    --tw-translate-x: 0;
    --tw-translate-y: 0;
    --tw-rotate: 0;
    --tw-skew-x: 0;
    --tw-skew-y: 0;
    --tw-scale-x: 1;
    --tw-scale-y: 1;
    --tw-pan-x: ;
    --tw-pan-y: ;
    --tw-pinch-zoom: ;
    --tw-scroll-snap-strictness: proximity;
    --tw-ordinal: ;
    --tw-slashed-zero: ;
    --tw-numeric-figure: ;
    --tw-numeric-spacing: ;
    --tw-numeric-fraction: ;
    --tw-ring-inset: ;
    --tw-ring-offset-width: 0px;
    --tw-ring-offset-color: #fff;
    --tw-ring-color: rgba(59, 130, 246, .5);
    --tw-ring-offset-shadow: 0 0 #0000;
    --tw-ring-shadow: 0 0 #0000;
    --tw-shadow: 0 0 #0000;
    --tw-shadow-colored: 0 0 #0000;
    --tw-blur: ;
    --tw-brightness: ;
    --tw-contrast: ;
    --tw-grayscale: ;
    --tw-hue-rotate: ;
    --tw-invert: ;
    --tw-saturate: ;
    --tw-sepia: ;
    --tw-drop-shadow: ;
    --tw-backdrop-blur: ;
    --tw-backdrop-brightness: ;
    --tw-backdrop-contrast: ;
    --tw-backdrop-grayscale: ;
    --tw-backdrop-hue-rotate: ;
    --tw-backdrop-invert: ;
    --tw-backdrop-opacity: ;
    --tw-backdrop-saturate: ;
    --tw-backdrop-sepia: ;
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
.bg-white {
    --tw-bg-opacity: 1;
    background-color: rgb(255 255 255 / var(--tw-bg-opacity));
}
body, html {
    font-family: Pretendard Variable, sans-serif;
    --tw-text-opacity: 1;
    color: rgb(90 90 90 / var(--tw-text-opacity));
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}
body {
    margin: 0;
    line-height: inherit;
}
:root {
    --header-height: 64px;
    --sm-header-height: 80px;
    --lg-header-height: 204px;
    --xl-header-height: 220px;
}
:root {
    --toastify-color-light: #fff;
    --toastify-color-dark: #121212;
    --toastify-color-info: #3498db;
    --toastify-color-success: #07bc0c;
    --toastify-color-warning: #f1c40f;
    --toastify-color-error: #e74c3c;
    --toastify-color-transparent: hsla(0, 0%, 100%, .7);
    --toastify-icon-color-info: var(--toastify-color-info);
    --toastify-icon-color-success: var(--toastify-color-success);
    --toastify-icon-color-warning: var(--toastify-color-warning);
    --toastify-icon-color-error: var(--toastify-color-error);
    --toastify-toast-width: 320px;
    --toastify-toast-background: #fff;
    --toastify-toast-min-height: 64px;
    --toastify-toast-max-height: 800px;
    --toastify-font-family: sans-serif;
    --toastify-z-index: 9999;
    --toastify-text-color-light: #757575;
    --toastify-text-color-dark: #fff;
    --toastify-text-color-info: #fff;
    --toastify-text-color-success: #fff;
    --toastify-text-color-warning: #fff;
    --toastify-text-color-error: #fff;
    --toastify-spinner-color: #616161;
    --toastify-spinner-color-empty-area: #e0e0e0;
    --toastify-color-progress-light: linear-gradient(90deg, #4cd964, #5ac8fa, #007aff, #34aadc, #5856d6, #ff2d55);
    --toastify-color-progress-dark: #bb86fc;
    --toastify-color-progress-info: var(--toastify-color-info);
    --toastify-color-progress-success: var(--toastify-color-success);
    --toastify-color-progress-warning: var(--toastify-color-warning);
    --toastify-color-progress-error: var(--toastify-color-error);
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
    font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji;
    font-feature-settings: normal;
}
*, :after, :before {
    --tw-border-spacing-x: 0;
    --tw-border-spacing-y: 0;
    --tw-translate-x: 0;
    --tw-translate-y: 0;
    --tw-rotate: 0;
    --tw-skew-x: 0;
    --tw-skew-y: 0;
    --tw-scale-x: 1;
    --tw-scale-y: 1;
    --tw-pan-x: ;
    --tw-pan-y: ;
    --tw-pinch-zoom: ;
    --tw-scroll-snap-strictness: proximity;
    --tw-ordinal: ;
    --tw-slashed-zero: ;
    --tw-numeric-figure: ;
    --tw-numeric-spacing: ;
    --tw-numeric-fraction: ;
    --tw-ring-inset: ;
    --tw-ring-offset-width: 0px;
    --tw-ring-offset-color: #fff;
    --tw-ring-color: rgba(59, 130, 246, .5);
    --tw-ring-offset-shadow: 0 0 #0000;
    --tw-ring-shadow: 0 0 #0000;
    --tw-shadow: 0 0 #0000;
    --tw-shadow-colored: 0 0 #0000;
    --tw-blur: ;
    --tw-brightness: ;
    --tw-contrast: ;
    --tw-grayscale: ;
    --tw-hue-rotate: ;
    --tw-invert: ;
    --tw-saturate: ;
    --tw-sepia: ;
    --tw-drop-shadow: ;
    --tw-backdrop-blur: ;
    --tw-backdrop-brightness: ;
    --tw-backdrop-contrast: ;
    --tw-backdrop-grayscale: ;
    --tw-backdrop-hue-rotate: ;
    --tw-backdrop-invert: ;
    --tw-backdrop-opacity: ;
    --tw-backdrop-saturate: ;
    --tw-backdrop-sepia: ;
}
:after, :before {
    --tw-content: "";
}
*, :after, :before {
    box-sizing: border-box;
    border: 0 solid #f9f9f9;
}
*, :after, :before {
    --tw-border-spacing-x: 0;
    --tw-border-spacing-y: 0;
    --tw-translate-x: 0;
    --tw-translate-y: 0;
    --tw-rotate: 0;
    --tw-skew-x: 0;
    --tw-skew-y: 0;
    --tw-scale-x: 1;
    --tw-scale-y: 1;
    --tw-pan-x: ;
    --tw-pan-y: ;
    --tw-pinch-zoom: ;
    --tw-scroll-snap-strictness: proximity;
    --tw-ordinal: ;
    --tw-slashed-zero: ;
    --tw-numeric-figure: ;
    --tw-numeric-spacing: ;
    --tw-numeric-fraction: ;
    --tw-ring-inset: ;
    --tw-ring-offset-width: 0px;
    --tw-ring-offset-color: #fff;
    --tw-ring-color: rgba(59, 130, 246, .5);
    --tw-ring-offset-shadow: 0 0 #0000;
    --tw-ring-shadow: 0 0 #0000;
    --tw-shadow: 0 0 #0000;
    --tw-shadow-colored: 0 0 #0000;
    --tw-blur: ;
    --tw-brightness: ;
    --tw-contrast: ;
    --tw-grayscale: ;
    --tw-hue-rotate: ;
    --tw-invert: ;
    --tw-saturate: ;
    --tw-sepia: ;
    --tw-drop-shadow: ;
    --tw-backdrop-blur: ;
    --tw-backdrop-brightness: ;
    --tw-backdrop-contrast: ;
    --tw-backdrop-grayscale: ;
    --tw-backdrop-hue-rotate: ;
    --tw-backdrop-invert: ;
    --tw-backdrop-opacity: ;
    --tw-backdrop-saturate: ;
    --tw-backdrop-sepia: ;
}
:after, :before {
    --tw-content: "";
}
*, :after, :before {
    box-sizing: border-box;
    border: 0 solid #f9f9f9;
}
::backdrop {
    --tw-border-spacing-x: 0;
    --tw-border-spacing-y: 0;
    --tw-translate-x: 0;
    --tw-translate-y: 0;
    --tw-rotate: 0;
    --tw-skew-x: 0;
    --tw-skew-y: 0;
    --tw-scale-x: 1;
    --tw-scale-y: 1;
    --tw-pan-x: ;
    --tw-pan-y: ;
    --tw-pinch-zoom: ;
    --tw-scroll-snap-strictness: proximity;
    --tw-ordinal: ;
    --tw-slashed-zero: ;
    --tw-numeric-figure: ;
    --tw-numeric-spacing: ;
    --tw-numeric-fraction: ;
    --tw-ring-inset: ;
    --tw-ring-offset-width: 0px;
    --tw-ring-offset-color: #fff;
    --tw-ring-color: rgba(59, 130, 246, .5);
    --tw-ring-offset-shadow: 0 0 #0000;
    --tw-ring-shadow: 0 0 #0000;
    --tw-shadow: 0 0 #0000;
    --tw-shadow-colored: 0 0 #0000;
    --tw-blur: ;
    --tw-brightness: ;
    --tw-contrast: ;
    --tw-grayscale: ;
    --tw-hue-rotate: ;
    --tw-invert: ;
    --tw-saturate: ;
    --tw-sepia: ;
    --tw-drop-shadow: ;
    --tw-backdrop-blur: ;
    --tw-backdrop-brightness: ;
    --tw-backdrop-contrast: ;
    --tw-backdrop-grayscale: ;
    --tw-backdrop-hue-rotate: ;
    --tw-backdrop-invert: ;
    --tw-backdrop-opacity: ;
    --tw-backdrop-saturate: ;
    --tw-backdrop-sepia: ;
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
        display: inline-block;
        margin-right: 40px; /* 상품 오른쪽 여백을 늘림 */
        margin-left: 40px; /* 상품 왼쪽 여백을 늘림 */
        vertical-align: top; /* 상품들이 상단 정렬되도록 설정 */
    }
    .product-box {
        border: 2px solid #ccc; /* 테두리 두께 설정 */
        padding: 20px;
        width: 300px; /* 상품 박스 너비 설정 */
        margin-bottom: 20px; /* 상품 박스 아래 간격 조절 */
    }
    .product-name {
        font-size: 20px;
        font-family: sans-serif;
    }
    .price {
        font-size: 18px;
        font-weight: bold;
        color: black; /* 가격 텍스트 색상 설정 */
    }
    .separator {
        border-right: 1px solid #ccc; /* 수직 구분선 설정 */
        height: 20px;
        margin: 0 10px; /* 구분선 좌우 여백 설정 */
        display: inline-block;
    }
    
    .product-image {
        /* 이미지를 감싸는 div의 스타일링을 여기에 추가합니다 */
        width: 100%; /* 원하는 너비로 조정할 수 있습니다 */
        height: auto; /* 이미지 비율 유지를 위해 높이를 자동으로 조정합니다 */
    }

    .product-image img {
        /* 이미지 스타일링을 여기에 추가합니다 */
        display: block; /* 이미지를 블록 요소로 설정하여 텍스트 흐름에 영향을 받지 않도록 합니다 */
        max-width: 100%; /* 부모 요소인 product-image에 맞추기 위해 이미지의 최대 너비를 100%로 설정합니다 */
        height: auto; /* 이미지의 높이를 자동으로 조정하여 이미지 비율을 유지합니다 */
    }
    
</style>
</head>
<body>
<div class="h-full lg:h-20 xl:h-24 px-0 lg:px-8 2xl:px-16 max-w-[1024px] min-[1600px]:max-w-[1280px] flex items-center mx-auto box-content justify-between relative before:absolute before:w-screen before:bg-[#F1F1F1] before:bottom-0"><aside class="max-[1279px]:hidden absolute w-[98px] space-y-2 z-30 flex flex-col min-h-[306px] px-2 py-2 rounded bg-white border border-gray-300 top-44 -right-20">
</aside>
<div class="relative hidden ms-7 me-7 xl:ms-9 lg:block flex-1">
  <div class="relative flex items-center justify-between w-full rounded-md bg-borderBottom">
      <label for="search" class="flex items-center justify-between">
        <span class="absolute top-0 left-0 flex items-center justify-center flex-shrink-0 w-12 h-full cursor-pointer md:w-14 focus:outline-none"><svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" class="w-[16px] h-[16px] text-heading"><path d="M10.0278 19.0556C14.3233 19.0556 17.8056 15.5733 17.8056 11.2778C17.8056 6.98223 14.3233 3.5 10.0278 3.5C5.73223 3.5 2.25 6.98223 2.25 11.2778C2.25 15.5733 5.73223 19.0556 10.0278 19.0556Z" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" fill="transparent"></path><path d="M21 21.8999L15.5 16.8999" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path></svg>
        </span>
        <form action="<c:url value="/product/list"/>" method="get"> 
         <input type="hidden" value="${num }" name="mNum">
         <input type="hidden" value="${TName }" name="tName">
         <input type="hidden" value="${MName}" name="mName">
         <input type="hidden" value="${pm.cri.place}" name="place">
         <input type="hidden" value="${pm.cri.minPrice}" name="minPrice">
         <input type="hidden" value="${pm.cri.maxPrice}" name="maxPrice">
         <input type="search" id="search-header" class="w-full h-10 text-sm placeholder-gray-400 bg-transparent rounded-md outline-none ga4_main_top_search pe-4 ps-14 text-heading lg:text-base placeholder:text-sm" placeholder="어떤 상품을 찾으시나요?" aria-label="search-header" autocomplete="off" name="search" value="${pm.cri.search }">
         </form>
      </label>
   </div>

<div class="bg-white flex flex-col h-full max-h-64vh lg:max-h-[550px] w-full z-10 absolute h-auto shadow-header hidden mt-4">
<div class="os-host os-host-foreign os-theme-thin os-host-flexbox os-host-resize-disabled os-host-scrollbar-horizontal-hidden os-host-scrollbar-vertical-hidden os-host-transition">
<div class="os-resize-observer-host observed">
<div class="os-resize-observer" style="left: 0px; right: auto;">
</div>
</div>
<div class="os-size-auto-observer observed" style="height: calc(100% + 1px); float: left;">
<div class="os-resize-observer">
</div>
</div>
<div class="os-content-glue" style="margin: 0px;">
</div>
<div class="os-padding">
<div class="os-viewport os-viewport-native-scrollbars-invisible os-viewport-native-scrollbars-overlaid">
<div class="os-content" style="padding: 0px; height: 100%; width: 100%;">
<div class="h-full bg-white border rounded-md rounded-t-none border-gray-150">
<div class="flex justify-center items-center h-[528px]">
</div>
</div>
</div>
</div>
</div>

<div class="os-scrollbar os-scrollbar-horizontal os-scrollbar-unusable os-scrollbar-auto-hidden">
  <div class="os-scrollbar-track os-scrollbar-track-off">
    <div class="os-scrollbar-handle" style="transform: translate(0px, 0px);">
    </div>
  </div>
 </div>
 
 <div class="os-scrollbar os-scrollbar-vertical os-scrollbar-unusable os-scrollbar-auto-hidden"> 
    <div class="os-scrollbar-track os-scrollbar-track-off">
       <div class="os-scrollbar-handle" style="transform: translate(0px, 0px);">
       </div>
    </div>
 </div>
 
 <div class="os-scrollbar-corner">
  </div>
 </div>
 </div>
 </div>
 
 <div class="hidden lg:flex relative w-[300px]">
   <ul class="flex w-full text-sm font-medium list-none text-jnGray-900 break-keep">
    <li class="flex items-center justify-center pr-3">
    <button class="ga4_main_top_menu flex items-center justify-center">
   <div class="relative cursor-pointer" id="채팅하기"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" id="채팅하기" size="24">
    <path stroke="#141313" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M20.797 12.2c0 1.639-.438 3.175-1.204 4.5l.46 3.035a.9.9 0 0 1-1.23.968l-2.526-.708a9 9 0 1 1 4.5-7.796" clip-rule="evenodd"></path>
    <path fill="#141313" stroke="#141313" stroke-width="0.15" d="M8.864 12.2a1.075 1.075 0 1 0-2.15 0 1.075 1.075 0 0 0 2.15 0Zm4 0a1.075 1.075 0 1 0-2.15 0 1.075 1.075 0 0 0 2.15 0Zm4 0a1.075 1.075 0 1 0-2.15 0 1.075 1.075 0 0 0 2.15 0Z"></path></svg>
   </div>
     <p id="채팅하기" class="ml-1">채팅하기</p>
      </button></li><li class="after:contents-[&quot;&quot;] after:absolute after:w-[1px] after:h-4 after:bg-jnGray-300 after:right-0 before:contents-[&quot;&quot;] before:absolute before:w-[1px] before:h-4 before:bg-jnGray-300 before:left-0 ga4_main_top_menu relative flex items-center justify-center px-3"><a class="flex items-center justify-center [&amp;>p]:ml-1" href="/product/form?type=regist"><svg id="판매하기" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M13.6859 20.6926H4.92323C3.88605 20.6926 3.08773 19.8241 3.20716 18.8409L4.49579 8.32142C4.5775 7.63983 5.18096 7.12109 5.89756 7.12109H15.8168C16.5334 7.12109 17.1369 7.6338 17.2186 8.32142L17.91 14.0701" stroke="currentColor" stroke-width="1.5"></path><path d="M8.35938 9.35156V9.5868C8.35938 10.7751 9.47828 11.7462 10.8486 11.7462C12.219 11.7462 13.3379 10.7751 13.3379 9.5868V9.35156" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path><path d="M7.35938 7.72983V6.25112C7.35938 4.34555 8.90414 2.80078 10.8097 2.80078V2.80078C12.7153 2.80078 14.26 4.34555 14.26 6.25112V7.72983" stroke="currentColor" stroke-width="1.5"></path><path d="M17.1179 22.4245C19.3694 22.4245 21.1968 20.5969 21.1968 18.347C21.1968 16.0972 19.3694 14.2695 17.1179 14.2695C14.8665 14.2695 13.0391 16.0972 13.0391 18.347C13.0391 20.5969 14.8665 22.4245 17.1179 22.4245Z" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path><path d="M17.1406 19.9298V16.7461" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"></path><path d="M15.5312 18.3439H18.7149" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"></path></svg>
     <p id="판매하기">판매하기</p></a></li><li class="relative flex flex-1 pl-3"><button class="flex items-center justify-center [&amp;>p]:ml-1"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" size="24"><path stroke="#141313" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M16.775 7.716a3.619 3.619 0 1 1-7.238.005 3.619 3.619 0 0 1 7.238-.005M13.15 13.371c-4.026 0-7.298 3.184-7.4 7.145h14.8c-.102-3.961-3.374-7.145-7.4-7.145"></path></svg>
     <p>마이</p></button></li></ul></div></div>

<table class="hidden lg:table filterTable">
<tbody>
<tr>
<td>카테고리</td>
<td>
<div class="flex items-center w-full chawkbazarBreadcrumb">
	${TName }
	&gt;
	${MName }
</div>
</td>
</tr>
<tr>
<td>가격</td>
<td class="price-filter">
<form action="<c:url value="/product/list"/>" method="get">
<input type="hidden" value="${TName }" name="tName">
<input type="hidden" value="${MName}" name="mName">
<input type="hidden" value="${num }" name="mNum">
<input type="hidden" value="${pm.cri.place }" name="place">
<input type="hidden" value="${pm.cri.search }" name="search">
<input type="number" class="w-[152px] border rounded border-jnGray-200 py-[10px] px-4 text-sm font-medium" placeholder="최소 가격" data-idx="0" name="minPrice" value="${pm.cri.minPrice }">
<span class="mx-[6px]"><svg xmlns="http://www.w3.org/2000/svg" width="10" height="4" fill="none" class="inline">
<path fill="#5A616B" d="M7.895.628 9.297.62q0 .651-.182 1.205-.182.545-.515.947-.326.401-.788.628-.454.22-1 .22-.636 0-1.129-.25-.484-.258-1.045-.773a3.5 3.5 0 0 0-.652-.507 1.25 1.25 0 0 0-.651-.182.94.94 0 0 0-.584.182 1.14 1.14 0 0 0-.378.5 2 2 0 0 0-.137.757H.796q0-.659.183-1.197.18-.545.507-.931.333-.395.788-.606a2.3 2.3 0 0 1 1-.213q.636 0 1.144.266.516.265 1.046.757.363.349.659.523.295.174.628.174a1 1 0 0 0 .599-.19q.257-.196.401-.537a1.95 1.95 0 0 0 .144-.765"></path>
</svg></span>
<input type="number" class="w-[152px] border rounded border-jnGray-200 py-[10px] px-4 text-sm font-medium" placeholder="최대 가격" data-idx="1" name="maxPrice" value="${pm.cri.maxPrice }">
<button class="w-full mt-3 lg:mt-0 lg:w-auto bg-jnBlack py-[10px] px-4 m-0 lg:mx-2 rounded text-sm font-medium text-white">적용</button>
</form>
</td>
</tr>
<tr>
<td>거래 희망 주소</td>
<td class="price-filter">
<form action="<c:url value="/product/list"/>" method="get">
<input type="hidden" value="${TName }" name="tName">
<input type="hidden" value="${MName}" name="mName">
<input type="hidden" value="${num }" name="mNum">
<input type="hidden" value="address" name="type">
<input type="hidden" value="${pm.cri.minPrice }" name="minPrice">
<input type="hidden" value="${pm.cri.maxPrice }" name="maxPrice">
<input type="hidden" value="${pm.cri.search }" name="search">
<input type="text" class="w-[152px] border rounded border-jnGray-200 py-[10px] px-4 text-sm font-medium" placeholder="거래 희망 장소" data-idx="0" name="place" value="${pm.cri.place }">
<button class="w-full mt-3 lg:mt-0 lg:w-auto bg-jnBlack py-[10px] px-4 m-0 lg:mx-2 rounded text-sm font-medium text-white">적용</button>
</form>
</td>
</tr>
<tr>
<td>옵션</td>
<td>
<ul class="flex undefined">
<li class="mr-5">
<label for="saleYn" class="flex items-center justify-start text-base font-medium break-all cursor-pointer text-jnBlack">
<svg width="20" height="20" viewBox="2 2 20 20" fill="#C2C6CE" xmlns="http://www.w3.org/2000/svg" class="mr-1 pointer-events-none">
<path d="M12 21C16.9706 21 21 16.9706 21 12C21 7.02944 16.9706 3 12 3C7.02944 3 3 7.02944 3 12C3 16.9706 7.02944 21 12 21Z" stroke="#C2C6CE" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
<path d="M16 9L10.5 14.5L8 12" stroke="#FFFFFF" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
</svg>
<span class="text-base ps-1">모든 상품 보기</span>
</label>
<label for="saleZn" class="flex items-center justify-start text-base font-medium break-all cursor-pointer text-jnBlack">
<svg width="20" height="20" viewBox="2 2 20 20" fill="#C2C6CE" xmlns="http://www.w3.org/2000/svg" class="mr-1 pointer-events-none">
<path d="M12 21C16.9706 21 21 16.9706 21 12C21 7.02944 16.9706 3 12 3C7.02944 3 3 7.02944 3 12C3 16.9706 7.02944 21 12 21Z" stroke="#C2C6CE" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
<path d="M16 9L10.5 14.5L8 12" stroke="#FFFFFF" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
</svg>
<span class="text-base ps-1">판매완료 상품 제거</span>
</label>
<input id="saleYn" name="state" class="hidden" type="radio" value="all" <c:if test="${pm.cri.state == 'all' }">checked</c:if>>
<input id="saleZn" name="state" class="hidden" type="radio" value="except" <c:if test="${pm.cri.state == 'except' }">checked</c:if>>
</li>
</ul>
</td>
</tr>
</tbody>
</table>
		 <table>
		    <h5>현재 페이지의 상품가격을 비교해봤어요</h5>
		    <thead>
		        <tr>
		            <th>평균 가격</th>
		            <th>가장 높은 가격</th>
		            <th>가장 낮은 가격</th>
		        </tr>
		    </thead>
		    <tbody>
		        <tr>
		            <td>${avgPrice }</td>
		            <td>${maxPrice }</td>
		            <td>${minPrice }</td>
		        </tr>
		    </tbody>
		  </table>
		  
		<select class="form-control col-4 offset-8 mb-4" name="order">
			<option value="pr_num" <c:if test="${pm.cri.order == 'pr_num' }">selected</c:if>>최신순</option>
			<option value="pr_view" <c:if test="${pm.cri.order == 'pr_view' }">selected</c:if>>조회수순</option>
			<option value="pr_basket" <c:if test="${pm.cri.order == 'pr_basket' }">selected</c:if>>찜순</option>
			<option value="desc" <c:if test="${pm.cri.order == 'desc' }">selected</c:if>>가격 높은순</option>
			<option value="asc" <c:if test="${pm.cri.order == 'asc' }">selected</c:if>>가격 낮은순</option>
		</select>


	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>대분류</th>
				<th>중분류</th>
				<th>제목</th>
				<th>작성자</th>
				<th>찜수</th>
				<th>가격</th>
				<th>거래 희망 장소</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>판매상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${pList}" var="pro">
				<tr>
					<td>${pro.pr_num }</td>
					<td>${pro.pr_tg_name }</td>
					<td>${pro.pr_mg_name }</td>
					<td>
						<a href="<c:url value="/product/detail?pNum=${pro.pr_num }"/>">${pro.pr_name}</a>
					</td>
					<td>${pro.pr_me_id }</td>
					<td>${pro.pr_basket }</td>
					<td>${pro.pr_price }</td>
					<td>${pro.pr_place }</td>
					<td>${pro.pr_date }</td>
					<td>${pro.pr_view }</td>
					<td>${pro.pr_ps_state }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
   <h1>상품 목록</h1>
    <c:forEach var="pro" items="${pList}" varStatus="loop">
        <div class="product-container">
         <!-- 이미지 추가 -->
          <div class="product-image">
          <c:if test="${pro.fileList.size() >=1 }">
          	<img src="<c:url value="/download${pro.fileList.get(0).fi_name}"/>" alt="${pro.pr_name}">
          </c:if>
          </div>
          <div class="product-box">
              <h2 class="product-name">${pro.pr_name}</h2>
              <p class="price">
              <c:choose>
			    <c:when test="${pro.pr_price == 0}">
	               무료 나눔
			    </c:when>  
			    <c:when test="${pro.pr_price < 0}">
			       가격 제안
			    </c:when>
			    <c:otherwise>
			       ${pro.pr_price }
			    </c:otherwise>
			 </c:choose>    
              </p>
              <span class="separator"></span>
              <p class="place">${pro.pr_place}</p>
              <span class="separator"></span>
              <p class="date">${pro.time}</p>
          </div>
        </div>
        <c:if test="${loop.index % 5 == 4}"> <!-- 한 줄에 5개의 상품이 들어가면 줄 바꿈 -->
            <br>
        </c:if>
    </c:forEach>
	
	
	<ul class="pagination justify-content-center">
		<c:if test="${pm.prev}">
			<li class="page-item">
				<c:url var="url" value="/product/list">
					<c:param name="page" value="${pm.startPage - 1}"/>
					<c:param name="mNum" value="${num}"/>
					<c:param name="mName" value="${MName}"/>
					<c:param name="tName" value="${TName}"/>
					<c:param name="search" value="${pm.cri.search}"/>
					<c:param name="minPrice" value="${pm.cri.minPrice}"/>
					<c:param name="maxPrice" value="${pm.cri.maxPrice}"/>
					<c:param name="order" value="${pm.cri.order}"/>
					<c:param name="place"  value="${pm.cri.place }" />
				</c:url>
				<a class="page-link" href="${url}">이전</a>
			</li>
		</c:if>
		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			<c:set var="active" value="${pm.cri.page == i ?'active':'' }"/>
			<li class="page-item ${active}">
				<c:url var="url" value="/product/list">
					<c:param name="page" value="${i}"/>
					<c:param name="mNum" value="${num}"/>
					<c:param name="mName" value="${MName}"/>
					<c:param name="tName" value="${TName}"/>
					<c:param name="search" value="${pm.cri.search}"/>
					<c:param name="minPrice" value="${pm.cri.minPrice}"/>
					<c:param name="maxPrice" value="${pm.cri.maxPrice}"/>
					<c:param name="order" value="${pm.cri.order}"/>
					<c:param name="place"  value="${pm.cri.place }" />
				</c:url>
				<a class="page-link" href="${url}">${i}</a>
			</li>
		</c:forEach>
		<c:if test="${pm.next}">
			<li class="page-item">
				<c:url var="url" value="/product/list">
					<c:param name="page" value="${pm.endPage + 1}"/>
					<c:param name="mNum" value="${num}"/>
					<c:param name="mName" value="${MName}"/>
					<c:param name="tName" value="${TName}"/>
					<c:param name="search" value="${pm.cri.search}"/>
					<c:param name="minPrice" value="${pm.cri.minPrice}"/>
					<c:param name="maxPrice" value="${pm.cri.maxPrice}"/>
					<c:param name="order" value="${pm.cri.order}"/>
					<c:param name="place"  value="${pm.cri.place }" />
				</c:url>
				<a class="page-link" href="${url}">다음</a>
			</li>
		</c:if>
	</ul>
	
<script type="text/javascript">
$("[name=order]").change(function(){
	console.log(123);
	let state = '${pm.cri.state}';
	let mNum = '${num}';
	let mName = '${MName}';
	let tName = '${TName}';
	let search = '${pm.cri.search}';
	let place = '${pm.cri.place}';
	let minPrice = '${pm.cri.minPrice}';
	let maxPrice = '${pm.cri.maxPrice}';
	let order = '${order}';
	
	$.ajax({
		url : '<c:url value="/product/list"/>',
		method : 'get',
		async : true,
		data : {
			"state" : state,
			"mNum" : mNum,
			"mName" : mName,
			"tName" : tName,
			"search" : search,
			"place" : place,
			"minprice" : minPrice,
			"maxPrice" : maxPrice,
			"order" : order
		},
		success : function(data){
			console.log(data);
		}
	});
	
});
</script>

<script type="text/javascript">
$("[name=state]").change(function(){
	let state = '${state}';
	let mNum = '${num}';
	let mName = '${MName}';
	let tName = '${TName}';
	let search = '${pm.cri.search}';
	let place = '${pm.cri.place}';
	let minPrice = '${pm.cri.minPrice}';
	let maxPrice = '${pm.cri.maxPrice}';
	let order = '${pm.cri.order}';
	
	$.ajax({
		url : '<c:url value="/product/list"/>',
		method : 'get',
		async : true,
		data : {
			"state" : state,
			"mNum" : mNum,
			"mName" : mName,
			"tName" : tName,
			"search" : search,
			"place" : place,
			"minprice" : minPrice,
			"maxPrice" : maxPrice,
			"order" : order
		},
		success : function(data){
			
		}
	});
});

</script>
</body>
</html>