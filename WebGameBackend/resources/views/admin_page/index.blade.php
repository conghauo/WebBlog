<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Game Page</title>
 <link rel="stylesheet" href="{{ asset('/forum/assets/forum.css?v=045dd903') }}">
<link rel="preload" href="{{ asset('/forum/assets/forum.css?v=045dd903') }}" as="style">


<link rel="preload" href="{{ asset('/forum/assets/fonts/fa-solid-900.woff2') }}" as="font" type="font/woff2" crossorigin="">
<link rel="preload" href="{{ asset('/forum/assets/fonts/fa-regular-400.woff2') }}" as="font" type="font/woff2" crossorigin="">
    <!-- CSS only -->
    <link
      href="{{ asset('/admin_page/css/bootstrap-icons-1.9.1/bootstrap.min.css') }}"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="{{asset('/admin_page/css/bootstrap3.3.5.css') }}"
    />
    <link
      rel="stylesheet"
      href="{{ asset('/admin_page/css/3.3.5-bootstrap.min.css') }}"
    />

    <link rel="stylesheet" href="{{ asset('/admin_page/css/style.css') }}" />
  </head>

  <body>
   <div id="app" class="App affix BlogOverviewPage " aria-hidden="false">

    <div id="app-navigation" class="App-navigation"><div class="Navigation ButtonGroup App-backControl"><button onfocusin="showMenu()" class="Button Button--icon Navigation-drawer hasIcon" type="button" aria-label="Mở ngăn điều hướng"><i aria-hidden="true" class="icon fas fa-bars Button-icon"></i><span class="Button-label"></span></button></div></div>
   <div id="drawer" class="App-drawer"  >
        <header id="header" class="App-header navbar-fixed-top">
            <div id="header-navigation" class="Header-navigation"><div class="Navigation ButtonGroup "></div></div>
            <div class="container">
                <h1 class="Header-title">
                    <a href="{{ asset('/forum') }}" id="home-link">
                                                    <img src="http://192.168.1.81/forum/assets/logo-euvhdhxb.png" alt="hunbae" class="Header-logo">
                                            </a>
                </h1>
               <div id="header-primary" class="Header-primary ButtonGroup"><button class="Dropdown-toggle Button"><span aria-hidden="true"id="Times" class="Button-icon">10 mins 25 secs </span></button> </div>

		<div id="header-secondary" class="Header-secondary"><ul class="Header-controls"><li class="item-search"> 
	<div role="search" aria-label="Tìm kiếm trên diễn đàn" class="Search"><div class="Search-input"></div><ul class="Dropdown-menu Search-results" aria-hidden="" style="max-height: 249px;"></ul></div></li><li class="item-locale"><div class="ButtonGroup Dropdown dropdown  Dropdown--select itemCount2"><ul class="Dropdown-menu dropdown-menu "><li class=""><button class="hasIcon" type="button" active=""><span class="Button-label">Tiếng Việt</span></button></li><li class=""><button class="hasIcon" type="button"><span class="Button-label">English</span></button></li></ul></div></li><li class="item-flags"><div class="ButtonGroup Dropdown dropdown NotificationsDropdown itemCount0"><div class="Dropdown-menu Dropdown-menu--right"></div></div></li><li class="item-notifications"><div class="ButtonGroup Dropdown dropdown NotificationsDropdown itemCount0"><div class="Dropdown-menu Dropdown-menu--right"></div></div></li><li class="item-session"><div class="ButtonGroup Dropdown dropdown SessionDropdown itemCount5"><button class="Dropdown-toggle Button Button--user Button--flat" aria-haspopup="menu" aria-label="Chuyển đổi menu thả xuống tùy chọn phiên" data-toggle="dropdown" aria-expanded="false"><span class="Avatar " id="Avatar" loading="lazy" style="--avatar-bg: #a0e5c3;">C</span> <span class="Button-label"><span class="username"id="username" >conghauAdmin</span></span></button><ul class="Dropdown-menu dropdown-menu Dropdown-menu--right"><li class="item-profile"><a id="hasIcon" class="hasIcon" href="/forum/u/conghauAdmin" active="false"><i aria-hidden="true" class="icon fas fa-user Button-icon"></i><span class="Button-label">Trang cá nhân</span></a></li><li class="item-settings"><a class="hasIcon" href="/payment" active="false"><i aria-hidden="true" class="icon fas fa-cog Button-icon"></i><span class="Button-label"> Thanh Toán</span></a></li><li class="item-administration"><a class="hasIcon" href="/game-admin" target="_blank" active="false"><i aria-hidden="true" class="icon fas fa-wrench Button-icon"></i><span class="Button-label">Trang quản trị</span></a></li><li class="Dropdown-separator"></li><li class="item-logOut"><button class="hasIcon" type="button"><i aria-hidden="true" class="icon fas fa-sign-out-alt Button-icon"></i><span class="Button-label">Đăng xuất</span></button></li></ul></div></li></ul></div>
            </div>
        </header>
    </div>
	<main class="App-content"  onfocusin="hideMenu()">
    <div class="wrapper">
      <!-- Sidebar Holder -->
      <nav id="sidebar">
        <div class="sidebar-header" id="sidebar-title">
          <h3><i class="bi bi-envelope-paper-heart-fill"></i> Admin Page</h3>
          <strong><i class="bi bi-list"></i></strong>
        </div>

        <ul class="list-unstyled components">
          <li class="active">
            <a href="{{route('game-admin')}}">
              <i class="bi bi-house"></i>
              Home
            </a>
          </li>
          <li class="">
            <a href="{{route('admin-game1')}}">
              <i class="bi bi-image"></i>
              Game 1
            </a>
          </li>
          <li class="">
            <a href="{{route('admin-game2')}}">
              <i class="bi bi-clipboard"></i>
              Game 2
            </a>
          </li>
		    <li class="">
            <a href="{{route('admin-payments')}}">
              <i class="bi bi-cash-coin"></i>
              Payments
            </a>
          </li>
        </ul>
      </nav>

      <!-- Page Content Holder -->
      <div id="content">
        <div class="container" style="max-width: 90%"></div>
      </div>
    </div>
<main class="App-content"  onfocusin="hideMenu()">
    <!-- JavaScript Bundle with Popper -->
    <script
      src="{{ asset('/admin_page/js/bootstrap.bundle.min.js') }}"
    ></script>
    <script src="{{ asset('/admin_page/js/storage.js') }}"></script>
	 <script  type="module" src="{{ asset('/admin_page/js/header.js') }}"></script>
 
  </body>
</html>
